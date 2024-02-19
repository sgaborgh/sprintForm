//
//  UITableView+RegisterNibAsCell.swift
//  SprintformTest
//
//  Created by Gabor Saliga on 2024. 02. 19..
//

import UIKit

extension UITableView {

    func registerNibAsCell(withName name: String) {
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }

}
