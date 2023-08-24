//
//  ToDoListSwiftUIApp.swift
//  ToDoListSwiftUI
//
//  Created by Umut Barış Çoşkun on 23.08.2023.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListSwiftUIApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
