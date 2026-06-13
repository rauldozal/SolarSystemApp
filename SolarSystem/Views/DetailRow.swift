//
//  DetailRow.swift
//  SolarSystem
//
//  Created by Raul Dozal on 6/13/26.
//

import SwiftUI

struct DetailRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    DetailRow(
        title: "Moons",
        value: "2"
    )
}
