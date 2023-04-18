//
//  QuestionModelTestData.swift
//  SwiftTutorTests
//
//  Created by Anthony Abbott on 18/04/2023.
//

import Foundation
@testable import SwiftTutor
struct QuestionModelTestData {
  
  static var questionModel: QuestionModel? {
    
    if let url = Bundle.main.url(forResource: "Questions", withExtension: "json") {
         do {
             let data = try Data(contentsOf: url)
             let decoder = JSONDecoder()
             let sections = try decoder.decode([QuestionSection].self, from: data)
            return QuestionModel(sections: sections)
         } catch {
             print("error:\(error)")
         }
    } else {
      print("")
    }
    return nil
  }
}




