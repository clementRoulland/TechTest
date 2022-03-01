//
//  PhotosListViewController.swift
//  TechTest
//
//  Created by Clément on 2022-03-01.
//

import UIKit

class PhotosListViewController: UITableViewController {
  private typealias DataSource = UITableViewDiffableDataSource<Section, Photo>
  private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Photo>

  private var dataSource: DataSource!

  let service: PhotosService = ConcretePhotosService()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    title = "Photos".localized
    navigationItem.largeTitleDisplayMode = .automatic

    dataSource = DataSource(tableView: tableView, cellProvider: cellProvider)
    tableView.register(PhotosListCell.self, forCellReuseIdentifier: PhotosListCell.reuseIdentifier)

    tableView.allowsSelection = false

    guard let photos = try? service.getPhotos() else { return displayError() }
    reloadData(with: photos)
  }
}

// MARK: - Table view data source
private extension PhotosListViewController {
  func cellProvider(tableView: UITableView, indexPath: IndexPath, viewModel: Photo) -> UITableViewCell? {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: PhotosListCell.reuseIdentifier,
      for: indexPath
    ) as? PhotosListCell else {
      return nil
    }

    cell.configure(with: viewModel)
    return cell
  }

  func reloadData(with viewModel: [Photo]) {
    var snapshot = Snapshot()
    snapshot.appendSections([Section.main])
    snapshot.appendItems(viewModel, toSection: .main)
    dataSource.apply(snapshot, animatingDifferences: false)
  }
}

private extension PhotosListViewController {
  func displayError() {
    let alert = UIAlertController(
      title: "An error occured".localized,
      message: "Unable to load photos from PhotosService".localized,
      preferredStyle: .actionSheet
    )
    present(alert, animated: true)
  }
}

private enum Section: Hashable {
  case main
}

private extension CGFloat {
  static let horizontalMargin: CGFloat = 24
}
