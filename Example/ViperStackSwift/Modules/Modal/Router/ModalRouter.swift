//
//	ModalRouter.swift
//  Modal
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import Foundation
import ViperStackSwift

class ModalRouter: ModuleRouter, ModalRouterInput {
    
    var pushSegue: Segue?
    var pushOutput: PushModuleOutput?
    
    func openPushModule() {
        pushSegue = PushSegue()
        
        self.pushSegue?.source = transitionHandler as? UIViewController
        self.pushSegue?.destination = ModalAssembly.assembler.resolver.resolve(PushView.self)
        transitionHandler?.openModule(withSegue: pushSegue, linkClosure: { moduleInput -> ModuleOutput? in
            return self.pushOutput
        })
    }
    
    func closPushModule() {
        pushSegue?.unwind()
        pushSegue = nil
    }
}
