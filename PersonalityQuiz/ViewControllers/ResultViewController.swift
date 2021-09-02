//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    var currentAnswersFor: [Answer]!
    
    var countedAnimals: [Int] = []
    
    var animal: Animal = .dog
    
    var dogsCount = 0
    var catsCount = 0
    var rabbitsCount = 0
    var turtlesCount = 0
    
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        //countAnimalsInAnswers()
        
        
        animalLabel.text = "Вы: \(findMostPopularAnswer().rawValue)"
        descriptionLabel.text = "\(findMostPopularAnswer().definition)"
    }
    
    
    private func countAnimalsInAnswers() -> [Int] {
        
        for currentAnswerFor in currentAnswersFor {
            switch currentAnswerFor.animal {
            case .dog:
                dogsCount += 1
                countedAnimals.append(dogsCount)
            case .cat:
                catsCount += 1
                countedAnimals.append(catsCount)
            case .rabbit:
                rabbitsCount += 1
                countedAnimals.append(rabbitsCount)
            case .turtle:
                turtlesCount += 1
                countedAnimals.append(turtlesCount)
            }
        }
        return countedAnimals
    }
    
    private func findMostPopularAnswer() -> Animal {
        let sortedAnimals = countedAnimals.sorted(by: > )
        
        if sortedAnimals[0] == dogsCount {
            animal = .dog
        } else if sortedAnimals[0] == catsCount {
            animal = .cat
        } else if sortedAnimals[0] == rabbitsCount {
            animal = .rabbit
        } else {
            animal = .turtle
        }
        return animal
    }
}
