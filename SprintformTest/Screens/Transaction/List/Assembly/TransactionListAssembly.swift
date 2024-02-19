//
//  TransactionListAssembly.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import UIKit

final class TransactionListAssembly: BaseAssembly {

    // not in use currently
    static func createViewController(
        withNavigationController navigationController: UINavigationController
    ) -> TransactionListTableViewController? {
        let router = TransactionListRouter(withNavigationController: navigationController)
        let formatter = TransactionListFormatter()
        let viewModel = TransactionListViewModel(withRouter: router, formatter: formatter)
        let controller = createViewController(byName: "TransactionListTableViewController") as? TransactionListTableViewController
        controller?.setup(withViewModel: viewModel)

        return controller
    }

}
