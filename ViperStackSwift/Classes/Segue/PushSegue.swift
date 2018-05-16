//
//  PushSegue.swift
//  ViperStackSwift
//
//  Created by Semyon Belokovsky on 07/04/2018.
//

import UIKit

public protocol PushSegueDelegate: class {
    func pushSegueScreenPanDidFinish(pushSegue: PushSegue)
}

public class PushSegue: BaseSegue {
    public weak var delegate: PushSegueDelegate?
    var interactionCancelled = false
    
    open override func perform() {
        guard let destination = destination else {
            return
        }
        source?.navigationController?.pushViewController(destination, animated: animated)
        source?.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        source?.navigationController?.interactivePopGestureRecognizer?.delegate = self
        source?.navigationController?.interactivePopGestureRecognizer?.addTarget(self, action: #selector(handleScreenPan(gesture:)))
        source?.navigationController?.delegate = self
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
    
    @objc func handleScreenPan(gesture: UIScreenEdgePanGestureRecognizer) {
        print(gesture.state.rawValue)
        if (gesture.state == .ended) {
            if (!interactionCancelled) {
                delegate?.pushSegueScreenPanDidFinish(pushSegue: self)
            }
        }
    }
}

extension PushSegue: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension PushSegue: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if #available(iOS 11, *) {
            navigationController.topViewController?.transitionCoordinator?.notifyWhenInteractionChanges({ [weak self] context in
                self?.interactionCancelled = false
                if (context.isCancelled) {
                    self?.interactionCancelled = true
                }
            })
        }
        
    }
}
