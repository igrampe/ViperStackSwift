//
//  Segue.swift
//  Pods
//
//  Created by Semyon Belokovsky on 02/07/16.
//
//

import Foundation

public protocol Segue {
    var source: UIViewController? { get set }
    var destination: UIViewController? { get set }
    
    func perform()
    func unwind()
}
