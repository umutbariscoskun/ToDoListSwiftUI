//
//  RegisterViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Umut Barış Çoşkun on 23.08.2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    init(){
        
    }
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            //TODO: SEARCH WEAK SELF
           [weak self ] result,error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    func validate() -> Bool{
     
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,!name.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
         
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
          	
            return false
        }
        
        guard password.count >= 6 else {
          
            return false
        }
        return true
    }
    
  
}
