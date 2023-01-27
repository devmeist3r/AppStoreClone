//
//  FeaturedApp.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation

struct FeaturedApp: Decodable {
    
    let id: Int
    let nome: String
    let empresa: String
    let imagemUrl: String
    let descricao: String
    
}
