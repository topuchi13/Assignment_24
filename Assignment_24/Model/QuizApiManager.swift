//
//  QuizApiManager.swift
//  Assignment_24
//
//  Created by Nika Topuria on 15.11.21.
//

import UIKit

class QuizApiManager {
    
    func makeRequest (with url: String, completion: @escaping (([QuizItem]) -> Void)) {
        let requestURL = URL(string: url)!
        let session = URLSession.shared
        session.dataTask(with: requestURL) { Data, Response, Error in
            if let data = Data{
                if let question = self.decodeQuiz(this: data){
                    completion(question)
                }
            }
        }.resume()
    }
    
    
    func decodeQuiz(this data: Data) -> [QuizItem]? {
        var questions = [QuizItem]()
        do{
            let decoded = try JSONDecoder().decode((QuizItemList).self, from: data)
            print (questions)
            decoded.results.forEach({ questions.append($0) })
            return questions
        } catch {
            print(error)
        }
        return questions
    }
}
