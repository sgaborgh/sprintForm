//
//  Bind.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

class Bind<T> {

    typealias BindClosure = (T?) -> Void

    var value: T? {
        didSet {
            closures.forEach({ $0(value) })
        }
    }
    fileprivate var closures: [BindClosure] = []

    init(value: T?) {
        self.value = value
    }

    func bindToValue(_ closure: @escaping BindClosure) {
        closures.append(closure)
        closure(value)
    }

}
