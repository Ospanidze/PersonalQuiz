//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var pictureLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var answerResults: [Answer]!
    var animals: [Animal: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getResult() {
        answerResults.forEach {
            animals[$0.animal] = animals[$0.animal] == nil
            ? 1 : animals[$0.animal]! + 1
        }
        
        let count = animals.values.count / 2
        guard let someAnimal = animals.filter({ $0.value >= count }).first?.key else {
            return
        }
        pictureLabel.text = String(someAnimal.rawValue)
       
        switch someAnimal {
        case .dog:
            nameLabel.text = "Вы - Cобака"
        case .cat:
            nameLabel.text = "Вы - Кот/кошка"
        case .rabbit:
            nameLabel.text = "Вы - Кролик"
        case .turtle:
            nameLabel.text = "Вы - Черепаха"
        }
    }
}
