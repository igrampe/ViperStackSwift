//
//  RootAssembly.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Swinject
import ViperStackSwift

public class RootAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(RootInteractor.self) { (r, presenter: RootPresenter) in
            let interactor = RootInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(RootRouter.self) { (r, view: TransitionHandler) in
            let router = RootRouter()
            router.transitionHandler = view
            if let view = view as? RootViewInput {
                router.childOutput = r.resolve(RootPresenter.self, argument: view)
            }
            return router
        }
        
        container.register(RootPresenter.self) { (r, view: RootViewInput) in
            let presenter = RootPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(RootInteractor.self, argument: presenter)
            return presenter
        }.initCompleted { (r, presenter) in
            if let view = presenter.view as? TransitionHandler {
                presenter.router = r.resolve(RootRouter.self, argument: view)
            }
        }
        
        container.register(RootView.self) { (r) in
            let view = RootView()
            view.output = r.resolve(RootPresenter.self, argument: view as RootViewInput)
            view.moduleInput = r.resolve(RootPresenter.self, argument: view as RootViewInput)
            
            return view
        }
    }
    
    class var assembler: Assembler {
        return Assembler([
            ChildAssembly(),
            ])
    }
}
