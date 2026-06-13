//
//  PlanetDetailView.swift
//  SolarSystem
//
//  Created by Raul Dozal on 6/12/26.
//

import SwiftUI

struct PlanetDetailView: View {
    let planet: PlanetModel
    
    var body: some View {
        ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Image(planet.englishName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 8)
                
                    Text(planet.englishName)
                        .font(.largeTitle)
                        .bold()
                    
                    DetailRow(
                        title: "Body Type",
                        value: "\(planet.bodyType)"
                    )
                
                    if let gravity = planet.gravity {
                        DetailRow(
                            title: "Gravity",
                            value: String(format: "%.2f m/s²", gravity)
                        )
                    }
                    
                    if let radius = planet.meanRadius {
                        DetailRow(
                            title: "Radius",
                            value: String(format: "%.0f km", radius)
                        )
                    }
                    
                    if let density = planet.density {
                        DetailRow(
                            title: "Density",
                            value: String(format: "%.2f g/cm³", density)
                        )
                    }
                    
                    if let moons = planet.moons {
                        DetailRow(
                            title: "Moons",
                            value: "\(moons.count)"
                        )
                    }
                }
                .padding()
            }
        }
}

#Preview {
    PlanetDetailView(planet: PlanetModel(
        id: "mars",
        name: "Mars",
        englishName: "Mars",
        isPlanet: true,
        moons: [
            Moon(
                moon: "Phobos",
                rel: "https://api.le-systeme-solaire.net/rest/bodies/phobos"
            ),
            Moon(
                moon: "Deïmos",
                rel: "https://api.le-systeme-solaire.net/rest/bodies/deimos"
            )
        ],
        semimajorAxis: 227939200,
        perihelion: 206700000,
        aphelion: 249200000,
        density: 3.93410,
        gravity: 3.71000,
        meanRadius: 3389.50000,
        sideralOrbit: 686.98000,
        sideralRotation: 24.62290,
        axialTilt: 25.19,
        avgTemp: 210,
        bodyType: "Planet"
    ))
        .environmentObject(SolarSystemViewModel())
}
