//
//  NetworkManager.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation
import Alamofire

final class NetworkManager {

    static let shared: NetworkManager = .init()

    private let decoder = JSONDecoder()

    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }

    func request<T: Codable>(url: URL, parseIntoType: T.Type, completion: @escaping (Bool, T?) -> Void) {
        AF
            .request(url)
            .validate()
            .responseDecodable(of: T.self, decoder: decoder) { dataResponse in // DataResponse<Decodable, AFError>
                switch dataResponse.result {
                    case .success(let data):
                        completion(true, data)
                        break
                    case .failure(let error):
                        completion(false, nil)
                        break
                }
            }
    }

}
