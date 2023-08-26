//
//  ToDoListItemViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Umut Barış Çoşkun on 23.08.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// This is viewModel for single todolist item
/// each row in items list
class ToDoListItemViewModel: ObservableObject {
    
    func toggleIsDone(item: ToDoListItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
        
    }
    
    init(){}
}
