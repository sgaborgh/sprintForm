//
//  TransactionListViewModel.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

final class TransactionListViewModel {


    // MARK: own enums

    enum ViewModelEvent {
        case viewWillAppear
        case userTappedFilterButton
        case categoryFilterSet(TransactionCategory)
    }


    // MARK: properties

    var uiModel: Bind<TransactionListUIModel>

    private var router: TransactionListRouter
    private var formatter: TransactionListFormatter
    private var currentTransactions: [Transaction] = []

    private var isFilteringPanelRequired: Bool = false {
        didSet {
            uiModel.value?.isFilteringPanelRequired = isFilteringPanelRequired
        }
    }
    private var filteringByCategory: TransactionCategory? = nil {
        didSet {
            if let filteringByCategory = filteringByCategory {
                let transactionList = currentTransactions.compactMap({
                    $0.category == filteringByCategory ? $0 : nil
                })

                uiModel.value = .init(
                    transactionList: transactionList,
                    isFilteringPanelRequired: isFilteringPanelRequired,
                    selectedCategoryToFilterFor: filteringByCategory
                )
            } else {
                uiModel.value = .init(
                    transactionList: currentTransactions,
                    isFilteringPanelRequired: isFilteringPanelRequired,
                    selectedCategoryToFilterFor: filteringByCategory
                )
            }
        }
    }

    
    // MARK: life-cycle

    init(withRouter router: TransactionListRouter, formatter: TransactionListFormatter) {
        self.router = router
        self.formatter = formatter
        currentTransactions = []
        self.uiModel = Bind(value: formatter.createUIModel(byListOfTransactions: currentTransactions))
    }

    
    // MARK: public methods

    func handleEvent(_ event: ViewModelEvent) {
        switch event {
            case .viewWillAppear:
                TransactionManager.shared.getCurrentTransactionList { [weak self] transactionList in
                    self?.currentTransactions = transactionList
                    self?.uiModel.value?.transactionList = transactionList
                }

            case .userTappedFilterButton:
                isFilteringPanelRequired.toggle()
                if isFilteringPanelRequired == false {
                    filteringByCategory = nil
                }

            case .categoryFilterSet(let category):
                filteringByCategory = category

        }
    }

}
