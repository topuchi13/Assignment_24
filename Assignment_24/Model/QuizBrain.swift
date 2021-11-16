//
//  QuizBrain.swift
//  Assignment_24
//
//  Created by Nika Topuria on 15.11.21.
//

import Foundation


class QuizBrain {
    var questions = [QuizItem]()
    
    var currentQuestion = 0
    var progress: Float = 0.0
    var score: Int = 0

    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == questions[currentQuestion].correctAnswer{
            score += 1
            return true
        }
        else {
            return false
        }
    }
    
    //tracks current progress
    func getProgress() -> Float {
        progress += 1.0/Float(questions.count)
        return progress
    }
    
    func fillQuestions() {

    }
    
    // Returns next question
    func pullQuestion () -> String {
        return questions[currentQuestion].question
    }
    
    //Returns answers for currently displayed question
    func answers () -> [String]{
        let answers = [questions[currentQuestion].correctAnswer] + questions[currentQuestion].incorrectAnswers
        return answers
    }
    
    //Moves through the quesstions
    func goToNextQuestion() -> Bool {
        if  currentQuestion < questions.count-1 {        //Checks if current Question is the last one
            currentQuestion += 1        //if not, goes to next question
            return true
        }
        
        else {
            return false
        }
    }
}
