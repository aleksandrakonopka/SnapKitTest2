//
//  ChampionLoader.swift
//  SnapKitTest2
//
//  Created by Aleksandra on 29/12/2019.
//  Copyright © 2019 Aleksandra. All rights reserved.
//

import Foundation

protocol ChampionLoader : class{
    func loadAllChampions(completion: @escaping ([Champion]?) -> Void)
}

class ChampionsLoaderImpl : ChampionLoader{
    func loadAllChampions(completion: @escaping ([Champion]?) -> Void) {
        let urlSession = URLSession(configuration : .ephemeral)
        let urlString = "https://guidescroll.com/2014/08/lol-champions-summary-list/"
        let url = URL(string:urlString)!
        var request = URLRequest(url:url)
        
        urlSession.dataTask(with: request){[weak self] (data ,_, error) in
            var allChampions : [Champion]?
            defer{
                DispatchQueue.main.async{
                    completion(allChampions)
                }
            }
            guard error == nil else {return}
            guard let data = data else {return}
            
            let htmlFromWebPage = String(data: data, encoding: .utf8)!
            //print(htmlFromWebPage)
            allChampions = self?.processingHTMLToGetChampionTable(html: htmlFromWebPage)
            print(allChampions?.count)
            return
        }.resume()
    }
    
    func processingHTMLToGetChampionTable(html:String) -> [Champion]?{
        var allChampions = [Champion]()
        
        let start = html.range(of: "<tbody>")?.upperBound
        let stop = html.range(of: "</tbody>")?.lowerBound
        guard start != nil, stop != nil else {return nil}
        let content = html[start!..<stop!]
        
        var components = content.components(separatedBy: "<tr>")
        components.removeFirst()
        components.removeFirst()
        
        for component in components{
            print("________CHAMPION________")
            var name : String?
            var types : [ChampionType]?
            var lines : [ChampionLine]?
            
            //print(component)
            var championElements = component.components(separatedBy: "<td")
            championElements.removeFirst()
            
            for (index,championElement) in championElements.enumerated(){
//                print("CHAMPION ELEMENT clear:")
//                print(championElement)
                let startChampionElement = championElement.range(of: ">")?.upperBound
                let stopChampionElement = championElement.range(of: "</td>")?.lowerBound
                guard startChampionElement != nil, stopChampionElement != nil else {return nil}
                let championElementClear = championElement[startChampionElement!..<stopChampionElement!]
                if index == 0{
                   print("Name: \(championElementClear)")
                   name = String(championElementClear)
                }else if index == 1{
                    print("Line/Lines: \(championElementClear)")
                    lines = processLinesFromString(linesString:String(championElementClear))
                    print("Ile linii \(lines?.count)")
                }else if index == 2{
                    print("Type/Types: \(championElementClear)")
                    types = processTypesFromString(typesString:String(championElementClear))
                    print("Ile typow \(types?.count)")
                }
            }
            guard name != nil, types != nil, lines != nil else {continue}
            let champion = Champion(name: name!, types: types!, lines: lines!)
            allChampions.append(champion)
        }
        
        if allChampions.count == 0 {
            return nil
        }
        
        return allChampions
    }
    
    func processLinesFromString(linesString:String) -> [ChampionLine]?{
        var championLines = [ChampionLine]()
        let components = linesString.components(separatedBy: "/")
        for component in components{
            print("Line component:\(component)")
            switch component {
            case "Mid":
                championLines.append(.MID)
            case "Support":
                championLines.append(.SUPP)
            case "Jungle":
                championLines.append(.JUNG)
            case "Top":
                championLines.append(.TOP)
            case "ADC":
                championLines.append(.ADC)
            default:
                continue
            }
        }
        if championLines.count == 0 {
            return nil
        }
        return championLines
    }
    func processTypesFromString(typesString:String) -> [ChampionType]?{
        var types = [ChampionType]()
        if typesString.contains("AD"){
            types.append(.AD)
        }
        
        if typesString.contains("AP"){
            types.append(.AP)
        }
        
        if types.count == 0{
            return nil
        }
        return types
    }
}
