//
//	ModalView.swift
//  Modal
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import UIKit
import ViperStackSwift

class ModalView: ModuleView, ModalViewInput {

    var output: ModalViewOutput?
    
    var openPushButton: UIButton?
    var closeModalButton: UIButton?
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
        
        openPushButton = UIButton(type: .system)
        openPushButton?.setTitle("Open Push", for: .normal)
        openPushButton?.addTarget(output, action: #selector(ModalViewOutput.actionOpenPush), for: .touchUpInside)
        if let openPushButton = openPushButton {
            view.addSubview(openPushButton)
        }
        
        closeModalButton = UIButton(type: .system)
        closeModalButton?.setTitle("Close Modal", for: .normal)
        closeModalButton?.addTarget(output, action: #selector(ModalViewOutput.actionClose), for: .touchUpInside)
        if let closeModalButton = closeModalButton {
            view.addSubview(closeModalButton)
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
        
        openPushButton?.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
        }
        
        closeModalButton?.snp.makeConstraints { make in
            if let openPushButton = openPushButton {
                make.top.equalTo(openPushButton.snp.bottom).offset(8)
            }
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        super.updateViewConstraints()
    }
}
