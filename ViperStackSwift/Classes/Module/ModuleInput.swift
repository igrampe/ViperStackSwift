//
//  ModuleInput.swift
//  ViperStackSwift
//
//  Created by Semyon Belokovsky on 23/06/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

import Foundation

public protocol ModuleInput: class {
    
    var moduleOutput: ModuleOutput? { get set }
}
