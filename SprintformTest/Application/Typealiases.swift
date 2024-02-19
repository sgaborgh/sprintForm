//
//  Typealiases.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

struct Closure {

    typealias TransactionListReceived = ([Transaction]) -> Void
    typealias TransactionListFilterCategorySelected = (TransactionCategory) -> Void

}
