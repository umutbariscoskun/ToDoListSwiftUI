//
//  ToDoListView.swift
//  ToDoListSwiftUI
//
//  Created by Umut Barış Çoşkun on 23.08.2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
  
    
    init(userId: String){
        // TODO: Search for property wrappers, semantic and reason of underscore at 19
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    List(items) { item in
                        ToDoListItemView(item: item)
                            .swipeActions{
                                Button("Delete"){
                                    viewModel.delete(id: item.id)
                                }.tint(.red)
                            }
                    }.listStyle(PlainListStyle())
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "grCHYK4551fxUe6StvzQ3yjuqJF2")
    }
}
