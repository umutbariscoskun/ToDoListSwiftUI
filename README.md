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
| ![login](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/dcdef3ab-ef38-49ee-b87b-7cd306432346) | ![register](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/9f52b46f-f429-4b69-9c6b-a5f66d702fe2) |
| Profile | ToDo List |
| ![profile](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/ba61b618-1b1c-4c5a-8f34-4f1aa74d18e0) | ![todo](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/440c3071-1ee0-4e8f-967e-debb5b1073df) |
| New Item| - |
| ![new_item](https://github.com/umutbariscoskun/ToDoListSwiftUI/assets/45595606/97c43784-e019-4f45-9732-66f263125313) |  |








