//
//  App.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation

struct App: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let avaliacao: String
    let iconeUrl: String
    let descricao: String?
    let screenshotUrls: [String]?
    let comentarios: [AppComentario]?
}
