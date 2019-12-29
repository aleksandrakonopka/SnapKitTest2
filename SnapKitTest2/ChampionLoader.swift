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
            print(htmlFromWebPage)
            //allChampions = try? JSONDecoder().decode([Champion].self,from: data)
            //TODO - przetwarzanie danych
            return
        }.resume()
    }
}
