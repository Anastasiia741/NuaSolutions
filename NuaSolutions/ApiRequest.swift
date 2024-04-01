//  ApiRequest.swift
//  Nua Solutions
//  Created by Анастасия Набатова on 21/3/24.

import Foundation

struct ApiRequest {
    func makeRequest(with query: String) -> URLRequest? {
        var urlComponents = URLComponents.init()
        urlComponents.scheme = "https"
        urlComponents.host = "api.edamam.com"
        urlComponents.path = "/api/recipes/v2"
        urlComponents.queryItems = [
            URLQueryItem(name: "type", value: "public"),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "app_id", value: ApiConstants.appID),
            URLQueryItem(name: "app_key", value: ApiConstants.appKey)
        ]
        guard let url = urlComponents.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
