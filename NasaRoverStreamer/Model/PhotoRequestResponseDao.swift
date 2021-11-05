//
//  asd.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import Foundation

struct PhotoRequestResponseDao: Codable {
    let photos: [PhotoDao]
}

struct PhotoDao: Codable {
    let id, sol: Int
    let camera: CameraDao
    let imgSrc: String
    let earthDate: String
    let rover: RoverDao

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

struct CameraDao: Codable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

struct RoverDao: Codable {
    let id: Int
    let name: String
    let landingDate, launchDate: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}
