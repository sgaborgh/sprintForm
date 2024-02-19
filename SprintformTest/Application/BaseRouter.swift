//
//  BaseRouter.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import UIKit

class BaseRouter {

    weak var navigationController: UINavigationController?

    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

}
