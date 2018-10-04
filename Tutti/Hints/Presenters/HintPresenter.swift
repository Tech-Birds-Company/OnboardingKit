//
//  HintPresenter.swift
//  Tutti
//
//  Created by Daniel Saidi on 2017-12-07.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Tutti hint presenters can be used to present hints to users.
 
 */

import UIKit

public protocol HintPresenter: class {
    
    func dismiss(hint: Hint)
    func present(hint: Hint, in vc: UIViewController, from view: UIView)
    func present(hint: Hint, in vc: UIViewController, from barButtonItem: UIBarButtonItem)
}

public extension HintPresenter {
    
    func tryPresent(_ hint: Hint, presentAction: () -> ()) {
        hint.prepareForPresentation()
        guard hint.shouldBePresented else { return }
        presentAction()
        hint.hasBeenDisplayed = true
    }
}
