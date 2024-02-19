//
//  TransactionListCell.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import UIKit

final class TransactionListCell: UITableViewCell, TypeDescribable {

    @IBOutlet var categoryColorBar: UIView!
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var transactionTitleLabel: UILabel!
    @IBOutlet var transactionDateLabel: UILabel!
    @IBOutlet var transactionPriceLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()

        categoryColorBar.backgroundColor = .black
        categoryImageView.image = nil
        transactionTitleLabel.text = nil
        transactionDateLabel.text = nil
        transactionPriceLabel.text = nil
    }

    func setup(withTransaction transaction: Transaction) {
        selectionStyle = .none
        
        categoryColorBar.backgroundColor = transaction.category.color
        categoryImageView.image = transaction.category.image
        transactionTitleLabel.text = transaction.summary
        transactionDateLabel.text = transaction.formattedPaidDateAsString
        transactionPriceLabel.text = transaction.formattedPriceWithCurrency
    }

}
