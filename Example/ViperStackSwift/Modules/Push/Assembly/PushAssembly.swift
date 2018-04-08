//
//	PushAssembly.swift
//  Push
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import Foundation
import Swinject
import ViperStackSwift

public class PushAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(PushInteractor.self) { (r, presenter: PushPresenter) in
            let interactor = PushInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(PushRouter.self) { (r, view: TransitionHandler) in
            let router = PushRouter()
            router.transitionHandler = view
            return router
        }
        
        container.register(PushPresenter.self) { (r, view: PushViewInput) in
            let presenter = PushPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(PushInteractor.self, argument: presenter)
            return presenter
        }.initCompleted { (r, presenter) in
            if let view = presenter.view as? TransitionHandler {
                presenter.router = r.resolve(PushRouter.self, argument: view)
            }
        }
        
        container.register(PushView.self) { (r) in
            let view = PushView()
            view.output = r.resolve(PushPresenter.self, argument: view as PushViewInput)
            view.moduleInput = r.resolve(PushPresenter.self, argument: view as PushViewInput)
            
            return view
        }
    }
    
    class var assembler: Assembler {
        return Assembler([
            // Add child asseblies
            ])
    }
}
