//
//  ChildViewIO.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

protocol ChildViewInput: class {
    
}

@objc protocol ChildViewOutput {
    func actionOpenModal()
    func actionClose()
}
