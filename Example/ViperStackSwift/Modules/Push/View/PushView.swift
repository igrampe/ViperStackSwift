//
//	PushView.swift
//  Push
//  Example
//
//  Created by Semyon Belokovsky on 08/04/2018.
//  Copyright © 2018 igrampe. All rights reserved.
//


import UIKit
import ViperStackSwift

class PushView: ModuleView, PushViewInput {

    var output: PushViewOutput?
    
    var closePushButton: UIButton?
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
        
        closePushButton = UIButton(type: .system)
        closePushButton?.setTitle("Close Push", for: .normal)
        closePushButton?.addTarget(output, action: #selector(PushViewOutput.actionClose), for: .touchUpInside)
        if let closeModalButton = closePushButton {
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
        
        closePushButton?.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
        }
        
        super.updateViewConstraints()
    }
}
