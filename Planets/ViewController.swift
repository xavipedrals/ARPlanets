//
//  ViewController.swift
//  Planets
//
//  Created by Xavier Pedrals on 09/10/2017.
//  Copyright © 2017 Xavier Pedrals. All rights reserved.
//

import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSceneView()
    }
    
    func setupSceneView() {
        self.sceneView.showsStatistics = true
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setup(planet: .sun, position: SCNVector3(0, 0, 0))
        setup(planet: .mercury, position: SCNVector3(-0.4, 0, 0))
        setup(planet: .venus, position: SCNVector3(-0.6, 0, 0))
        setup(planet: .earth, position: SCNVector3(-0.8, 0, 0))
        setup(planet: .mars, position: SCNVector3(-1, 0, 0))
        setup(planet: .jupiter, position: SCNVector3(-1.4, 0, 0))
        setup(planet: .saturn, position: SCNVector3(1.68, 0, 0))
        setup(planet: .uranus, position: SCNVector3(-1.95, 0, 0))
        setup(planet: .neptune, position: SCNVector3(2.14, 0, 0))
    }
    
    func setup(planet: PlanetEnum, position: SCNVector3) {
        let planetNode = Planets.get(planet)
        let earthParent = getParent(of: planet)
        planetNode.position = position
        planetNode.runAction(Planets.getPlanetOwnRotation())
        earthParent.addChildNode(planetNode)
    }
    
    func getParent(of planet: PlanetEnum) -> SCNNode {
        let parent = SCNNode()
        parent.position = SCNVector3(0, -0.8, -2.7)
        self.sceneView.scene.rootNode.addChildNode(parent)
        let rotation = Planets.getRotation(planet)
        parent.runAction(rotation)
        return parent
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}

