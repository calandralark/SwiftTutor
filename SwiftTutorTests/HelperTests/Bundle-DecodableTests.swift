//
//  Bundle-DecodableTests.swift
//  SwiftTutorTests
//
//  Created by Anthony Abbott on 13/04/2023.
//

import XCTest
@testable import SwiftTutor

final class Bundle_DecodableTests: XCTestCase {
  
  override func setUpWithError() throws {
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
  }
  
  func testBundleDecodable_whenPassingNonExistingFile_ThenShouldReturnFailedToFindFile() {
    var bundleDecodeError: Bundle.BundleDecodableError!
  
    // Given that the file doesn't exist
    let thisFileDoesNotExists = "thisFileDoesNotExists"
    
    // When it is decoded
    Bundle.main.decode(thisFileDoesNotExists) { (response: Result<Question, Bundle.BundleDecodableError>) in
      
      switch response {
        case .failure(let bde): bundleDecodeError = bde
        case .success( _): break
        }
    }
    
    // Then the error code should be .failedToFindFile
    XCTAssertEqual(bundleDecodeError, .failedToFindFile)
  }
  
  func testBundleDecodable_whenPassingEmptyFile_ThenShouldReturnFailedToDecodeFile() {
    var bundleDecodeError: Bundle.BundleDecodableError!
  
    // Given that we have an empty file
    let emptyFile = "EmptyQuestionFile.json"
    
    // When it is decoded
    Bundle.main.decode(emptyFile) { (response: Result<Question, Bundle.BundleDecodableError>) in
      
      switch response {
        case .failure(let bde): bundleDecodeError = bde
        case .success( _): break
        }
    }
    
    // Then the error code should be .failedToDecodeFile
    XCTAssertEqual(bundleDecodeError, .failedToDecodeFile)
  }
  
  func testBundleDecodable_whenPassingQuestionData_ThenShouldReturnAQuestion() {
    
    var question: Question!
  
    // Given that we have a question as Data
    let data = QuestionTestData.data
    
    // When it is decoded
    Bundle.main.decode(from: data) { (response: Result<Question, Bundle.BundleDecodableError>) in
      
      switch response {
        case .failure( _): break
        case .success(let decodedQuestion):
           question = decodedQuestion
        }
    }
    
    // Then the decoded question should not be nil
    XCTAssertNotNil(question)
  }
  
  func testBundleDecodable_whenPassingInvalidData_ThenShouldReturnFailedToDecode() {
    
    var bundleDecodeError: Bundle.BundleDecodableError!
  
    // Given that we have a question as Data
    let data = "Invalid JSO".data(using: .utf8)
    
    // When it is decoded
    Bundle.main.decode(from: data!) { (response: Result<Question, Bundle.BundleDecodableError>) in
      
      switch response {
        case .failure(let bde): bundleDecodeError = bde
        case .success( _): break
        }
    }
    
    // Then the error code should be .failedToDecodeData
    XCTAssertEqual(bundleDecodeError, .failedToDecodeData)
  }
}
