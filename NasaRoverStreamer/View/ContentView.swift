//
//  ContentView.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 22.10.2021.
//

import SwiftUI
// API:
// https://api.nasa.gov/planetary/apod?api_key=iS4Ihvba4Ry0raHduZ1M1Da162CcqFEkjEu56cZy
//
// Örnek URL:
// https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY

struct ContentView: View {
    var body: some View {
        TabView {
            RoverTypeView(type: .curiosity)
                .tabItem {
                    Image(systemName: "c.square")
                    Text("Curiosity")
                }
            RoverTypeView(type: .opportunity)
                .tabItem {
                    Image(systemName: "o.circle")
                    Text("Oppurtunity")
                }
            RoverTypeView(type: .spirit)
                .tabItem {
                    Image(systemName: "s.square")
                    Text("Spirit")
                }
            
        }
        .onAppear(perform: MainRepository.shared.fetchInitialPhotos)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
