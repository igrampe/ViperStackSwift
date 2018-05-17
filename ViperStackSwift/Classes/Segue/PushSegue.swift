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
        source?.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        source?.navigationController?.interactivePopGestureRecognizer?.delegate = self
        source?.navigationController?.delegate = self
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

extension PushSegue: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension PushSegue: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if #available(iOS 10, *) {
            navigationController.topViewController?.transitionCoordinator?.notifyWhenInteractionChanges({ [weak self] context in
                if (!context.isCancelled) {
                    guard let welf = self else {
                        return
                    }
                    welf.delegate?.pushSegueScreenPanDidFinish(pushSegue: welf)
                }
            })
        } else {
            navigationController.topViewController?.transitionCoordinator?.notifyWhenInteractionEnds({ [weak self] (context) in
                if (!context.isCancelled) {
                    guard let welf = self else {
                        return
                    }
                    welf.delegate?.pushSegueScreenPanDidFinish(pushSegue: welf)
                }
            })
        }
    }
}
