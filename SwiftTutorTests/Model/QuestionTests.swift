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
  
  // MARK: - Setup / Teardown
  override func setUpWithError() throws {
    try super.setUpWithError()
    
    // Given that we have a question as Data
    Bundle.main.decode(from: QuestionTestData.data) { (response: Result<Question, Bundle.BundleDecodableError>) in
      
      switch response {
        case .failure( _): break
        case .success(let decodedQuestion):
          self.sut = decodedQuestion
        }
    }
  }
  
  override func tearDownWithError() throws {
    sut = nil
    Question.id = 0
    try super.tearDownWithError()
  }
  
  // MARK: - Tests
  func testQuestion_WhenWePassJSONToAQuestion_ThenItDecodesItProperly() {
    XCTAssertNotNil(sut)
  }

  func testQuestion_WhenAQuestionIsCreated_ThenItHasTheExpectedPrompt() {
    XCTAssertEqual(sut.prompt, QuestionTestData.prompt)
  }

  func testQuestion_WhenAQuestionIsCreated_ThenItHasTheExpectedAnswer() {
    XCTAssertEqual(sut.answer, QuestionTestData.answer)
  }

  func testQuestion_WhenAQuestionIsCreated_ThenItsIdShouldBeZero() {
    XCTAssertEqual(sut.id, 0)
  }
  
  func testQuestion_WhenThreeQuestionsCreated_ThenIDShouldBe2() {
    
    // Given
    Question.id = 0
    let q0: Question? = Bundle.main.decode(from: QuestionTestData.data)
    let q1: Question? = Bundle.main.decode(from: QuestionTestData.data)
    let q2: Question? = Bundle.main.decode(from: QuestionTestData.data)
    
    // Then
    XCTAssertNotNil(q0)
    XCTAssertNotNil(q1)
    XCTAssertNotNil(q2)
    
    XCTAssertEqual(q0!.id, 0)
    XCTAssertEqual(q1!.id, 1)
    XCTAssertEqual(q2!.id, 2)
  }
}
