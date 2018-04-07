//
//  TransitionHandler.swift
//  SBViperStackSwift
//
//  Created by Semyon Belokovsky on 23/06/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

import UIKit

// If your transition handler (TransitionHandler) is not a subclass of ModuleView
// for correct linking between modules you should call
// configureDestination(destinationViewController: UIViewController, withSender sender: AnyObject?)
// with opening module view controller (UIViewController) and open module promise (ModuleOpenPromise)

public protocol TransitionHandler: class {
    
    var moduleInput: ModuleInput? { get set }
    var coordinator: TransitionCoordinator? { get set }
    
//    func openModule(withSegueIdentifier segueIdentifier: String) -> ModuleOpenPromise
    @discardableResult
    func openModule(withSegue segue: Segue?, linkClosure closure: ModuleLinkClosure?) -> ModuleOpenPromise
}
