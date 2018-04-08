//
//  ChildModuleInput.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import ViperStackSwift

protocol ChildModuleInput: ModuleInput {
    func configure()
}

protocol ChildModuleOutput: ModuleOutput {
    func childModuleDidFinish()
}
