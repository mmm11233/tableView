//
//  AddNewItemToListViewController.swift
//  TableViewHomeWork
//
//  Created by Mariam Joglidze on 29.10.23.
//

import UIKit

protocol AddNewItemDelegate: AnyObject {
    func addItemToList(_ book: Book)
}

class AddNewItemToListViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let nameTextField = UITextField()
    let imageView = UIImageView()
    let imagePicker = UIImagePickerController()
    
    weak var delegate: AddNewItemDelegate?
    var newBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        imagePicker.delegate = self
        
        nameTextField.placeholder = "Enter Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let uploadButton = UIButton(type: .system)
        uploadButton.setTitle("Upload Image", for: .normal)
        uploadButton.addTarget(self, action: #selector(uploadImageTapped), for: .touchUpInside)
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadButton)
        
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.addTarget(self, action: #selector(saveItemTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imageView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 150), // Adjust the height as needed
            
            uploadButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            uploadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            saveButton.topAnchor.constraint(equalTo: uploadButton.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func uploadImageTapped() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func saveItemTapped() {
        guard let name = nameTextField.text, let image = imageView.image else {
            return
        }
        
        let book = Book(name: name, image: image)
        newBook = book
        
        delegate?.addItemToList(book)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}
