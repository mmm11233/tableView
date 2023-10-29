//
//  ViewController.swift
//  TableViewHomeWork
//
//  Created by Mariam Joglidze on 28.10.23.
//

import UIKit

class MainViewController: UIViewController, AddNewItemDelegate {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var books = Book.dummyData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavBar()
        view.addSubview(tableView)
        view.backgroundColor = .white
        setupTableView()
        setupTableViewConstraints()
    }
    
    func addItemToList(_ book: Book) {
        books.append(book)
        
        tableView.reloadData()
    }
    
    func setUpNavBar() {
        title = "Books List"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addItemTapped() {
        let addItemViewController = AddNewItemToListViewController()
        addItemViewController.delegate = self
        self.navigationController?.pushViewController(addItemViewController, animated: true)
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainViewControllerCell.self, forCellReuseIdentifier: "cell")
    }
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let mainViewControllerCell = cell as? MainViewControllerCell {
            mainViewControllerCell.configure(with: book)
        }
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let book = books[safe: indexPath.row] {
            let detailsViewController = DetailsViewController()
            detailsViewController.book = book
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
