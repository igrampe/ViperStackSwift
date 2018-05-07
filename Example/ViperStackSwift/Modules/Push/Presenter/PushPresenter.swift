//
//	PushPresenter.swift
//  Push
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import Foundation
import ViperStackSwift

class PushPresenter: PushViewOutput, PushInteractorOutput, PushModuleInput {    
    var router: PushRouterInput?
    weak var view: PushViewInput?
    var interactor: PushInteractorInput?
    
    weak var moduleOutput: ModuleOutput?

    fileprivate func getModuleOutput() -> PushModuleOutput? {
        return moduleOutput as? PushModuleOutput
    }
    
    func actionClose() {
        getModuleOutput()?.pushModuleDidFinish()
    }
}
