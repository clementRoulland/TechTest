//
//  PhotosListCell.swift
//  TechTest
//
//  Created by Clément on 2022-03-01.
//

import UIKit
import AlamofireImage

class PhotosListCell: UITableViewCell {
  static let reuseIdentifier: String = "PhotosListCell"

  lazy var image: UIImageView = {
    var imageView = UIImageView(image: .init(named: "placeholder"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = .imageSize / 2
    return imageView
  }()

  lazy var label: UILabel = {
    var label = UILabel()
    label.numberOfLines = 0
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
      image.widthAnchor.constraint(equalToConstant: .imageSize),
      image.heightAnchor.constraint(equalTo: image.widthAnchor),
      image.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: .globalMargin),
    ])

    contentView.addSubview(label)
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: .globalMargin),
      label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.globalMargin),
      label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      label.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: .globalMargin),
    ])
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) { return nil }

  func configure(with photo: Photo) {
    image.af.setImage(withURL: photo.url)
    label.text = photo.title
  }
}

private extension CGFloat {
  static let globalMargin: CGFloat = 12
  static let imageSize: CGFloat = 64
}
