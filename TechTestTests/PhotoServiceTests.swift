//
//  PhotoServiceTests.swift
//  TechTestTests
//
//  Created by Clément on 2022-03-01.
//

import XCTest
@testable import TechTest

class PhotoServiceTests: XCTestCase {
  var service: PhotosService!

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    service = ConcretePhotosService()
  }

  func test_getPhotos() throws {
    // When
    let photos = try service.getPhotos()

    // Then
    XCTAssertEqual(photos.count, 98)
  }
}
