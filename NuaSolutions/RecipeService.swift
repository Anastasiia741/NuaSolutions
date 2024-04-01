//  RecipeService.swift
//  Nua Solutions
//  Created by Анастасия Набатова on 21/3/24.

import Foundation

final class RecipeService {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchRecipe(request: URLRequest?, completion: @escaping (Result<Recipes, Error>) -> Void) {
        guard let request = request else {
            completion(.failure(NetworkErrors.parsingError))
            return
        }
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NetworkErrors.dataNotReceivedError))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let recipesResponse = try decoder.decode(Recipes.self, from: data ?? Data())
                completion(.success(recipesResponse))
            } catch {
                completion(.failure(NetworkErrors.parsingError))
            }
        }.resume()
    }
}




