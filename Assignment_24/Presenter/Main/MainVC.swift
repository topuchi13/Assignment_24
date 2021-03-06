//
//  ViewController.swift
//  Assignment_24
//
//  Created by Nika Topuria on 15.11.21.
//

import UIKit

class MainVC: UIViewController {

    // Creates array of Question objects (Structure Question is defined in file Question.swift)
    var numberOfQuestions = 1
    private var quizBrain = QuizBrain()
    private let quizApiManager = QuizApiManager()
    @IBOutlet private var questionText: UILabel!
    @IBOutlet private var scoreValue: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private var progressBar: UIProgressView!
    
    
    // Displays first question on application load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = quizApiManager.urlConstructor(with: numberOfQuestions)
        quizApiManager.makeRequest(with: url) { Questions in
            self.quizBrain.questions = Questions
            DispatchQueue.main.async {
                self.questionText.text = self.quizBrain.pullQuestion()
                let tempAnswers = self.quizBrain.answers().shuffled()
                for i in (0..<4){
                    self.buttonCollection[i].setTitle(tempAnswers[i], for: .normal)
                }
            }
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        progressBar.progress = quizBrain.getProgress()
        
        if  quizBrain.checkAnswer(sender.currentTitle!) {      //Checks is user choice is correct
            scoreValue.text = "Score: \(quizBrain.score)"
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.8470898271, blue: 0.8115831017, alpha: 1)       //sets button color to cyan
            UIView.animate(withDuration: 0.3) {         //resets button color after 0.3 sec
                sender.backgroundColor = #colorLiteral(red: 0.2143637538, green: 0.2617132962, blue: 0.4109757543, alpha: 1)
            }
            
        }
        
        else {
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.479213655, blue: 0.7059813738, alpha: 1)
            UIView.animate(withDuration: 0.3){
                sender.backgroundColor = #colorLiteral(red: 0.2143637538, green: 0.2617132962, blue: 0.4109757543, alpha: 1)
            }
            
        }
        
            if quizBrain.goToNextQuestion()  {   //Move question counter forward by 1
            let tempAnswers = quizBrain.answers().shuffled()   //Get new answer values
            for i in (0..<4){
                self.buttonCollection[i].setTitle(tempAnswers[i], for: .normal)
            }
            questionText.text = quizBrain.pullQuestion()    //Update the question text

            } else {
                let alert = UIAlertController(title: "Game Over", message: "You have \(quizBrain.score) correct answers out of \(numberOfQuestions)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {_ in
                    self.dismiss(animated: true, completion: nil)
                }))
                alert.addAction(UIAlertAction(title: "Exit Game", style: .destructive, handler: {_ in
                    exit(0)
                }))
                present(alert, animated: true, completion: nil)
            }

    }

}

