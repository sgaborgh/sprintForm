//
//  BaseAssembly.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import UIKit

class BaseAssembly {

    static func createViewController(byName name: String) -> UIViewController {
        let storyBoard: UIStoryboard = .init(name: name, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: name)
    }

}
