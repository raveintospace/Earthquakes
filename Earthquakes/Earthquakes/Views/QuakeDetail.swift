//
//  QuakeDetail.swift
//  Earthquakes
//
//  Created by Uri on 28/9/25.
//

import SwiftUI

struct QuakeDetail: View {
    
    let quake: Quake
    
    var body: some View {
        VStack {
            QuakeMagnitude(quake: quake)
            
            Text(quake.place)
                .font(.title3)
                .bold()
            
            Text("\(quake.time.formatted())")
                .foregroundStyle(Color.secondary)
            
            if let location = quake.location {
                Text("Latitude: \(location.latitude.formatted(.number.precision(.fractionLength(3))))")
                Text("Longitude: \(location.longitude.formatted(.number.precision(.fractionLength(3))))")
            }
        }
    }
}

#Preview {
    QuakeDetail(quake: Quake.preview)
}
