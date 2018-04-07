//
//  UIViewController+TransitionHandler.swift
//  SBViperStackSwift
//
//  Created by Semyon Belokovsky on 23/06/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

import UIKit

public extension TransitionHandler where Self: UIViewController {
    
    func openModule(withSegue segue: Segue?, linkClosure closure: ModuleLinkClosure?) -> ModuleOpenPromise {
        let promise = ModuleOpenPromise()
        DispatchQueue.main.async {
            guard let segue = segue else {
                return
            }
            var moduleInput: ModuleInput?
            var destinationViewController: UIViewController? = segue.destination;
            
            self.configure(destination: destinationViewController)
            
            if let destination = destinationViewController {
                if let navigationCotroller = destination as? UINavigationController {
                    destinationViewController = navigationCotroller.topViewController
                }
            }
            
            if let targetModuleTransitionHandler: TransitionHandler = destinationViewController as? TransitionHandler {
                moduleInput = targetModuleTransitionHandler.moduleInput
            }
            
            promise.moduleInput = moduleInput
            promise.link(closure)
            
            segue.perform()
        }
        
        return promise
    }
    
    fileprivate func configure(destination: UIViewController?) {
        guard let destination = destination else {
            return
        }
        self.coordinator?.configureDestinationController(viewController: destination)
    }
}
