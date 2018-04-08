//
//  ChildRouter.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import ViperStackSwift

class ChildRouter: ModuleRouter, ChildRouterInput {
    
    var modalSegue: Segue?
    var modalOutput: ModalModuleOutput?
    
    func openModalModule(inNavigation: Bool) {
        if (inNavigation) {
            modalSegue = ModalInNavigationSegue()
        } else {
            modalSegue = ModalSegue()
        }
        
        self.modalSegue?.source = transitionHandler as? UIViewController
        self.modalSegue?.destination = ChildAssembly.assembler.resolver.resolve(ModalView.self)
        transitionHandler?.openModule(withSegue: modalSegue, linkClosure: { moduleInput -> ModuleOutput? in
            return self.modalOutput
        })
    }
    
    func closModalModule() {
        modalSegue?.unwind()
        modalSegue = nil
    }
}
