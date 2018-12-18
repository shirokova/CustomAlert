//
//  CustomAlertConfig.swift
//  CustomAlert
//
//  Created by Anna Shirokova on 18/12/2018.
//

import Foundation

public struct CustomAlertConfig {
    let viewCenterYOffset: CGFloat
    let horizontalOffset: CGFloat
    let verticalOffset: CGFloat?
    let cornerRadius: CGFloat

    public init(centerYOffset: CGFloat = 0, horizontalOffset: CGFloat = 25, verticalOffset: CGFloat? = nil, cornerRadius: CGFloat = 16) {
        viewCenterYOffset = centerYOffset
        self.horizontalOffset = horizontalOffset
        self.verticalOffset = verticalOffset
        self.cornerRadius = cornerRadius
    }

    public static var `default`: CustomAlertConfig {
        return CustomAlertConfig()
    }
}
