import SwiftUI
import UniformTypeIdentifiers

struct DragAndDrop: View {
    @Binding var userAnswer: [String]
    
    @State var items: [String]
    @State var objectsReceived: [[String]] = Array(repeating: Array(repeating: "", count: 1), count: 10)
    
    var itemCount = 0
    
    init(userAnswer: Binding<[String]>, items: [String]) {
        _userAnswer = userAnswer
        self.items = items
        
        itemCount = self.items.count
        objectsReceived = Array(repeating: Array(repeating: "", count: 1), count: itemCount)
    }
    
    var body: some View {
        VStack {
            VStack {
                ForEach(items,
                        id: \.self) { obj in
                    Text(obj)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("primaryBlue"))
                        )
                        .onDrag {
                            let item = NSItemProvider(object: obj as NSString)
                            
                            item.loadDataRepresentation(forTypeIdentifier: UTType.text.identifier) { (data, error) in
                                if let textData = data, let extractedText = String(data: textData, encoding: .utf8) {
                                    // Handle the extracted text
                                    items.removeAll { $0 == extractedText }
                                }
                            }
                            
                            
                            return item
                        }
                }
            }
            .onDrop(of: [.plainText], delegate: TextDropDelegatee(objects: $items, objectsReceived: $objectsReceived, userAnswer: $userAnswer))
            
            VStack(spacing: -20) {
                ForEach(0..<itemCount, id: \.self) { i in
                    ZStack {
                        if objectsReceived[i][0] == "" {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("backgroundCard"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("borderCard"), lineWidth: 2)
                                )
                                .onDrop(of: [.plainText], delegate: TextDropDelegate(objects: $objectsReceived[i],objectsReceived: $objectsReceived, userAnswer: $userAnswer))
                                .padding(20)
                        }else {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("backgroundCard"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("borderCard"), lineWidth: 2)
                                )
                                .padding(20)
                        }
                        
                        HStack {
                            ForEach(objectsReceived[i], id: \.self) { obj in
                                Text(obj)
                                    .font(.caption)
                                    .onDrag {
                                        if objectsReceived[i][0] != "" {
                                            objectsReceived[i][0] = ""
                                            return NSItemProvider(object: obj as NSString)
                                        }
                                        return NSItemProvider(object: obj as NSString)
                                    }
                            }
                        }
                    }
                    .onDrop(of: [.plainText], delegate: TextDropDelegatee(objects: $items, objectsReceived: $objectsReceived, userAnswer: $userAnswer))
                    .frame(height: 100)
                }
            }
        }
    }
}



struct TextDropDelegate: DropDelegate {
    @Binding var objects: [String]
    @Binding var objectsReceived: [[String]]
    @Binding var userAnswer: [String]
    
    func performDrop(info: DropInfo) -> Bool {
        let items = info.itemProviders(for: [.plainText])
        
        for item in items {
            item.loadItem(forTypeIdentifier: "public.text", options: nil) {
                text, _ in
                
                if let data = text as? Data {
                    let inputStr = String(decoding: data, as: UTF8.self)
                    objects[0] = inputStr
                }
            }
        }
        
        userAnswer = [String]()
        
        for obj in objectsReceived {
            userAnswer.append(obj[0])
        }
        
        print(userAnswer.joined())
        
        return true
    }
}

struct TextDropDelegatee: DropDelegate {
    @Binding var objects: [String]
    @Binding var objectsReceived: [[String]]
    @Binding var userAnswer: [String]
    
    func performDrop(info: DropInfo) -> Bool {
        let items = info.itemProviders(for: [.plainText])
        
        for item in items {
            item.loadItem(forTypeIdentifier: "public.text", options: nil) {
                text, _ in
                
                if let data = text as? Data {
                    let inputStr = String(decoding: data, as: UTF8.self)
                    if let index = objects.firstIndex(of: inputStr) {
                        objects.remove(at: index)
                    }
                    objects.append(inputStr)
                }
            }
        }
        
        userAnswer = [String]()
        
        for obj in objectsReceived {
            userAnswer.append(obj[0])
        }
        
        return true
    }
}
