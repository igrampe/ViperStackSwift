//
//  ChildSegue.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import ViperStackSwift

class ChildSegue: BaseSegue {
    
    override func perform() {
        guard let destination = destination,
              let source = source
        else {
            return
        }
        destination.willMove(toParentViewController: source)
        source.addChildViewController(destination)
        if (animated) {
            source.view.addSubview(destination.view)
            destination.view.frame = CGRect(x: 0,
                                            y: -source.view.bounds.height,
                                            width: source.view.bounds.width,
                                            height: source.view.bounds.height);
            UIView.animate(withDuration: 0.5, animations: {
                destination.view.frame = source.view.bounds;
            }) { (finished) in
                destination.didMove(toParentViewController: source)
            }
        } else {
            destination.view.frame = source.view.bounds;
            source.view.addSubview(destination.view)
            destination.didMove(toParentViewController: source)
        }
    }
    
    override func unwind() {
        guard let destination = destination
            else { return }
        destination.willMove(toParentViewController: nil)
        source?.viewWillAppear(animated)
        if (animated) {
            UIView.animate(withDuration: 0.5, animations: {
                destination.view.frame = CGRect(x: 0,
                                                y: -destination.view.bounds.height,
                                                width: destination.view.bounds.width,
                                                height: destination.view.bounds.height);
            }) { (finished) in
                destination.view.removeFromSuperview()
                destination.removeFromParentViewController()
                destination.didMove(toParentViewController: nil)
                self.source?.viewDidAppear(self.animated)
            }
        } else {
            destination.view.removeFromSuperview()
            destination.removeFromParentViewController()
            destination.didMove(toParentViewController: nil)
            source?.viewDidAppear(animated)
        }
    }
}
