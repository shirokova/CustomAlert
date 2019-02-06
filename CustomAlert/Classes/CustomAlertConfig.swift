//
//  CustomAlertConfig.swift
//  CustomAlert
//
//  Created by Anna Shirokova on 18/12/2018.
//

import CoreGraphics

public enum VerticalPosition {
    case top(offset: CGFloat)
    case center(topOffset: CGFloat?, centerOffset: CGFloat)
    case bottom(offset: CGFloat)
}

public struct CustomAlertConfig {
    let horizontalOffset: CGFloat
    let cornerRadius: CGFloat
    let verticalPosition: VerticalPosition

    public init(
        horizontalOffset: CGFloat = 25,
        cornerRadius: CGFloat = 16,
        verticalPosition: VerticalPosition = .center(topOffset: nil, centerOffset: 0)) {
        self.horizontalOffset = horizontalOffset
        self.cornerRadius = cornerRadius
        self.verticalPosition = verticalPosition
    }

    public static var `default`: CustomAlertConfig {
        return CustomAlertConfig()
    }
}
