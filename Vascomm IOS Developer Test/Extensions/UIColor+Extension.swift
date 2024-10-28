//
//  UIColor+Extension.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import Foundation
import UIKit

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red, green, blue, alpha: CGFloat

        switch hexSanitized.count {
        case 3: // RGB
            red = CGFloat((rgb >> 8) & 0xFF) / 255.0
            green = CGFloat((rgb >> 4) & 0xFF) / 255.0
            blue = CGFloat(rgb & 0xFF) / 255.0
            alpha = 1.0
        case 6: // RRGGBB
            red = CGFloat((rgb >> 16) & 0xFF) / 255.0
            green = CGFloat((rgb >> 8) & 0xFF) / 255.0
            blue = CGFloat(rgb & 0xFF) / 255.0
            alpha = 1.0
        case 8: // RRGGBBAA
            red = CGFloat((rgb >> 24) & 0xFF) / 255.0
            green = CGFloat((rgb >> 16) & 0xFF) / 255.0
            blue = CGFloat((rgb >> 8) & 0xFF) / 255.0
            alpha = CGFloat(rgb & 0xFF) / 255.0
        default:
            return nil
        }

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
