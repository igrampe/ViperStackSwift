//
//  ChildAssembly.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Swinject
import ViperStackSwift

public class ChildAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ChildInteractor.self) { (r, presenter: ChildPresenter) in
            let interactor = ChildInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(ChildRouter.self) { (r, view: TransitionHandler) in
            let router = ChildRouter()
            router.transitionHandler = view
            if let view = view as? ChildViewInput {
                router.modalOutput = r.resolve(ChildPresenter.self, argument: view)
            }
            return router
        }
        
        container.register(ChildPresenter.self) { (r, view: ChildViewInput) in
            let presenter = ChildPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(ChildInteractor.self, argument: presenter)
            return presenter
            }.initCompleted { (r, presenter) in
                if let view = presenter.view as? TransitionHandler {
                    presenter.router = r.resolve(ChildRouter.self, argument: view)
                }
        }
        
        container.register(ChildView.self) { (r) in
            let view = ChildView()
            view.output = r.resolve(ChildPresenter.self, argument: view as ChildViewInput)
            view.moduleInput = r.resolve(ChildPresenter.self, argument: view as ChildViewInput)
            
            return view
        }
    }
    
    class var assembler: Assembler {
        return Assembler([
            ModalAssembly(),
            ])
    }
}
