//
//  ContentView.swift
//  ToDoListSwiftUI
//
//  Created by Umut Barış Çoşkun on 23.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
            
        }else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage:"house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage:"person.circle")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
