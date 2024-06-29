//
//  All_Val_ViewController.swift
//  SegmentedControlApp
//
//  Created by Мухаммед Каипов on 29/4/24.
//

import UIKit

class All_Val_ViewController: UIViewController {
    @IBOutlet var content1: UILabel!
    @IBOutlet var content2: UILabel!
    @IBOutlet var content3: UILabel!
    @IBOutlet var type1: UILabel!
    @IBOutlet var type2: UILabel!
    @IBOutlet var type3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    func getData(){
        if let savedData = UserDefaults.standard.data(forKey: "contentTypes") {
            let decoder = JSONDecoder()
            if let loadedItems = try? decoder.decode([ContentType].self, from: savedData) {
                // Use the loaded items
                print(loadedItems)
                updateUI(contentTypes: loadedItems)
            }
        }
        
    }
    
    func updateUI(contentTypes: [ContentType]){
        content1.text = contentTypes[0].name
        content2.text = contentTypes[1].name
        content3.text = contentTypes[2].name
        
        var titlesMusic = contentTypes[0].titles
        var titleBooks = contentTypes[1].titles
        var titleMovies = contentTypes[2].titles
        
        var textMusic = ""
        var textBooks = ""
        var textMovies = ""
        for i in titlesMusic{
            textMusic += "\(i) \n "
        }
        for i in titleBooks{
            textBooks += "\(i) \n"
        }
        for i in titleMovies{
            textMovies += "\(i) \n"
        }

        type1.text = textMusic
        type2.text = textBooks
        type3.text = textMovies
        
    }
    

    
}
