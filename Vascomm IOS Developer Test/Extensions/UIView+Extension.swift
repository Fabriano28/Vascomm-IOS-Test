//
//  UIView+Extension.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import Foundation
import UIKit

extension UIView {
    var firstResponder: UIResponder? {
        if self.isFirstResponder {
            return self
        }
        
        for subview in self.subviews {
            if let responder = subview.firstResponder {
                return responder
            }
        }
        return nil
    }
}
