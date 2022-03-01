//
//  PhotosListViewController.swift
//  TechTest
//
//  Created by Clément on 2022-03-01.
//

import UIKit

class PhotosListViewController: UIViewController {
  let service: PhotosService = ConcretePhotosService()

  lazy var helloWorldLabel: UILabel = {
    var label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 14)
    label.textColor = .label
    label.numberOfLines = 0
    label.text = "Hello World".localized
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    view.addSubview(helloWorldLabel)
    NSLayoutConstraint.activate([
      helloWorldLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: .horizontalMargin),
      helloWorldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      helloWorldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])

    
  }
}

private extension CGFloat {
  static let horizontalMargin: CGFloat = 24
}
