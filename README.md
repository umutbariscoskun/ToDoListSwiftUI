# ToDoList App

#### THIS APP INCLUDES:
- Swift UI
- MVVM
- FirebaseQuery
- Managing state, listening a binding to close sheet

  #Handle user activity for whole app

  ```swift
private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener {
            [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
```


#Use a binding to close sheet

  ```swift
- at newItemView ->
//create a binding
@Binding var newItemPresented: Bool
// - and assign false when you want to close it ->
 newItemPresented = false


- at ToDoList View and ViewModel
//create a published var to manage sheet open and close state
@Published var showingNewItemView = false
// and set it true when button tapped also send it to new item view as a binding ->
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

```



| Login | Register|
| ------------- | ------------- |
| ![login](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/71d226bc-c2bd-4b79-a314-5d29a2c2b3b7) | ![register](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/2ed858b3-4d20-4e08-b199-56c7be15a4a6) |
| Profile | ToDo List |
| ![profile](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/8edcff95-9c68-4958-8b2b-f815b91a35db) | ![todo](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/7fc4227b-3465-482d-8d2d-a873c094da7e) |
| New Item| - |
| ![new_item](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/db1150de-df8d-4de4-8697-88b2a9eeca1c) |  |








