//
//  QuestionTests.swift
//  SwiftTutorTests
//
//  Created by Anthony Abbott on 13/04/2023.
//

import XCTest
@testable import SwiftTutor

final class QuestionTests: XCTestCase {
  
  var sut: Question!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
//    sut = Question(json: QuestionTestData.questionJSON)
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testQuestion_WhenWePassJSONToAQuestion_ThenItDecodesItProperly() {
    XCTAssertNotNil(sut)
  }
  
  func testQuestion_WhenAQuestionIsCreated_ThenItHasTheExpectedPrompt() {
    XCTAssertEqual(sut.prompt, QuestionTestData.prompt)
  }
  
  func testQuestion_WhenAQuestionIsCreated_ThenItHasTheExpectedAnswer() {
    XCTAssertEqual(sut.answer, QuestionTestData.answer)
  }
  
}
