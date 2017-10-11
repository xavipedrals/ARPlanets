//
//  PlanetOrbit.swift
//  Planets
//
//  Created by Xavier Pedrals on 10/10/2017.
//  Copyright © 2017 Xavier Pedrals. All rights reserved.
//

import ARKit

class PlanetOrbit: SCNNode {
    
    init(planet: PlanetEnum) {
        super.init()
        self.position = SCNVector3(0, 0, 0)
        let ringRadius = planet.getDistanceToSun().magnitude
        self.geometry = SCNTorus(ringRadius: ringRadius, pipeRadius: 0.003)
        self.geometry?.firstMaterial?.diffuse.contents = UIColor(r: 255, g: 255, b:255, a: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: Double) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: CGFloat(a))
    }
}
