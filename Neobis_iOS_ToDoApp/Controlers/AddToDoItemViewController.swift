//  AddToDoItemViewController.swift
//  Created by Askar Soronbekov


import UIKit

class AddTodoItemViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var titleTextField: UITextField!


    var toDoItems = [ToDoItem]()
    var edit: ((ToDoItem)->())?
    var toEdit = false
    var callback: (()->())?
    
    var titlee = ""
    var descriptionn = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = titlee
        descriptionTextField.text = descriptionn
        descriptionTextField.textContainerInset = UIEdgeInsets.zero
        descriptionTextField.textContainer.lineFragmentPadding = 0
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let newItem = ToDoItem(title: titleTextField.text ?? "", description: descriptionTextField.text ?? "")
        toDoItems.append(newItem)
        saveToDoItems() 
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveToDoItems() {
        if !toEdit {
            if let savedData = try? PropertyListEncoder().encode(toDoItems) {
                UserDefaults.standard.set(savedData, forKey: "ToDoList")
                callback?()
            }
        } else {
            edit?(ToDoItem(title: titleTextField.text ?? "", description: descriptionTextField.text ?? ""))
            toEdit = false
        }
    }
}
