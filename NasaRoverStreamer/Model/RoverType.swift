//
//  RoverType.swift
//  NasaRoverStreamer
//
//  Created by Cem Uğurlu on 23.10.2021.
//

import Foundation

enum RoverType: String {
    case curiosity = "curiosity", spirit = "spirit", opportunity = "opportunity"
    var displayTitle: String {
        switch self {
        case .curiosity:
            return "Curiosity"
        case .spirit:
            return "Spirit"
        case .opportunity:
            return "Opportunity"
        }
    }
    
    
}
