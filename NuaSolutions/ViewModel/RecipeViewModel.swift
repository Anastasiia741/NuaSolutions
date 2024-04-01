//  RecipeViewModel.swift
//  Nua Solutions
//  Created by Анастасия Набатова on 21/3/24.

import UIKit

final class RecipeViewModel: ObservableObject {
    
    private let recipeService = RecipeService()
    public var allRecipes: [RecipeDomainModel] = []
    private(set) var error: NetworkErrors?
    
    func fetchData(with query: String, completion: @escaping () -> Void) {
        let request = ApiRequest().makeRequest(with: query)
        recipeService.fetchRecipe(request: request) { [weak self] result in
            switch result {
            case .success(let recipeResponse):
                DispatchQueue.main.async {
                    self?.allRecipes = recipeResponse.hits?.compactMap { $0.dto } ?? []
                    completion()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.error = error as? NetworkErrors
                    completion()
                }
            }
        }
    }
    
    func loadImage(from urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}
