//
//  ModuleOpenPromise.swift
//  ViperStackSwift
//
//  Created by Semyon Belokovsky on 23/06/16.
//  Copyright © 2016 Semyon Belokovsky. All rights reserved.
//

import Foundation

public typealias ModuleLinkClosure = (ModuleInput?) -> ModuleOutput?
public typealias ModulePostLinkClosure = () -> Void

public class ModuleOpenPromise {
    
    public var linkClosure: ModuleLinkClosure?
    public var postLinkClosure: ModulePostLinkClosure?    
    public var segue: Segue?
    
    var moduleInput: ModuleInput? {
        didSet {
            moduleInputWasSet = true
            tryPerformLink()
        }
    }
    
    fileprivate var linkClosureWasSet: Bool = false
    fileprivate var moduleInputWasSet: Bool = false
    fileprivate var didPerfomLink: Bool = false
    
    public func link(_ closure: ModuleLinkClosure?) {
        linkClosure = closure
        linkClosureWasSet = true
        tryPerformLink()
    }
    
    private func tryPerformLink() {
        if (linkClosureWasSet && moduleInputWasSet) {
            performLink()
        }
    }
    
    private func performLink() {
        if (didPerfomLink) {
            return
        }
        didPerfomLink = true
        if let linkClosure = linkClosure {
            let moduleOutput = linkClosure(moduleInput)
            moduleInput?.moduleOutput = moduleOutput
        }
        if let postLinkClosure = postLinkClosure {
            postLinkClosure()
        }
    }
}
