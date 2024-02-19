//
//  TransactionListFilteringCell.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import UIKit

final class TransactionListFilteringCell: UITableViewCell, TypeDescribable {

    @IBOutlet var categoryButtonsStackView: UIStackView!

    var categoryList: [TransactionCategory] = []
    var categorySelectedClosure: Closure.TransactionListFilterCategorySelected?

    override func prepareForReuse() {
        super.prepareForReuse()
        cleanStackView()
    }

    func setup(
        withCategoryList categoryList: [TransactionCategory],
        selectedCategory: TransactionCategory?,
        categorySelectedClosure closure: @escaping Closure.TransactionListFilterCategorySelected
    ) {
        selectionStyle = .none
        self.categoryList = categoryList
        categorySelectedClosure = closure

        for (index, category) in categoryList.enumerated() {
            let button: UIButton = UIButton(type: .custom)

            button.setImage(category.image, for: .normal)
            button.tintColor = category.color
            button.tag = index
            if let selectedCategory = selectedCategory {
                button.alpha = selectedCategory == category ? 1.0 : 0.3
            } else {
                button.alpha = 1
            }

            button.addTarget(self, action: #selector(onCategoryButtonTapped), for: .touchUpInside)
            categoryButtonsStackView.addArrangedSubview(button)
        }
    }

    @objc private func onCategoryButtonTapped(_ sender: UIButton) {
        guard categoryList.count > sender.tag else { return }

        let category = categoryList[sender.tag]
        categorySelectedClosure?(category)
    }

    private func cleanStackView() {
        categoryButtonsStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }

}
