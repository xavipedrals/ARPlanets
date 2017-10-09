//
//  EarthPlanet.swift
//  Planets
//
//  Created by Xavier Pedrals on 09/10/2017.
//  Copyright © 2017 Xavier Pedrals. All rights reserved.
//

import ARKit

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
    
    fileprivate func getPlanet() -> Planet {
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
}

class Planets {
    
    static func get(_ planet: PlanetEnum) -> SCNNode {
        let planetData = planet.getPlanet()
        let planetNode = SCNNode()
        planetNode.geometry = SCNSphere(radius: planetData.radius)
        planetNode.geometry?.firstMaterial?.diffuse.contents = planetData.diffuse
        planetNode.geometry?.firstMaterial?.specular.contents = planetData.specular
        planetNode.geometry?.firstMaterial?.emission.contents = planetData.emission
        planetNode.geometry?.firstMaterial?.normal.contents = planetData.normal
        return planetNode
    }
    
    static func getRotation(_ planet: PlanetEnum) -> SCNAction {
        let planetData = planet.getPlanet()
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: planetData.sunRotationTime)
        let forever = SCNAction.repeatForever(action)
        return forever
    }
    
    static func getPlanetOwnRotation() -> SCNAction {
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let forever = SCNAction.repeatForever(action)
        return forever
    }
    
    static func getSaturnRing() -> SCNNode {
        let ring = SCNNode()
        ring.geometry = SCNBox(width: 0.6, height: 0, length: 0.6, chamferRadius: 0)
        ring.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "saturn_loop")
        ring.geometry?.firstMaterial?.diffuse.mipFilter = SCNFilterMode.linear
        ring.rotation = SCNVector4(-0.5, -1, 0, Double.pi)
        return ring
    }
}

struct Planet {
    var diffuse: UIImage
    var specular: UIImage?
    var emission: UIImage?
    var normal: UIImage?
    var radius: CGFloat
//    var ownRotationTime: Float
    var sunRotationTime: Double
    
    init(radius: CGFloat, diffuse: UIImage, specular: UIImage? = nil, emission: UIImage? = nil, normal: UIImage? = nil, rotationTime: Double) {
        self.radius = radius
        self.diffuse = diffuse
        self.specular = specular
        self.emission = emission
        self.normal = normal
        self.sunRotationTime = rotationTime
    }
}
