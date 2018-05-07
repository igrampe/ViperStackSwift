//
//  Segue.swift
//  ViperStackSwift
//
//  Created by Semyon Belokovsky on 08/04/2018.
//

import Foundation

public protocol Segue {
    var source: UIViewController? { get set }
    var destination: UIViewController? { get set }
    
    func perform()
    func unwind()
}
