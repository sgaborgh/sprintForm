//
//  TypeDescribable.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

protocol TypeDescribable {

    static var typeAsString: String { get }

}


// MARK: default extension

extension TypeDescribable {

    static var typeAsString: String {
        String(describing: self)
    }

}
