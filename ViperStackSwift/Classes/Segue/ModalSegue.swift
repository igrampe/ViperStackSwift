//
//  ModalSegue.swift
//  SBViperStackSwift
//
//  Created by Semyon Belokovsky on 07/04/2018.
//

import UIKit

public class ModalSegue: BaseSegue {
    open override func perform() {
        perform(completion: nil)
    }
    
    open override func unwind() {
        unwind(completion: nil)
    }
    
    open func perform(completion: (() -> Void)?) {
        guard let destination = destination else {
            return
        }
        source?.present(destination, animated: animated, completion: completion)
    }
    
    open func unwind(completion: (() -> Void)?) {
        destination?.dismiss(animated: animated, completion: completion)
    }
}
