//
//  TransactionListTableViewController.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import UIKit

final class TransactionListTableViewController: UITableViewController {

    var viewModel: TransactionListViewModel!
    var uiModel: TransactionListUIModel?

    var isFilteringPanelRequired: Bool {
        uiModel?.isFilteringPanelRequired ?? false
    }
    var transactionList: [Transaction] {
        uiModel?.transactionList ?? []
    }


    // MARK: life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.handleEvent(.viewWillAppear)
    }

    func setup(withViewModel viewModel: TransactionListViewModel) {
        self.viewModel = viewModel
    }


    // MARK: UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        isFilteringPanelRequired ? 2 : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFilteringPanelRequired {
            if section == 0 {
                return 1
            } else {
                return transactionList.count
            }
        } else {
            return transactionList.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isFilteringPanelRequired {
            if indexPath.section == 0 {
                return getFilteringCell()
            } else {
                return getTransactionCell(forIndexPath: indexPath)
            }

        } else {
            return getTransactionCell(forIndexPath: indexPath)
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isFilteringPanelRequired {
            return indexPath.section == 0 ? 50 : 110
        } else {
            return 110
        }
    }


    // MARK: private

    private func setupUI() {
        title = "Tranzakciók".localized
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.backgroundColor = .systemGray5

        let logoImageView = UIImageView(image: UIImage(named: "logoTransparent"))
        logoImageView.contentMode = .scaleAspectFit
        let imageButtonItem = UIBarButtonItem(customView: logoImageView)
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -25
        navigationItem.leftBarButtonItems = [negativeSpacer, imageButtonItem]

        let filterImage = UIImage(systemName: "magnifyingglass")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        let filterButtonItem = UIBarButtonItem(image: filterImage, style: .plain, target: self, action: #selector(onFilterButtonTapped))
        navigationItem.rightBarButtonItems = [filterButtonItem]

        tableView.registerNibAsCell(withName: TransactionListCell.typeAsString)
        tableView.registerNibAsCell(withName: TransactionListFilteringCell.typeAsString)
    }

    private func setupViewModel() {
        viewModel = .init(withRouter: TransactionListRouter(withNavigationController: navigationController!), formatter: TransactionListFormatter())

        viewModel.uiModel.bindToValue { [weak self] uiModel in
            guard let strongSelf = self,
                  let newModel = uiModel else {
                return
            }

            strongSelf.uiModel = newModel
            strongSelf.tableView.reloadData()
        }
    }

    private func getFilteringCell() -> TransactionListFilteringCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionListFilteringCell.typeAsString, for: IndexPath(row: 0, section: 0)) as? TransactionListFilteringCell else {
            return .init()
        }

        cell.setup(withCategoryList: TransactionCategory.allCases, selectedCategory: uiModel?.selectedCategoryToFilterFor, categorySelectedClosure: { [weak self] categorySelected in
            self?.viewModel.handleEvent(.categoryFilterSet(categorySelected))
        })

        return cell
    }

    private func getTransactionCell(forIndexPath indexPath: IndexPath) -> TransactionListCell {
        guard transactionList.count > indexPath.row,
              let cell = tableView.dequeueReusableCell(withIdentifier: TransactionListCell.typeAsString, for: indexPath) as? TransactionListCell else {
            return .init()
        }

        let transaction: Transaction = transactionList[indexPath.row]
        cell.setup(withTransaction: transaction)
        return cell
    }

    @objc private func onFilterButtonTapped() {
        viewModel.handleEvent(.userTappedFilterButton)
    }

}
