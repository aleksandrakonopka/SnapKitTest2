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
    var championsLoaderImpl : ChampionLoader?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        championsLoaderImpl = ChampionsLoaderImpl()
        championsLoaderImpl?.loadAllChampions(completion: { (champion) in
            print("Done")
            self.champions = champion
            self.tableView.reloadData()
        })
        
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
        }
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
        guard champions != nil else {return 0}
         return champions!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChampionCell", for: indexPath) as? CustomChampionCell else {fatalError("The cell is not CustomChampionCell")}
        
            let champion = champions![indexPath.row]
            cell.championNameLabel.text = champion.name
            cell.championLineFirst.image = UIImage(named:
                "\(champion.lines[0].rawValue)")
            if champion.lines.count > 1 {
                cell.championLineSecond.image = UIImage(named:
                "\(champion.lines[1].rawValue)")
            }
            cell.championImage.image = UIImage(named:"ADC")
            cell.championTypeFirst.image = UIImage(named:"SUPP")
            cell.championTypeSecond.image = UIImage(named:"JUNG")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
