//
//  RoverDetailView.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import SwiftUI

struct PhotoDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let photo: PhotoModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(uiImage: photo.image ?? UIImage())
                .resizable()
                .scaledToFit()
            
            Text("Date taken: \(photo.earthDate)")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.top, 15)
                .padding(.leading, 25)
            
            Text("Camera name: \(photo.camera.fullName)")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.leading, 25)
            
            Text("Rover name: \(photo.rover.name)")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.leading, 25)
            
            Text("Launch date: \(photo.rover.launchDate)")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.leading, 25)
            
            Text("Landing date: \(photo.rover.landingDate)")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.leading, 25)
            
            Text("Rover status: \(photo.rover.status)")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.leading, 25)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue.ignoresSafeArea())
        .overlay(
            Button(action: onCloseTap) {
                Image(systemName: "xmark")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding()
            },
            alignment: .topLeading)
    }
    
    private func onCloseTap() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(photo: .previewData)
    }
}
