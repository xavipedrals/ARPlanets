//
//  PlanetParentNode.swift
//  Planets
//
//  Created by Xavier Pedrals on 10/10/2017.
//  Copyright © 2017 Xavier Pedrals. All rights reserved.
//

import ARKit

class PlanetRotationAxis: SCNNode {
    
    let centerOfUniverse = SCNVector3(0, -0.8, -2.7)
    
    init(planet: PlanetEnum) {
        super.init()
        let planetData = planet.getPlanet()
        self.position = centerOfUniverse
        let rotation = getRotation(seconds: planetData.sunRotationTime)
        self.runAction(rotation)
    }
    
    private func getRotation(seconds: Double) -> SCNAction {
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: seconds)
        let forever = SCNAction.repeatForever(action)
        return forever
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
