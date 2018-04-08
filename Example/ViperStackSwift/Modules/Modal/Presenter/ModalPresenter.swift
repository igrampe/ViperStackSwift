//
//	ModalPresenter.swift
//  Modal
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import Foundation
import ViperStackSwift

class ModalPresenter: ModalViewOutput, ModalInteractorOutput, ModalModuleInput, PushModuleOutput {
    
    var router: ModalRouterInput?
    weak var view: ModalViewInput?
    var interactor: ModalInteractorInput?
    
    weak var moduleOutput: ModuleOutput?

    fileprivate func getModuleOutput() -> ModalModuleOutput? {
        return moduleOutput as? ModalModuleOutput
    }
    
    func actionOpenPush() {
        router?.openPushModule()
    }
    
    func actionClose() {
        getModuleOutput()?.modalModuleDidFinish()
    }
    
    func pushModuleDidFinish() {
        router?.closPushModule()
    }
}
