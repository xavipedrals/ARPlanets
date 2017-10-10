//
//  EarthPlanet.swift
//  Planets
//
//  Created by Xavier Pedrals on 09/10/2017.
//  Copyright © 2017 Xavier Pedrals. All rights reserved.
//

import ARKit

class PlanetNode: SCNNode {
    
    init(planet: PlanetEnum) {
        super.init()
        let planetData = planet.getPlanet()
        self.geometry = SCNSphere(radius: planetData.radius)
        self.geometry?.firstMaterial?.diffuse.contents = planetData.diffuse
        self.geometry?.firstMaterial?.specular.contents = planetData.specular
        self.geometry?.firstMaterial?.emission.contents = planetData.emission
        self.geometry?.firstMaterial?.normal.contents = planetData.normal
        let distanceToSun = planet.getDistanceToSun()
        self.position = SCNVector3(distanceToSun, 0, 0)
        self.runAction(getPlanetOwnRotation())
    }
    
    private func getPlanetOwnRotation() -> SCNAction {
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10)
        let forever = SCNAction.repeatForever(action)
        return forever
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}
