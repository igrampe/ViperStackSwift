//
//  SBRootPresenter.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import ViperStackSwift

class RootPresenter: RootViewOutput, RootInteractorOutput, RootModuleInput, ChildModuleOutput {
    
    var router: RootRouterInput?
    weak var view: RootViewInput?
    var interactor: RootInteractorInput?
    
    weak var moduleOutput: ModuleOutput?
    
    func actionOpen() {
        router?.openChildModule()
    }
    
    func childModuleDidFinish() {
        self.router?.closeChildModule()
    }
}
