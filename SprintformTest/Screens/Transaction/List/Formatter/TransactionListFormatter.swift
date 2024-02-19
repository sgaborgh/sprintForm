//
//  TransactionListFormatter.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

final class TransactionListFormatter {

    func createUIModel(byListOfTransactions transactions: [Transaction]) -> TransactionListUIModel {
        .init(transactionList: transactions, isFilteringPanelRequired: false)
    }

}
