//
//  PhotosListCell.swift
//  TechTest
//
//  Created by Clément on 2022-03-01.
//

import UIKit

class PhotosListCell: UITableViewCell {
  static let reuseIdentifier: String = "PhotosListCell"

  lazy var image: UIImageView = {
    var imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var label: UILabel = {
    var label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 14)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(image)
    NSLayoutConstraint.activate([
      image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .globalMargin),
      image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      image.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: .globalMargin),
    ])

    contentView.addSubview(label)
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: .globalMargin),
      label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .globalMargin),
      label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      label.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: .globalMargin),
    ])
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) { return nil }

  func configure(with photo: Photo) {
    imageView?.image = UIImage()
    label.text = photo.title
  }
}

private extension CGFloat {
  static let globalMargin: CGFloat = 12
}
