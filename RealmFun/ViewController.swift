//
//  ViewController.swift
//  RealmFun
//
//  Created by BumMo Koo on 2021/10/09.
//

import UIKit

class ViewController: UIViewController {
    
    let controlVC = ControlViewController()
    let tableVC = TableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(controlVC)
        addChild(tableVC)
        
        view.addSubview(controlVC.view)
        view.addSubview(tableVC.view)
        
        controlVC.didMove(toParent: self)
        tableVC.didMove(toParent: self)
        
        
        controlVC.view.snp.makeConstraints { make in
            make.top.left.trailing.equalToSuperview()
        }
        tableVC.view.snp.makeConstraints { make in
            make.bottom.left.trailing.equalToSuperview()
            make.top.equalTo(controlVC.view.snp.bottom)
            make.height.equalTo(controlVC.view.snp.height).multipliedBy(3)
        }
    }


}

