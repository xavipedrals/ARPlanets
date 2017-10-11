//
//  PlanetsEnum.swift
//  Planets
//
//  Created by Xavier Pedrals on 10/10/2017.
//  Copyright © 2017 Xavier Pedrals. All rights reserved.
//

import UIKit

enum PlanetEnum {
    case sun
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    
    func getPlanet() -> Planet {
        switch self {
        case .sun:
            return Planet(radius: 0.25, diffuse: #imageLiteral(resourceName: "sun"), rotationTime: 15)
        case .mercury:
            return Planet(radius: 0.02, diffuse: #imageLiteral(resourceName: "mercury"), rotationTime: 25)
        case .venus:
            return Planet(radius: 0.04, diffuse: #imageLiteral(resourceName: "venus_surface"), emission: #imageLiteral(resourceName: "venus_atmosphere"), rotationTime: 40)
        case .earth:
            return Planet(radius: 0.05, diffuse: #imageLiteral(resourceName: "earth_daymap"), specular: #imageLiteral(resourceName: "earth_specular_map"), emission: #imageLiteral(resourceName: "earth_clouds"), normal: #imageLiteral(resourceName: "earth_normal_map"), rotationTime: 35)
        case .mars:
            return Planet(radius: 0.03, diffuse: #imageLiteral(resourceName: "mars"), rotationTime: 35)
        case .jupiter:
            return Planet(radius: 0.15, diffuse: #imageLiteral(resourceName: "jupiter"), rotationTime: 90)
        case .saturn:
            return Planet(radius: 0.12, diffuse: #imageLiteral(resourceName: "saturn"), rotationTime: 80)
        case .uranus:
            return Planet(radius: 0.08, diffuse: #imageLiteral(resourceName: "uranus"), rotationTime: 55)
        case .neptune:
            return Planet(radius: 0.04, diffuse: #imageLiteral(resourceName: "neptune"), rotationTime: 50)
        }
    }
    
    func getDistanceToSun() -> CGFloat {
        switch self {
        case .sun:
            return 0
        case .mercury:
            return -0.4
        case .venus:
            return -0.6
        case .earth:
            return -0.8
        case .mars:
            return -1
        case .jupiter:
            return -1.4
        case .saturn:
            return 1.75
        case .uranus:
            return -2.1
        case .neptune:
            return 2.3
        }
    }
}
