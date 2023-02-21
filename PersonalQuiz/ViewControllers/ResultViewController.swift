//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var pictureLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answerResults: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        getResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getResult() {
        var animals: [Animal: Int] = [:]
        
        answerResults.forEach {
            animals[$0.animal] = animals[$0.animal] == nil
            ? 1 : animals[$0.animal]! + 1
        }
        
        guard let resultAnimal = animals.sorted(by: { $0.value > $1.value }).first?.key else {
            return
        }
        updateUI(resultAnimal)
    }
    
    private func updateUI(_ animal: Animal) {
        pictureLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
}
