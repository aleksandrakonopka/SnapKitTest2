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
    var championImage : UIImageView!
    var championTypeFirst : UIImageView!
    var championTypeSecond : UIImageView!
    
    var linesStackView : UIStackView!
    var linesAndNameStackView : UIStackView!
    
    var typesStackView : UIStackView!
    var typesAndChampionImageStackView : UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    func configure(){
        initialiseInstanesOfCellElements()
    
        setUpLeftStackViews()
        self.contentView.addSubview(linesAndNameStackView)
        setUpLeftConstraints()
        
        setUpRightStackViews()
        self.contentView.addSubview(typesAndChampionImageStackView)
        setUpRightConstraints()
    }
    
    func initialiseInstanesOfCellElements(){
        championNameLabel = UILabel(frame: .zero)
        championLineFirst = UIImageView()
        championLineSecond = UIImageView()
        championTypeFirst = UIImageView()
        championTypeSecond = UIImageView()
        championImage = UIImageView()
    }
    
    func setUpLeftStackViews(){
        setUpLinesStackView()
        setupLinesAndNameStackView()
    }
    
    func setUpLinesStackView(){
        linesStackView = UIStackView()
        linesStackView.axis = .horizontal
        linesStackView.addArrangedSubview(championLineFirst)
        linesStackView.addArrangedSubview(championLineSecond)
        linesStackView.spacing = 20
    }
    
    func setupLinesAndNameStackView(){
        linesAndNameStackView = UIStackView()
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
    
    func setUpRightStackViews(){
        setUpTypesStackView()
        setupTypesAndChampionImageStackView()
    }
    
    func setUpTypesStackView(){
        typesStackView = UIStackView()
        typesStackView.axis = .vertical
        typesStackView.addArrangedSubview(championTypeFirst)
        typesStackView.addArrangedSubview(championTypeSecond)
        typesStackView.spacing = 10
    }
    
    func setupTypesAndChampionImageStackView(){
        typesAndChampionImageStackView = UIStackView()
        typesAndChampionImageStackView.axis = .horizontal
        typesAndChampionImageStackView.addArrangedSubview(typesStackView)
        typesAndChampionImageStackView.addArrangedSubview(championImage)
        typesAndChampionImageStackView.spacing = 10
    }
    
    func setUpRightConstraints(){
        typesAndChampionImageStackView.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
        }
        championTypeFirst.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: 35, height: 35))
        }
        championTypeSecond.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: 35, height: 35))
        }
        championImage.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: 80, height: 80))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
