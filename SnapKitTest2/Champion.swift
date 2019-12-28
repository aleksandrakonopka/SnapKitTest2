//
//  Champion.swift
//  SnapKitTest2
//
//  Created by Aleksandra on 28/12/2019.
//  Copyright © 2019 Aleksandra. All rights reserved.
//

import Foundation

enum ChampionType{
    case AP
    case AD
}
enum ChampionLine : String{
    case TOP = "TOP"
    case MID = "MID"
    case JUNG = "JUNG"
    case ADC = "ADC"
    case SUPP = "SUPP"
}
struct Champion
{
    var name : String
    var types : [ChampionType]
    var lines : [ChampionLine]
}
