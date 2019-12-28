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
    var champions : [Champion]?
    override func viewDidLoad() {
        super.viewDidLoad()
        champions = [Champion(name: "Champion1", types: [.AD], lines: [.JUNG]),Champion(name: "Champion2", types: [.AD], lines: [.JUNG,.MID]),Champion(name: "Champion3", types: [.AD], lines: [.JUNG]),Champion(name: "Champion4", types: [.AD], lines: [.JUNG,.TOP]),Champion(name: "Champion5", types: [.AD], lines: [.JUNG]),Champion(name: "Champion6", types: [.AD], lines: [.JUNG]),Champion(name: "Champion7", types: [.AD], lines: [.JUNG]),Champion(name: "Champion8", types: [.AD], lines: [.JUNG]),Champion(name: "Champion9", types: [.AD], lines: [.ADC]),Champion(name: "Champion10", types: [.AD], lines: [.SUPP]),Champion(name: "Champion11", types: [.AD], lines: [.JUNG]),Champion(name: "Champion12", types: [.AD], lines: [.ADC]),Champion(name: "Champion13", types: [.AD], lines: [.JUNG]),Champion(name: "Champion14", types: [.AD], lines: [.JUNG]),Champion(name: "Champion15", types: [.AD], lines: [.JUNG]),Champion(name: "Champion16", types: [.AD], lines: [.JUNG]),Champion(name: "Champion17", types: [.AD], lines: [.JUNG]),Champion(name: "Champion18", types: [.AD], lines: [.JUNG]),Champion(name: "Champion19", types: [.AD], lines: [.JUNG]),Champion(name: "Champion20", types: [.AD], lines: [.JUNG])]
        createTable()
        view.backgroundColor = .yellow
        title = "League of Legends Champions"
    }

    override func viewWillAppear(_ animated: Bool) {
        setupTableViewConstraints()
    }
    func setupTableViewConstraints(){
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.left.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
        }//do view Will appear
    }
    func createTable(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomChampionCell.self, forCellReuseIdentifier: "ChampionCell")
        
        view.addSubview(tableView)
        tableView.reloadData()
    }
}
extension ChampionsListViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return champions!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChampionCell", for: indexPath) as? CustomChampionCell else {fatalError("The cell is not CustomChampionCell")}
            cell.champion = champions![indexPath.row]
        //tutaj przenieść to z Champion cell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
