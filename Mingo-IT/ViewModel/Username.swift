//
//  Username.swift
//  Mingo-IT
//
//  Created by tiyas aria on 07/06/23.
//

import SwiftUI


class UserManager  : ObservableObject {
    @AppStorage("user_signin") var currentUserSignIn : Bool = false
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    @AppStorage("currentUser") var currentUsername : String?
}
