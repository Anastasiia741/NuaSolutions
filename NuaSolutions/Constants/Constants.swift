//  Constants.swift
//  Nua Solutions
//  Created by Анастасия Набатова on 1/4/24.

import Foundation

enum NetworkErrors: Error, Identifiable {
    var id: String {
        errorDescription
    }
    case dataNotReceivedError
    case parsingError
    var errorDescription: String {
        switch self {
        case .dataNotReceivedError:
            return "Data not received from server"
        case .parsingError:
            return "Error occurred while parsing data"
        }
    }
}

enum Accesses {
    static let recipeCell = "RecipeCell"
}

enum Titles {
    static let search = "Search recipes"
    static let findRecipe = "Let's find a recipe!"
    static let noFoundRecipe  = "Sorry, nothing found for your query"
    static let optionalText = "Salad"
    static let detail = "more detail"
}

enum Images {
    static let nothingFound = "nothingFound"
    static let optionalImage = "salad"
}

