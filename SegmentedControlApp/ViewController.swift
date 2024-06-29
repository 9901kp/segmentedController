//
//  ViewController.swift
//  SegmentedControlApp
//
//  Created by Даниил Сивожелезов on 22.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdlabel: UILabel!
    @IBOutlet weak var newValueTextField: UITextField!
    @IBOutlet weak var newValueLabel: UILabel!
    
    var contentTypes: [ContentType] = [
            ContentType(name: "Music", titles: ["Classic Rock", "Jazz", "Rock"]),
            ContentType(name: "Books", titles: ["1984", "To Kill a Mockingbird", "The Great Gatsby"]),
            ContentType(name: "Movies", titles: ["Harry Potter", "The Lord of the Rings", "Star Wars"])
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uppdateLabels(for: 0)
        saveData(contentTypes: contentTypes)
        
    }

    func saveData(contentTypes: [ContentType]) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(contentTypes) {
            // Save the encoded data into UserDefaults
            defaults.set(encodedData, forKey: "contentTypes")
        }
    }
    
    @IBAction func addNewValueButton(_ sender: UIButton) {
        guard let newValue = newValueTextField.text, !newValue.isEmpty else { return }
        
        saveNewvalue(newValue: newValue, newvalueIndex: segmentedController.selectedSegmentIndex)
        uppdateLabels(for: segmentedController.selectedSegmentIndex)
    }

    func saveNewvalue(newValue: String, newvalueIndex: Int) {
        contentTypes[newvalueIndex].titles.append(newValue)
    }
    
    @IBAction func segmentedControlChange(_ sender: UISegmentedControl) {
        
        uppdateLabels(for: sender.selectedSegmentIndex)
    }
    
    
    func uppdateLabels(for contentType: Int) {
        let titles: [String] = contentTypes[contentType].titles
        var text = ""
        for i in titles {
            text += "\(i) \n "
        }
        firstLabel.text = text
    }
}

//enum ContentType: Int {
//    
//    case music
//    case movies
//    case books
//    
//    static var customSegmentTitles: [ContentType: [String]] = [
//            .music: ["Classic Rock", "Jazz", "Rock"],
//            .books: ["1984", "To Kill a Mockingbird", "The Great Gatsby"],
//            .movies: ["Harry Potter", "The Lord of the Rings", "Star Wars"]
//            ]
//    
//    func segmentTitles() -> [String] {
//        return ContentType.customSegmentTitles[self] ?? []
//    }
//    
//    func addNewContent(text: String) {
//        ContentType.customSegmentTitles[self]?.append(text)
//    }
// }

struct ContentType: Codable {
    
    var name: String
    var titles: [String]
    
}
