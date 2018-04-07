//
//  AppAssembly.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Swinject

final class AppAssembly {
    
    class var assembler: Assembler {
        return Assembler([
            RootAssembly(),
            ])
    }
    
    var assembler: Assembler
    
    init(with assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }

    class func assembleApp(_ appDeleagete: AppDelegate) {
        appDeleagete.window = mainWindow()
    }
    
    class func mainWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = assembler.resolver.resolve(RootView.self)
        return window
    }
}
