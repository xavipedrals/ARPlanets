//
//  Planet.swift
//  Planets
//
//  Created by Xavier Pedrals on 10/10/2017.
//  Copyright © 2017 Xavier Pedrals. All rights reserved.
//

import UIKit

struct Planet {
    var diffuse: UIImage
    var specular: UIImage?
    var emission: UIImage?
    var normal: UIImage?
    var radius: CGFloat
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
