//
//  TransactionListUIModel.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

struct TransactionListUIModel {

    var transactionList: [Transaction] // can be a filtered list, or a full one, VM decides
    var isFilteringPanelRequired: Bool
    var selectedCategoryToFilterFor: TransactionCategory?

}
