//
//  ChildRouterInput.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

protocol ChildRouterInput {
    
    func openModalModule(inNavigation: Bool)
    func closModalModule()
}
