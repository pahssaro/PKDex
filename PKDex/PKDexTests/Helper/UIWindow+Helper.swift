//
//  UIWindow+Helper.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {

    static var testWindow: UIWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: 414, height: 736))

    static func setTestWindow(rootViewController: UIViewController) {
        self.testWindow.rootViewController = rootViewController
        self.testWindow.makeKeyAndVisible()
    }

    static func cleanTestWindow() {
        self.testWindow.rootViewController = nil
        self.testWindow.isHidden = true
    }
}
