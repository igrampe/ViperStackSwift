//
//  RootRouter.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import ViperStackSwift

class RootRouter: ModuleRouter, RootRouterInput {    
    var childSegue: Segue?
    weak var childOutput: ChildModuleOutput?
    
    func openChildModule() {
        childSegue = ChildSegue()
        self.childSegue?.source = transitionHandler as? UIViewController
        self.childSegue?.destination = RootAssembly.assembler.resolver.resolve(ChildView.self)
        transitionHandler?.openModule(withSegue: childSegue, linkClosure: { moduleInput -> ModuleOutput? in
            if let moduleInput = moduleInput as? ChildModuleInput {
                moduleInput.configure()
            }
            return self.childOutput
        })
    }
    
    func closeChildModule() {
        childSegue?.unwind()
        childSegue = nil
    }
}
