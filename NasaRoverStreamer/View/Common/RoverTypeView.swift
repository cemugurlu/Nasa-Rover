//
//  RoverTypeView.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import SwiftUI

struct RoverTypeView: View {
    @ObservedObject private var mainRepository = MainRepository.shared
    let type: RoverType
    @State private var cameraIdToShow: Int?
    @State private var selectedPhoto: PhotoModel?
    
    var body: some View {
        let photos: [PhotoModel] = {
            switch type {
            case .curiosity: return mainRepository.curiosityPhotos
            case .spirit: return mainRepository.spiritPhotos
            case .opportunity: return mainRepository.opportunityPhotos
            }
        }()
        let filteredPhotos = photos.filter {
            cameraIdToShow == nil ?
            true :
            $0.camera.cameraId == cameraIdToShow
        }
        return
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(Array(filteredPhotos.enumerated()), id: \.1.id) { index, photo in
                        RoverPhoto(photo: photo) { self.selectedPhoto = photo }
                        .onAppear {
                            guard index == filteredPhotos.count - 1 else { return }
                            handleFetching()
                        }
                    }
                }
                .padding(25)
                .frame(maxWidth: .infinity)
            }
            .navigationTitle(type.displayTitle)
            .toolbar {
                HStack {
                    if mainRepository.isFetching {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                    
                    Menu {
                        Button("All", action: { onFilterTap(nil) })
                        
                        ForEach(getUniqueCameras(from: photos), id: \.self) { camera in
                            Button(camera.fullName, action: { onFilterTap(camera) })
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .padding()
                    }
                }
            }
            .sheet(item: $selectedPhoto) { photo in
                PhotoDetailView(photo: photo)
            }
        }
        
    }
    
    private func getUniqueCameras(from photos: [PhotoModel]) -> [CameraModel] {
        var uniqueCameraModels = [CameraModel]()
        photos.forEach { photo in
            if !uniqueCameraModels.contains(where: { camera in
                camera.cameraId == photo.camera.cameraId
            }) {
                uniqueCameraModels.append(photo.camera)
            }
        }
        return uniqueCameraModels
    }
    
    private func onFilterTap(_ camera: CameraModel?) {
        withAnimation {
            cameraIdToShow = camera == nil ? nil : camera!.cameraId
        }
    }
    
    private func handleFetching() {
        switch type {
        case .curiosity:
            mainRepository.fetchCuriosityPhoto()
        case .spirit:
            mainRepository.fetchSpiritPhoto()
        case .opportunity:
            mainRepository.fetchOpportunityPhoto()
        }
    }
}

struct RoverTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RoverTypeView(type: .curiosity)
    }
}
