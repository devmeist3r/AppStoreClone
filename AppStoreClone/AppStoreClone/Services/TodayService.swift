import Foundation

class TodayService {
    static let shared = TodayService()
    
    func searchFeatured(completion: @escaping ([TodayApp]?, Error?) -> ()) {
        var todayApps: Array<TodayApp> = [
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
            
        ]
        
        AppService.shared.searchApps { (apps, err) in
            if let apps = apps {
                todayApps.append(
                    TodayApp(
                        id: 3,
                        categoria: "A LISTA DO DIA",
                        titulo: "Pedale melhor com \nApple Watch",
                        imageUrl: nil,
                        descricao: nil,
                        backgroundColor: nil,
                        apps: apps
                    )
                )
            }
            completion(todayApps, nil)
        }   
    }
}
