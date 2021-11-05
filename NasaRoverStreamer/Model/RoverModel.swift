//
//  RoverModel.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import Foundation

struct RoverModel: Identifiable, Hashable {
    let id = UUID()
    let roverId: Int
    let name: String
    let landingDate, launchDate: String
    let status: String

    static var previewData: RoverModel {
        return .init(roverId: 1,
                     name: "Test Rover",
                     landingDate: "21-02-2019",
                     launchDate: "20-03-2018",
                     status: "Active")
    }
}

extension RoverModel {
    init(dao: RoverDao) {
        self.roverId = dao.id
        self.name = dao.name
        self.landingDate = dao.landingDate
        self.launchDate = dao.launchDate
        self.status = dao.status
            
        
        
    }
}
