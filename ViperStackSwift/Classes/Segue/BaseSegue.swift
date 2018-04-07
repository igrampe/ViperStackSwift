//
//  BaseSegue.swift
//  Pods
//
//  Created by Semyon Belokovsky on 02/07/16.
//
//

import UIKit

open class BaseSegue: Segue {
    
    public weak var source: UIViewController?
    public var destination: UIViewController?
    public var animated: Bool = true
    
    public init() {
        
    }
    
    open func perform() {
        
    }
    
    open func unwind() {
        
    }
}
