import SwiftUI
import UniformTypeIdentifiers

struct DragAndDrop: View {
    @State var items: [String]
    @State var objectsReceived: [[String]] = Array(repeating: Array(repeating: "", count: 1), count: 10)

    
    var itemCount = 0
    
    
    init(items: [String]) {
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
            .onDrop(of: [.plainText], delegate: TextDropDelegatee(objects: $items))
            
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
                                .onDrop(of: [.plainText], delegate: TextDropDelegate(objects: $objectsReceived[i]) )
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
                    .onDrop(of: [.plainText], delegate: TextDropDelegatee(objects: $items) )
                    .frame(height: 100)
                }
            }
        }
    }
}



struct TextDropDelegate: DropDelegate {
    @Binding var objects: [String]
    
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
        
        return true
    }
}

struct TextDropDelegatee: DropDelegate {
    @Binding var objects: [String]
    
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
        
        return true
    }
}


struct LessonScreenss_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDrop(items: ["Pour the contents of glass C into glass B", "Pour the contents of glass A into glass C", "Pour the contents of glass B into glass A"])
    }
}
