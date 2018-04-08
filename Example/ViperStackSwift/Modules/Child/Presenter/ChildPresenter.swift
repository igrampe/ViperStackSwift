//
//  ChildPresenter.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import ViperStackSwift

class ChildPresenter: ChildViewOutput, ChildInteractorOutput, ChildModuleInput, ModalModuleOutput {
    
    var router: ChildRouterInput?
    weak var view: ChildViewInput?
    var interactor: ChildInteractorInput?
    
    weak var moduleOutput: ModuleOutput?
    
    fileprivate func getModuleOutput() -> ChildModuleOutput? {
        return moduleOutput as? ChildModuleOutput
    }
    
    func configure() {
        print("ChildModule Configure")
    }
    
    func actionOpenModal() {
        router?.openModalModule(inNavigation: false)
    }
    
    func actionOpenModalInNavigation() {
        router?.openModalModule(inNavigation: true)
    }
    
    func actionClose() {
        getModuleOutput()?.childModuleDidFinish()
    }
    
    func modalModuleDidFinish() {
        router?.closModalModule()
    }
}
