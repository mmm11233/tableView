//
//  DetailsViewController.swift
//  TableViewHomeWork
//
//  Created by Mariam Joglidze on 29.10.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = .red
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupBackground()
        setupConstraints()
        configureViews()
    }
    
    // MARK: - Configure
    func configureViews() {
        guard let book else { return }
        nameLabel.text = book.name
        image.image = book.image
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(image)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
