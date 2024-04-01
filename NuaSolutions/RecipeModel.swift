//  RecipeModel.swift
//  Nua Solutions
//  Created by Анастасия Набатова on 21/3/24.

import Foundation

struct Recipes: Decodable {
    let hits: [Hits]?
}

struct Hits: Decodable {
    var dto: RecipeDomainModel {
        RecipeDomainModel(
            label: recipe?.label,
            image: recipe?.image,
            url: recipe?.url ?? "")
    }
    let recipe: Recipe?
}

struct Recipe: Decodable, Identifiable {
    var id: Int?
    let label: String?
    let image: String?
    let url: String?
}

