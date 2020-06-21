//
//  ViewController.swift
//  BrainTrainingApp
//
//  Created by Bhawnish Kumar on 6/19/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var imageView: DrawingImageView!
    
    var questions = [Question]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    func numberDrawn(_ image: UIImage) {
        
    }
    
    func setText(for cell: UITableViewCell, at indexPath: IndexPath, to question: Question) {
        if indexPath.row == 0 {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 48)
             } else {
                    cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
                }

                if let actual = question.actual {
                    cell.textLabel?.text = "\(question.text) = \(actual)"
                } else {
                    cell.textLabel?.text = "\(question.text) = ?"
                }
            }
    
    func createQuestion() -> Question {
        var question = ""
        var correctAnswer = 0
        
        while true {
            let firstNumber = Int.random(in: 0...9)
            let secondNumber = Int.random(in: 0...9)
            
            if Bool.random() == true {
                let result = firstNumber + secondNumber
                if result < 10 {
                    question = "\(firstNumber) + \(secondNumber)"
                    correctAnswer = result
                    break
                    
                }
            } else {
                let result = firstNumber - secondNumber
                if result >= 0 {
                    question = "\(firstNumber) - \(secondNumber)"
                    correctAnswer = result
                    break
                }
            }
            
        }
        
        return Question(text: question, correctAnswer: correctAnswer, actual: nil)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentQuestion = questions[indexPath.row]
        setText(for: cell, at: indexPath, to: currentQuestion)
    return cell
        
    }
    
   
    
    
}

