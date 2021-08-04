//
//  Onboarding.swift
//  Tutti
//
//  Created by Daniel Saidi on 2017-12-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This is a base class for various onboarding experiences. It
 can be subclassed to create more specialized behaviors.
 
 The base onboarding behavior is that `shouldBePresented` is
 `true` until `registerPresentation()` is called. After that,
 it's `false` until `reset()` is called.
 
 `NOTE` Nothing stops your app from presenting an onboarding
 where `shouldBePresented` is `false`. Make sure that you do
 verify that `shouldBePresented` is `true` and that you call
 `registerPresentation()` when you present it.
 */
open class Onboarding {
    
    /**
     Create an onboarding experience.
     
     - Parameters:
        - id: The unique onboarding id.
        - userId: An optional user id.
        - defaults: The `UserDefaults` instance to use.
     */
    public init(
        id: String,
        userId: UserId? = nil,
        defaults: UserDefaults = .standard) {
        self.id = id
        self.userId = userId
        self.defaults = defaults
    }
    
    public typealias UserId = String
    
    public let id: String
    public let userId: UserId?
    public let defaults: UserDefaults

    /**
     Whether or not the onboarding has been presented.
     */
    open var hasBeenPresented: Bool {
        presentationCount > 0
    }
    
    /**
     Whether or not the onboarding should be presented.
     
     This depends on the particular onboarding experience.
     */
    open var shouldBePresented: Bool {
        presentationCount == 0
    }
    
    /**
     Call this to register that an onboarding is presented.
     */
    open func registerPresentation() {
        presentationCount += 1
    }
    
    /**
     Call this to reset any previous presentation logic.
     */
    open func reset() {
        presentationCount = 0
    }
}


// MARK: - Public Members

public extension Onboarding {

    /**
     The number of times a presentation has been registered.
     */
    var presentationCount: Int {
        get { defaults.integer(forKey: presentationCountKey) }
        set { defaults.set(newValue, forKey: presentationCountKey) }
    }
    
    /**
     The key to use for persisting values. The key is unique
     for each onboarding and user.
     */
    func persistencyKey(for key: String) -> String {
        let key = "com.tutti.onboarding.\(id).\(key)"
        guard let userId = userId else { return key }
        return "\(key).\(userId)"
    }
}


// MARK: - Private Mebers

private extension Onboarding {
    
    var presentationCountKey: String {
        persistencyKey(for: "presentationCount")
    }
}
