//
//  MainRepository.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import SwiftUI

class MainRepository: ObservableObject {
    static let shared = MainRepository()
    
    @Published var curiosityPhotos: [PhotoModel] = []
    @Published var spiritPhotos: [PhotoModel] = []
    @Published var opportunityPhotos: [PhotoModel] = []
    @Published var isFetching = false
    var curiosityPhotosPage = 0
    var opportunityPhotosPage = 0
    var spiritPhotosPage = 0
    
    private init() {}
    
    func fetchInitialPhotos() {
        fetchCuriosityPhoto()
        fetchOpportunityPhoto()
        fetchSpiritPhoto()
    }
    
    func fetchCuriosityPhoto() {
        isFetching = true
        NetworkService.request(type: .curiosity, pageNumber: curiosityPhotosPage) { model in
            self.isFetching = false
            guard let model = model else { return }
            self.curiosityPhotos.append(contentsOf: model.photos.map { photoDao in
                return PhotoModel(dao: photoDao)
            })
            self.curiosityPhotos.forEach { photo in
                self.downloadPhoto(url: photo.imgSrc) { image in
                    DispatchQueue.main.async {
                        self.curiosityPhotos = self.curiosityPhotos.map {
                            var newPhoto = $0
                            if newPhoto.id == photo.id {
                                newPhoto.image = image
                            }
                            return newPhoto
                        }
                    }
                }
            }
        }
        
        curiosityPhotosPage += 1
    }
    
    func fetchOpportunityPhoto() {
        isFetching = true
        NetworkService.request(type: .opportunity, pageNumber: opportunityPhotosPage) { model in
            self.isFetching = false
            guard let model = model else { return }
            self.opportunityPhotos.append(contentsOf: model.photos.map { photoDao in
                return PhotoModel(dao: photoDao)
            })
            self.opportunityPhotos.forEach { photo in
                self.downloadPhoto(url: photo.imgSrc) { image in
                    DispatchQueue.main.async {
                        self.opportunityPhotos = self.opportunityPhotos.map {
                            var newPhoto = $0
                            if newPhoto.id == photo.id {
                                newPhoto.image = image
                            }
                            return newPhoto
                        }
                    }
                }
            }
        }
        opportunityPhotosPage += 1
    }
    
    func fetchSpiritPhoto() {
        isFetching = true
        NetworkService.request(type: .spirit, pageNumber: spiritPhotosPage) { model in
            self.isFetching = false
            guard let model = model else { return }
            self.spiritPhotos.append(contentsOf: model.photos.map { photoDao in
                return PhotoModel(dao: photoDao)
            })
            self.spiritPhotos.forEach { photo in
                self.downloadPhoto(url: photo.imgSrc) { image in
                    DispatchQueue.main.async {
                        self.spiritPhotos = self.spiritPhotos.map {
                            var newPhoto = $0
                            if newPhoto.id == photo.id {
                                newPhoto.image = image
                            }
                            return newPhoto
                        }
                    }
                }
            }
        }
        spiritPhotosPage += 1
    }
    
    
    
    
    
    private func downloadPhoto(url: String, onComplete handler: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard error == nil,
                  let data = data
            else { return handler(nil) }
            handler(UIImage(data: data))
        }.resume()
    }
}



