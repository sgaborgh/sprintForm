//
//  TransactionCategory.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import UIKit

enum TransactionCategory: String, Codable, CaseIterable {

    case housing
    case food
    case travel
    case clothing
    case utilities
    case insurance
    case healthcare
    case financial
    case lifestyle
    case entertainment
    case miscellaneous

    var color: UIColor {
        let color: UIColor

        switch self {
            case .housing: color = .brown
            case .food: color = .orange
            case .travel: color = .blue
            case .clothing: color = .systemTeal
            default: color = .gray
        }

        return color
    }

    var image: UIImage {
        let image: UIImage

        switch self {
            case .housing: image = .init(systemName: "house")!
            case .food: image = .init(systemName: "fork.knife")!
            case .travel: image = .init(systemName: "airplane")!
            case .clothing: image = .init(systemName: "hanger")!
            default: image = .init(systemName: "scope")!
        }

        return image.withTintColor(color, renderingMode: .alwaysOriginal)
    }

}
