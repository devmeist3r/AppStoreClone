//
//  AppGroup.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation

struct AppGrouop: Decodable {
    let id: String
    let titulo: String
    let apps: [App]
}
