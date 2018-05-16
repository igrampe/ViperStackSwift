//
//  BaseSegue.swift
//  ViperStackSwift
//
//  Created by Semyon Belokovsky on 08/04/2018.
//

import UIKit

open class BaseSegue: NSObject, Segue {
    
    public weak var source: UIViewController?
    public var destination: UIViewController?
    public var animated: Bool = true
    
    open func perform() {
        
    }
    
    open func unwind() {
        
    }
}
