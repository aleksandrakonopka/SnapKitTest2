//
//  CustomChampionCell.swift
//  SnapKitTest2
//
//  Created by Aleksandra on 27/12/2019.
//  Copyright © 2019 Aleksandra. All rights reserved.
//

import Foundation
import UIKit

class CustomChampionCell : UITableViewCell{
    var championNameLabel : UILabel!
    var championLineFirst : UIImageView!
    var championLineSecond : UIImageView!
    var championImage : UIImageView?
    var championTypeFirst : UIImageView?
    var championTypeSecond : UIImageView?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    func configure(){
        championNameLabel = UILabel(frame: .zero)
        self.contentView.addSubview(championNameLabel)
        championNameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(2)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        championLineFirst = UIImageView()
        self.contentView.addSubview(championLineFirst)
        championLineFirst.snp.makeConstraints{
            $0.left.equalToSuperview().offset(5)
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.top.equalToSuperview().offset(10)
        }
        
        championLineSecond = UIImageView()
        self.contentView.addSubview(championLineSecond)
        championLineSecond.snp.makeConstraints{
            $0.left.equalTo(championLineFirst).offset(50)
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.top.equalToSuperview().offset(10)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
