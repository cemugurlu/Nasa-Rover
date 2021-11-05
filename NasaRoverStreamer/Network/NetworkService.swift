//
//  NasaStreamManagerModel.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 22.10.2021.
//

import Foundation
import Alamofire

struct NetworkService {
    private static let apiKey = "iS4Ihvba4Ry0raHduZ1M1Da162CcqFEkjEu56cZy"
    
    private static func getUrl(type: RoverType, pageNumber: Int) -> String {
        return "https://api.nasa.gov/mars-photos/api/v1/rovers/\(type.rawValue)/photos?sol=1000&page=\(pageNumber)&api_key=\(apiKey)"
    }
    
    static func request(type: RoverType, pageNumber: Int, onComplete handler: @escaping (PhotoRequestResponseDao?) -> Void) {
        AF.request(getUrl(type: type, pageNumber: pageNumber)).responseDecodable(of: PhotoRequestResponseDao.self) { response in
            guard
                response.error == nil,
                let model = response.value
            else { return handler(nil) }
            handler(model)
        }
    }
    
    
}
