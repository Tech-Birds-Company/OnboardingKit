//
//  TutorialPageViewStyle.swift
//  OnboardingKit
//
//  Created by Daniel Saidi on 2022-09-04.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This style can be used to style a ``TutorialPageView``.
public struct TutorialPageViewStyle {

    /// Create a tutorial page view style.
    ///
    /// - Parameters:
    ///   - pageIndicatorTintColor: The page indicator color to use.
    ///   - currentPageIndicatorTintColor: The color of the current page indicator.
    public init(
        pageIndicatorTintColor: Color,
        currentPageIndicatorTintColor: Color
    ) {
        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
    }

    /// The page indicator color to use.
    public var pageIndicatorTintColor: Color

    /// The color of the current page indicator.
    public var currentPageIndicatorTintColor: Color
}

public extension TutorialPageViewStyle {

    /**
     This standard style applies a primary tint color to the
     indicators, with less opacity to non-current indicators.
     */
    static var standard = TutorialPageViewStyle(
        pageIndicatorTintColor: .primary.opacity(0.3),
        currentPageIndicatorTintColor: .primary)
}
