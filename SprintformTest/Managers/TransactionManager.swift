//
//  TransactionManager.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

final class TransactionManager {

    static let shared: TransactionManager = .init()

    private init() {}

    func getCurrentTransactionList(completion: @escaping Closure.TransactionListReceived) {
        guard let url: URL = .init(string: Config.Api.baseUrlString + Config.Api.pathForGetTransactionList) else { return }

        NetworkManager.shared.request(url: url, parseIntoType: [Transaction].self) { success, parsedData in
            completion(parsedData ?? [])
        }
    }

}
