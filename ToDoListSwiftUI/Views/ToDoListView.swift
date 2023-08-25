//
//  ToDoListView.swift
//  ToDoListSwiftUI
//
//  Created by Umut Barış Çoşkun on 23.08.2023.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //Action
                } label: {
                Image(systemName: "plus")
                }
            }
        }
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
