//
//  RoverPhoto.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import SwiftUI

struct RoverPhoto: View {
    let photo: PhotoModel
    let onImageTap: () -> Void
    
    var body: some View {
        if let image = photo.image {
            Button(action: onImageTap) {
                HStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.blur(radius: 10).opacity(0.2))
                        .cornerRadius(15)

                    Text(photo.rover.name)
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .frame(width: 140)
                }
            }
        } else {
        Color.white.opacity(0.2)
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .shadow(radius: 2)
                .overlay(ProgressView()
                            .progressViewStyle(CircularProgressViewStyle()))
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct RoverPhoto_Previews: PreviewProvider {
    static var previews: some View {
        RoverPhoto(photo: .previewData) {}
    }
}
