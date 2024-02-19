//
//  Transaction.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

struct Transaction: Codable {

    let id: String
    let summary: String
    let category: TransactionCategory
    let sum: Int
    let currency: String
    let paid: Date

    var formattedPaidDateAsString: String {
        paid.formatted(date: .abbreviated, time: .omitted)
    }

    var formattedPriceWithCurrency: String {
        "\(sum.formatted()) \(parsedCurrency?.localizedTitle ?? "")"
    }

    var parsedCurrency: TransactionCurrency? {
        TransactionCurrency(rawValue: currency.lowercased())
    }

}
