//
//  AppComentario.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 02/05/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation

struct AppComentario: Decodable {
    let id: Int
    let titulo: String
    let avaliacao: Int
    let descricao: String?
}
