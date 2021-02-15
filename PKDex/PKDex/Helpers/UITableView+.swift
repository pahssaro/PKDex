//
//  UITableView+.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }
        return lastIndexPath == indexPath
    }
}
