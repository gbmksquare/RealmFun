//
//  ControlViewController.swift
//  RealmFun
//
//  Created by BumMo Koo on 2021/10/09.
//

import UIKit
import RealmSwift

class ControlViewController: UIViewController {
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 16
        return stack
    }()
    
    let add: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(tap(add:)), for: .touchUpInside)
        return button
    }()
    
    let delete: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(tap(delete:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        stack.addArrangedSubview(add)
        stack.addArrangedSubview(delete)
    }
    
    @objc
    private func tap(add: UIButton) {
        let memo = Memo()
        memo.title = Date().description
        
        do {
            let realm = try Realm()
            try realm.write({
                realm.add(memo)
            })
        } catch {
            print(error)
        }
    }
    
    @objc
    private func tap(delete: UIButton) {
        do {
            let realm = try Realm()
            let memos = realm.objects(Memo.self)
            try realm.write {
                realm.delete(memos)
            }
        } catch {
            print(error)
        }
    }
}
