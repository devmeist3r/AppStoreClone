//
//  File.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppService {
    static let shared = AppService()
    
    func getFeaturedApps(completion: @escaping ([FeaturedApp]?, Error?) -> ()) {
        guard let url = URL(string: "https://api.euprogramador.app/app-store/v1/apps/apps-em-destaque") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else { return }
                let apps = try JSONDecoder().decode([FeaturedApp].self, from: data)
                print(apps)
                completion(apps, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }

}
