//
//  ContentView.swift
//  SolarSystem
//
//  Created by Raul Dozal on 6/12/26.
//

import SwiftUI

struct PlanetOption: Hashable {
    let name: String
    let apiName: String
}

struct ContentView: View {
    @EnvironmentObject var solarSystem: SolarSystemViewModel
    
    var body: some View {
            NavigationStack {
                Group {
                    if solarSystem.isLoading {
                        ProgressView("Loading planets...")
                    } else if solarSystem.planets.isEmpty {
                        Text("No planets found.")
                    } else {
                        List(solarSystem.planets) { planet in
                            NavigationLink {
                                PlanetDetailView(planet: planet)
                            } label: {
                                HStack {
                                    Image(planet.englishName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 90, height: 90)
                                    
                                    VStack(alignment: .leading) {
                                        Text(planet.englishName)
                                            .font(.headline)

                                        Text(planet.bodyType)
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Solar System")
                .task {
                    await solarSystem.fetchPlanets()
                }
                .alert(isPresented: $solarSystem.hasError, error: solarSystem.planetError) { _ in
                    Button("Ok", role: .cancel) {}
                } message: { error in
                    Text(error.localizedDescription)
                }
            }
        }
}

#Preview {
    ContentView()
        .environmentObject(SolarSystemViewModel())
}
