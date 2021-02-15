//
//  Coordinator.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

/// Base do `Coordinator`
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
