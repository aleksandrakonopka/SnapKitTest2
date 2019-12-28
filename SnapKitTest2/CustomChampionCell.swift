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
    
    var linesStackView : UIStackView!
    var linesAndNameStackView : UIStackView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    func configure(){
        championNameLabel = UILabel(frame: .zero)
        championLineFirst = UIImageView()
        championLineSecond = UIImageView()
        
        setUpLeftStackViews()
        
        self.contentView.addSubview(linesAndNameStackView)
        
        setUpLeftConstraints()
    }
    
    func setUpLeftStackViews(){
        setUpLinesStackView()
        setupLinesAndNameStackView()
    }
    func setUpLinesStackView(){
        linesStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 100, height: 90))//zamiast frame uzyc constrainty
        linesStackView.axis = .horizontal
        linesStackView.addArrangedSubview(championLineFirst)
        linesStackView.addArrangedSubview(championLineSecond)
        linesStackView.spacing = 20
    }
    func setupLinesAndNameStackView(){
        linesAndNameStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        linesAndNameStackView.axis = .vertical
        linesAndNameStackView.addArrangedSubview(linesStackView)
        linesAndNameStackView.addArrangedSubview(championNameLabel)
        linesAndNameStackView.spacing = 20
    }
    func setUpLeftConstraints(){
        linesAndNameStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(10)
        }
        championLineFirst.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
        championLineSecond.snp.makeConstraints{
              $0.size.equalTo(CGSize(width: 40, height: 40))
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
