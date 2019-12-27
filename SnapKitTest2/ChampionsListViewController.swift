//
//  ViewController.swift
//  SnapKitTest2
//
//  Created by Aleksandra on 27/12/2019.
//  Copyright © 2019 Aleksandra. All rights reserved.
//

import UIKit
import SnapKit

class ChampionsListViewController: UIViewController {
     var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomChampionCell.self, forCellReuseIdentifier: "ChampionCell")
        
        view.backgroundColor = .yellow
        let box = UIView()
        box.backgroundColor = .green
        //view.addSubview(box)
        view.addSubview(tableView)
        tableView.reloadData()
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(20)
            make.left.equalTo(view).offset(20)
            make.bottom.equalTo(view).offset(-20)
            make.right.equalTo(view).offset(-20)
        }
        title = "League of Legends Champions"
//        box.snp.makeConstraints { (make) -> Void in
//            make.top.equalTo(view).offset(20)
//            make.left.equalTo(view).offset(20)
//            make.bottom.equalTo(view).offset(-20)
//            make.right.equalTo(view).offset(-20)
//        }
    }


}

extension ChampionsListViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChampionCell", for: indexPath) as? CustomChampionCell else {fatalError("The cell is not CustomChampionCell")}
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
