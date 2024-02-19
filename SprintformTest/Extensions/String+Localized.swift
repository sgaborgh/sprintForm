//
//  String+Localized.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import Foundation

extension String {

    var localized: String {
        NSLocalizedString(self, comment: "")
    }

}
