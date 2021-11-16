//
//  QuizItem.swift
//  Assignment_24
//
//  Created by Nika Topuria on 15.11.21.
//

import Foundation

struct QuizItemList: Codable {
    var results: [QuizItem]
}

// MARK: - Result
struct QuizItem: Codable {
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}
