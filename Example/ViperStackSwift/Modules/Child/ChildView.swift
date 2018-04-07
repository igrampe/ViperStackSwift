//
//  ChildView.swift
//  ViperStackSwift_Example
//
//  Created by Semyon Belokovsky on 07/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import ViperStackSwift

class ChildView: ModuleView, ChildViewInput {
    
    var output: ChildViewOutput?
    
    var openModalButton: UIButton?
    var closeChildButton: UIButton?
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
        
        openModalButton = UIButton(type: .system)
        openModalButton?.setTitle("Open Modal", for: .normal)
        openModalButton?.addTarget(output, action: #selector(ChildViewOutput.actionOpenModal), for: .touchUpInside)
        if let openChildButton = openModalButton {
            view.addSubview(openChildButton)
        }
        
        closeChildButton = UIButton(type: .system)
        closeChildButton?.setTitle("Close Child", for: .normal)
        closeChildButton?.addTarget(output, action: #selector(ChildViewOutput.actionClose), for: .touchUpInside)
        if let closeChildButton = closeChildButton {
            view.addSubview(closeChildButton)
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
        
        openModalButton?.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
        }
        
        closeChildButton?.snp.makeConstraints { make in
            if let openModalButton = openModalButton {
                make.top.equalTo(openModalButton.snp.bottom).offset(8)
            }
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        super.updateViewConstraints()
    }
}
