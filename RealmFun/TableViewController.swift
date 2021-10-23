//
//  TableViewController.swift
//  RealmFun
//
//  Created by BumMo Koo on 2021/10/09.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController {
    
    private var memos: Results<Memo>? {
        didSet {
            updateView()
        }
    }
    
    private var token: NotificationToken?
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Get initial Result
        do {
            let realm = try Realm()
            memos = realm.objects(Memo.self)
            
            // Observe
            token = memos?.observe(on: .main, { [weak self] changes in
                self?.updateView()
            })
        } catch {
            print(error)
        }
    }
    
    private func setup() {
        view.backgroundColor = .yellow
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func updateView() {
        tableView.reloadData()
    }
    
    deinit {
        token?.invalidate()
        token = nil
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let c = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = c
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        // Populate
        if let memo = memos?[indexPath.row] {
            cell.textLabel?.text = memo.title
            cell.detailTextLabel?.text = memo.content
            cell.detailTextLabel?.numberOfLines = 0
            cell.detailTextLabel?.textColor = .secondaryLabel
        }
        
        return cell
    }
}
