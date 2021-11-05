//
//  PhotoModel.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import SwiftUI

struct PhotoModel: Identifiable, Hashable {
    let id = UUID() 
    let photoId: Int
    let camera: CameraModel
    let imgSrc: String
    let earthDate: String
    let rover: RoverModel
    var image: UIImage?
    
    static var previewData: PhotoModel {
        return .init(photoId: 1,
                     camera: .previewData,
                     imgSrc: "image url",
                     earthDate: "27 June 2017",
                     rover: .previewData,
                     image: nil)
    }
}

extension PhotoModel { // Not to override memberwise initializer
    init(dao: PhotoDao) {
        self.photoId = dao.id
        self.imgSrc = dao.imgSrc
        self.earthDate = dao.earthDate
        self.camera = CameraModel(dao: dao.camera)
        self.rover = RoverModel(dao: dao.rover)
    }
}




