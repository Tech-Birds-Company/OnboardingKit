//
//  Hint.swift
//  OnboardingKit
//
//  Created by Daniel Saidi on 2017-12-03.
//  Copyright © 2017-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 A hint is a short onboarding message that is intended to be
 displayed briefly, e.g. in a toast, callout bubble etc.
 */
open class Hint: Equatable {
    
    public init(
        title: String = "",
        text: String,
        accessibilityText: String? = nil
    ) {
        self.title = title
        self.text = text
        self.accessibilityText = accessibilityText
    }
    
    public let title: String
    public let text: String
    public let accessibilityText: String?
    
    public var hasTitle: Bool {
        title.trimmingCharacters(in: .whitespaces).count > 0
    }
    
    public static func == (lhs: Hint, rhs: Hint) -> Bool {
        lhs.title == rhs.title && lhs.text == rhs.text
    }
}
