//
//  TransactionCurrency.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

enum TransactionCurrency: String {

    case huf
    case eur
    case usd

    var localizedTitle: String {
        let title: String
        switch self {
            case .huf: title = "Ft"
            case .eur: title = "EUR"
            case .usd: title = "USD"
        }
        return title
    }

}
