//
//	ModalViewIO.swift
//  Modal
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import Foundation

protocol ModalViewInput: class {
    
}

@objc protocol ModalViewOutput {
    func actionOpenPush()
    func actionClose()
}
