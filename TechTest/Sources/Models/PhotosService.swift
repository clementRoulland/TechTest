//
//  PhotosService.swift
//  TechTest
//
//  Created by Clément on 2022-03-01.
//

import Foundation

protocol PhotosService {
  func getPhotos() throws -> [Photo]
}

struct ConcretePhotosService {}
extension ConcretePhotosService: PhotosService {
  func getPhotos() throws -> [Photo] {
    let encoder = JSONEncoder()
    let encodedPhotos = try encoder.encode(Photos)

    let decoder = JSONDecoder()
    return try decoder.decode([Photo].self, from: encodedPhotos)
  }
}
