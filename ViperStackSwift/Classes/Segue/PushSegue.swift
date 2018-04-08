//
//  PushSegue.swift
//  ViperStackSwift
//
//  Created by Semyon Belokovsky on 07/04/2018.
//

import UIKit

public class PushSegue: BaseSegue {
    
    open override func perform() {
        guard let destination = destination else {
            return
        }
        source?.navigationController?.pushViewController(destination, animated: animated)
    }
    
    open override func unwind() {
        destination?.navigationController?.popViewController(animated: animated)
    }
    
    open func unwindToRoot() {
        destination?.navigationController?.popToRootViewController(animated: animated)
    }
    
    open func unwind(to viewController: UIViewController) {
        destination?.navigationController?.popToViewController(viewController, animated: animated)
    }
}
