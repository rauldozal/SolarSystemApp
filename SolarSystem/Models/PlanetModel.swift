//
//  PlanetModel.swift
//  SolarSystem
//
//  Created by Raul Dozal on 6/12/26.
//

import Foundation

// Codable so swift can decode that Json automatically
struct PlanetModel: Codable, Identifiable {
    let id: String
    let name: String
    let englishName: String
    let isPlanet: Bool
    let moons: [Moon]?
    let semimajorAxis: Int
    let perihelion: Int?
    let aphelion: Int?
    let density: Double?
    let gravity: Double?
    let meanRadius: Double?
    let sideralOrbit: Double?
    let sideralRotation: Double?
    let axialTilt: Double?
    let avgTemp: Int?
    let bodyType: String
}

struct Moon: Codable {
    let moon: String
    let rel: String
}
