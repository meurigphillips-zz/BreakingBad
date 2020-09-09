//
//  CharacterService.swift
//  BreakingBadBluePrint
//
//  Created by Meurig Phillips on 09/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import Foundation

enum BreakingBadAPIError: Error {
    case invalidResponse
    case noData
    case failedRequest
    case invalidData
}

struct CharacterService {
    typealias CharacterDataCompletion = ([Character]?, BreakingBadAPIError?) -> ()
    
    private static let scheme = "https"
    private static let host = "breakingbadapi.com"
    private static let path = "/api/characters"
    
    static func getCharacters(completion: @escaping CharacterDataCompletion) {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = scheme
        urlBuilder.host = host
        urlBuilder.path = path
        
        let url = urlBuilder.url!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    print("Failed request from breakingbadapi: \(error!.localizedDescription)")
                    completion(nil, .failedRequest)
                    return
                }
                
                guard let data = data else {
                    print("No data returned from breakingbadapi")
                    completion(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    print("Unable to process breakingbadapi response")
                    completion(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    print("Failure response from breakingbadapi: \(response.statusCode)")
                    completion(nil, .failedRequest)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let characters: [Character] = try decoder.decode([Character].self, from: data)
                    completion(characters, nil)
                } catch {
                    print("Unable to decode breakingbadapi response: \(error.localizedDescription)")
                    completion(nil, .invalidData)
                }
            }
        }.resume()
    }
}

