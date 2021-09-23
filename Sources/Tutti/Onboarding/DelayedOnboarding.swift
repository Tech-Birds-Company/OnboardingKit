//
//  DelayedOnboarding.swift
//  Tutti
//
//  Created by Daniel Saidi on 2020-09-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This onboarding is presented after a number of presentation
 attempts.
 
 This onboarding require you to check the `shouldBePresented`
 property a certain number of times before it returns `true`.
 
 Other than that, it behaves just like the `Onboarding` base
 class and will only be presented once.
 */
open class DelayedOnboarding: Onboarding {
    
    /**
     Create a delayed onboarding experience.
     
     - Parameters:
        - id: The unique onboarding id.
        - userId: An optional user id.
        - defaults: The `UserDefaults` instance to use.
        - requiredPresentationAttempts: The number of times `shouldBePresented` must be checked before it becomes `true`.
     */
    public init(
        id: String,
        userId: UserId? = nil,
        defaults: UserDefaults = .standard,
        requiredPresentationAttempts: Int) {
        self.requiredPresentationAttempts = requiredPresentationAttempts
        super.init(id: id, userId: userId, defaults: defaults)
    }
    
    
    private let requiredPresentationAttempts: Int
    
    
    /**
     Whether or not the onboarding should be presented.
     */
    open override var shouldBePresented: Bool {
        presentationCheckCount += 1
        let isActive = presentationCheckCount >= requiredPresentationAttempts
        return isActive && super.shouldBePresented
    }
    
    /**
     Call this to reset any previous presentation logic.
     */
    open override func reset() {
        presentationCheckCount = 0
        super.reset()
    }
}


// MARK: - Public Members

public extension DelayedOnboarding {
    
    var presentationCheckCount: Int {
        get { defaults.integer(forKey: presentationCheckCountKey) }
        set { defaults.set(newValue, forKey: presentationCheckCountKey) }
    }
}


// MARK: - Private Mebers

private extension DelayedOnboarding {
    
    var presentationCheckCountKey: String {
        persistencyKey(for: "presentationCheckCount")
    }
}
