//
//  SolarSystemViewModel.swift
//  SolarSystem
//
//  Created by Raul Dozal on 6/12/26.
//

import Foundation
import Combine

class SolarSystemViewModel: ObservableObject {
    @Published var planets: [PlanetModel] = [] // this will store the response from the API
    @Published var isLoading = false
    @Published var hasError = false // track if we currently have an error
    @Published var planetError: PlanetModelError? // store the actual error
    
    @MainActor
    func fetchPlanets() async {
        isLoading = true
        hasError = false
    
        guard let url = URL(
            string: "https://api.le-systeme-solaire.net/rest/bodies/"
        ) else {
            hasError = true
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue(
            "Bearer c0bc0f47-16a9-4401-b7a1-d128483df22e",
            forHTTPHeaderField: "Authorization"
        )
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decodedResponse = try JSONDecoder().decode(PlanetAPIResponse.self, from: data)
            
            planets = decodedResponse.bodies
                .filter { $0.isPlanet }
                .sorted { $0.semimajorAxis < $1.semimajorAxis }
            isLoading = false
        } catch {
            hasError = true
            self.planetError = .customError(error: error)
            isLoading = false
        }
    }
    
    enum PlanetModelError: LocalizedError {
        case decodingError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodingError:
                return "Error decoding JSON"
            case .customError(error: let error):
                return error.localizedDescription
            }
        }
    }
    
    struct PlanetAPIResponse: Codable {
        let bodies: [PlanetModel]
    }
}
