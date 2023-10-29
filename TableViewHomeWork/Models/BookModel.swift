//
//  BookModel.swift
//  TableViewHomeWork
//
//  Created by Mariam Joglidze on 28.10.23.
//

import UIKit

class Book {
    let name: String
    let image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    static let dummyData = [
        Book(
            name: "Pride and Prejudice",
            image: UIImage(named: "pride")!),
        Book(
            name: "Frankenstein",
            image: UIImage(named: "frank")!),
        Book(
            name: "Orlando",
            image: UIImage(named: "orlan")!),
        Book(
            name: "Narrative of the Life of Frederick Douglas",
            image: UIImage(named: "frede")!),
        Book(
            name: "Jane Eyre",
            image: UIImage(named: "jane")!),
        Book(
            name: "The Time Machine",
            image: UIImage(named: "orlan")!),
        Book(
            name: "Women of the Harlem Renaissance",
            image: UIImage(named: "frede")!),
        Book(
            name: "Orlando",
            image: UIImage(named: "frede")!),
        Book(
            name: "Narrative of the Life of Frederick Douglas",
            image: UIImage(named: "jane")!),
        Book(
            name: "Jane Eyre",
            image: UIImage(named: "girWithWine")!),
        Book(
            name: "The Time Machine",
            image: UIImage(named: "orlan")!),
        Book(
            name: "Women of the Harlem Renaissance",
            image: UIImage(named: "orlan")!),
    ]
}
