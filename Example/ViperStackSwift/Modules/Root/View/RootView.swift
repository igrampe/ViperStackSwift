//
//  SBRootView.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ViperStackSwift
import SnapKit

class RootView: ModuleView, RootViewInput {

    var output: RootViewOutput?
    var openChildButton: UIButton?
    var titleLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        titleLabel = UILabel()
        titleLabel?.numberOfLines = 0
        titleLabel?.text = String(describing: self)
        if let titleLabel = titleLabel {
            view.addSubview(titleLabel)
        }
        
        openChildButton = UIButton(type: .system)
        openChildButton?.setTitle("Open Child", for: .normal)
        openChildButton?.addTarget(output, action: #selector(RootViewOutput.actionOpen), for: .touchUpInside)
        if let openChildButton = openChildButton {
            view.addSubview(openChildButton)
        }
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        titleLabel?.snp.makeConstraints { make in
            var offset: CGFloat = 0
            if #available(iOS 11.0, *) {
                offset = view.safeAreaInsets.top
            }
            offset = offset + 8
            make.top.equalTo(view).offset(offset)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(8)
        }
        
        openChildButton?.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
        }
        
        super.updateViewConstraints()
    }
}
