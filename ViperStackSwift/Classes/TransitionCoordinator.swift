//
//  TransitionCoordinator.swift
//  SBViperStackSwift
//
//  Created by Semyon Belokovsky on 23/06/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

import UIKit

public protocol TransitionCoordinator {
    func segue(withSegueID: String) -> UIStoryboardSegue?
    func configureDestinationController(viewController: UIViewController)
}

public extension TransitionCoordinator {
    func segue(withSegueID: String) -> UIStoryboardSegue? {
        return nil
    }
    
    func configureDestinationController(viewController: UIViewController) {
        if (canCoordinateTransition()) {
            viewController.modalPresentationStyle = .custom
            viewController.transitioningDelegate = self as? UIViewControllerTransitioningDelegate
        }
    }
    
    fileprivate func canCoordinateTransition() -> Bool {
        let result = (self is UIViewControllerTransitioningDelegate) && (self is UIViewControllerAnimatedTransitioning)
        return result
    }        
}
