//
//  ViewController.swift
//  Project2
//
//  Created by Juan David Chaves Rodriguez on 27/01/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var attempts = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries +=  ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Next Guess: \(countries[correctAnswer].uppercased()) || Your score: \(score)"
    }
    
    func resetGame(action: UIAlertAction! = nil) {
        score = 0
        attempts = 0
        
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        attempts += 1
        
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
            message = "Your Score is \(score)"
        } else {
            title = "Wrong"
            message = "That's the flag of \(countries[sender.tag])! \n Your Score is \(score)"
            score -= 1
        }
        
        if attempts == 5 {
            print("hasta aqui!")
            let acFinal = UIAlertController(title: title, message: "Your final score is \(score)", preferredStyle: .alert)
            acFinal.addAction(UIAlertAction(title: "Try Again", style: .default, handler: resetGame))
            
            present(acFinal, animated: true)
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
        
        print(attempts)
    }
    
}

