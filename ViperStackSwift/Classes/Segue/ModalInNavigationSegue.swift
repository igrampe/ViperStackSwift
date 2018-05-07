//
//  ModalInNavigationSegue.swift
//  ViperStackSwift
//
//  Created by Semyon Belokovsky on 08/04/2018.
//

import Foundation
import UIKit

open class ModalInNavigationSegue: ModalSegue {
    
    override open func perform(completion: (() -> Void)?) {
        guard let destination = destination else {
            return
        }
        
        let navigationController = destination.navigationController ?? UINavigationController(rootViewController: destination)
        source?.present(navigationController, animated: animated, completion: nil)
    }
    
    override open func unwind(completion: (() -> Void)?) {
        destination?.navigationController?.dismiss(animated: animated, completion: completion)
    }
}
