//
//  ToDoListViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Umut Barış Çoşkun on 23.08.2023.
//

import Foundation


/// ViewModel for list of items view
/// primary tab
class ToDoListViewModel: ObservableObject {
    
    @Published var showingNewItemView = false 
    init(){}
}
