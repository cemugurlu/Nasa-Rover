//
//  RoverModel.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import Foundation

struct CameraModel: Identifiable, Hashable {
    let id = UUID()
    let cameraId: Int
    let name: String
    let roverID: Int
    let fullName: String
    
    static var previewData: CameraModel {
        return .init(cameraId: 1,
                     name: "Test Camera",
                     roverID: 1,
                     fullName: "Mast Test Camera")
    }
}

extension CameraModel {
    init(dao: CameraDao) {
        self.cameraId = dao.id
        self.name = dao.name
        self.roverID = dao.roverID
        self.fullName = dao.fullName
        
    }
}


