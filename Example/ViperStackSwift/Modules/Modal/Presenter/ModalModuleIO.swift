//
//	ModalModuleIO.swift
//  Modal
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import Foundation
import ViperStackSwift

protocol ModalModuleInput: ModuleInput {
    
}

protocol ModalModuleOutput: ModuleOutput {
    
    func modalModuleDidFinish()
}
