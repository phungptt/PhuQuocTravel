//
//  Font+Extension.swift
//  PhuQuocTravel_mobile
//
//  Created by Nguyễn Quốc Tuyến on 10/22/18.
//  Copyright © 2018 Nguyễn Quốc Tuyến. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class public func appFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "SegoeUI", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
