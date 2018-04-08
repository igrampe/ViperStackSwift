//
//	ModalAssembly.swift
//  Modal
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import Foundation
import Swinject
import ViperStackSwift

public class ModalAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ModalInteractor.self) { (r, presenter: ModalPresenter) in
            let interactor = ModalInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(ModalRouter.self) { (r, view: TransitionHandler) in
            let router = ModalRouter()
            router.transitionHandler = view
            if let view = view as? ModalViewInput {
                router.pushOutput = r.resolve(ModalPresenter.self, argument: view)
            }
            return router
        }
        
        container.register(ModalPresenter.self) { (r, view: ModalViewInput) in
            let presenter = ModalPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(ModalInteractor.self, argument: presenter)
            return presenter
        }.initCompleted { (r, presenter) in
            if let view = presenter.view as? TransitionHandler {
                presenter.router = r.resolve(ModalRouter.self, argument: view)
            }
        }
        
        container.register(ModalView.self) { (r) in
            let view = ModalView()
            view.output = r.resolve(ModalPresenter.self, argument: view as ModalViewInput)
            view.moduleInput = r.resolve(ModalPresenter.self, argument: view as ModalViewInput)
            
            return view
        }
    }
    
    class var assembler: Assembler {
        return Assembler([
            PushAssembly()
            ])
    }
}
