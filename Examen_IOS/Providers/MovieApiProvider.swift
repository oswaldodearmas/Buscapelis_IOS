//
//  MovieApiProvider.swift
//  Examen_IOS
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

class MovieAPIProvider {
    
    // MARK: API Network calls
    
    static func searchMovieListByName(movieName: String, completionHandler: @escaping ([Movie]) -> Void) {
        
        let url = URL(string:"https://www.omdbapi.com/?apikey=88bf6f95&s=\(movieName)")
            
            let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if let error = error {
                    print("Error fetching superheroes: \(error)")
                    return
                }
                
                
                guard let data = data else {
                    print("Error with the data")
                    return
                }
                
                print("Data: \(data)")
                
                guard let json = try? JSONDecoder().decode(MovieListResponse.self, from: data) else {
                    print("JSON parse exception")
                    return
                }
                
                completionHandler(json.Search)
                
            })
            
            task.resume()
        }
        
    static func findMovieById(movieId:String, completionHandler: @escaping (Movie) -> Void) {
            
        let url = URL(string:"https://www.omdbapi.com/?apikey=88bf6f95&i=\(movieId)")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error fetching superheroes: \(error)")
                return
            }
            
            
            guard let data = data else {
                print("Error with the data")
                return
            }
            
            print("Data: \(data)")
            
            guard let json = try? JSONDecoder().decode(Movie.self, from: data) else {
                print("JSON parse exception")
                return
            }
            
            completionHandler(json)
            
        })
        
        task.resume()
        
        }
    
    // MARK: Utils
    
    struct RuntimeError: Error {
        let description: String
        
        init(_ description: String) {
            self.description = description
        }
    }
    
}
