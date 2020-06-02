//
//  TodayService.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 23/05/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation


class TodayService {
    static let shared = TodayService()
    
    func searchFeatured(completion: @escaping ([TodayApp]?, Error?) -> ()) {
        let todayApps: Array<TodayApp> = [
            TodayApp(
                id: 1,
                categoria: "Viagem",
                titulo: "Explore",
                imageUrl: "destaque-1",
                descricao: "Podemos viajar o mundo em buscar da beleza, mas nunca a encontraremos se não a carregarmos dentro de nós.",
                backgroundColor: "#FFFFFF",
                apps: nil
            ),
            TodayApp(
                id: 2,
                categoria: "Viagem",
                titulo: "Explore",
                imageUrl: "destaque-2",
                descricao: "Podemos viajar o mundo em buscar da beleza, mas nunca a encontraremos se não a carregarmos dentro de nós.",
                backgroundColor: "#697866",
                apps: nil
            ),
            TodayApp(
                id: 3,
                categoria: "A LISTA DO DIA",
                titulo: "Pedale melhor com \nApple Watch",
                imageUrl: nil,
                descricao: nil,
                backgroundColor: nil,
                apps: []
            )
        ]
        
        completion(todayApps, nil)
    }
}
