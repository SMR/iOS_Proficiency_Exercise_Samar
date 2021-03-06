//
//  ViewController.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {

  // MARK: - Properties
  private var viewModel: FactsViewModel = {
    return FactsViewModel.init(Constants.apiURL)
  }()

  let tableView: UITableView = {
    let tableView = UITableView()

    let footerViewFrame = CGRect(x: 0,
                                 y: 0,
                                 width: tableView.bounds.width,
                                 height: 30)
    let footerView = UIView(frame: footerViewFrame)

    footerView.backgroundColor = .white
    tableView.tableFooterView = footerView
    tableView.estimatedRowHeight = 200.0
    tableView.rowHeight = UITableView.automaticDimension
    return tableView
  }()

  private let emptyTableMessage: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    label.text = "No facts available"
    label.tag = Constants.emptyTableMessageLabelTag
    return label
  }()

  private let refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.tintColor = .gray
    refreshControl.addTarget(self, action: #selector(pullToRefersh(_:)), for: .valueChanged)
    return refreshControl
  }()

  // MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    view.addSubview(tableView)

    configureTableView()
    getFacts()
  }

  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    tableView.reloadData()
  }

  // MARK: - Private Methods

  /// Function to configure tableView properties
  /// - Returns: Void
  private func configureTableView() {

    // Registering cell class in tableView
    tableView.register(
      FactsCell.self,
      forCellReuseIdentifier: FactsCell.reuseIdentifier)

    // Setting tableView delegate and data source
    tableView.delegate = self
    tableView.dataSource = self

    // Adding refresh control to tableView
    tableView.refreshControl = refreshControl

    // Setting tableView constraints
    addTableViewConstraints()
  }

  /// Function to reload tableView and toggle empty table text
  /// - Returns: Void
  private func reloadTable() {

    if viewModel.factsArray.count == 0 {
      tableView.bounces = false
      tableView.addSubview(emptyTableMessage)

      addEmptyTableViewLabelConstraints()
    } else {
      tableView.bounces = true
      let tagSubView = tableView.subviews.filter({ $0.tag == Constants.emptyTableMessageLabelTag }).first
      if let tableViewEmptyTextLabel = tagSubView {
        tableViewEmptyTextLabel.removeFromSuperview()
      }
    }

    tableView.reloadData()
  }

  /// Function to get facts from API. It calls method on viewModel and returns data
  /// - Returns: Void
  private func getFacts() {

    // Calling viewModel method to get facts data from API
    viewModel.getFactsFromAPI {[weak self] (result) in
      switch result {
      case .failure(.noFactsAvailable):
        break
      case .failure(.inValidData):
        break
      case .success(let factsResponse):
        self?.viewModel.updateFactsArray(factsResponse.rows ?? [])
        DispatchQueue.main.async {[weak self] in
          guard let self = self else {
            return
          }
          self.title = factsResponse.title ?? ""
          self.tableView.reloadData()
        }
      }
    }
  }

  // MARK: - Selector Methods

  /// Function to be called on pull to refresh
  /// - Parameter refershControl: refershControl Object
  @objc private func pullToRefersh(_ refershControl: UIRefreshControl) {

    // Stopping pull to refresh
    refershControl.endRefreshing()

    // Getting methods from API
    getFacts()
  }
}

// MARK: - UITableViewDelegate
extension FactsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.factsArray.count
  }
}

// MARK: - UITableViewDataSource
extension FactsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let record = viewModel.factsArray[indexPath.row]
    if let cell = tableView.dequeueReusableCell(withIdentifier: FactsCell.reuseIdentifier) as? FactsCell {
      cell.prepareCellForDisplay(record: record)
      return cell
    }
    return UITableViewCell()
  }
}

// MARK: - Extension for setting constraints on views
extension FactsViewController {

  /// Function to set constraints on label for empty table message
  /// - Returns: Void
  private func addEmptyTableViewLabelConstraints() {

    emptyTableMessage.addCenterXConstraint(toView: tableView)
    emptyTableMessage.addCenterYConstraint(toView: tableView)
  }

  /// Function to set tableView constraints
  /// - Returns: Void
  private func addTableViewConstraints() {

    tableView.anchorToSuperViewEdges()
  }
}

