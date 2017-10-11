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
        setup(planet: .sun)
        setup(planet: .mercury)
        setup(planet: .venus)
        setup(planet: .earth)
        setup(planet: .mars)
        setup(planet: .jupiter)
        setup(planet: .saturn)
        setup(planet: .uranus)
        setup(planet: .neptune)
    }
    
    func setup(planet: PlanetEnum) {
        let planetNode = PlanetNode(planet: planet)
        let parentNode = PlanetRotationAxis(planet: planet)
        let planetOrbit = PlanetOrbit(planet: planet)
        self.sceneView.scene.rootNode.addChildNode(parentNode)
        parentNode.addChildNode(planetNode)
        if planet != .sun {
            parentNode.addChildNode(planetOrbit)
        }
    }
}



