//
//  SceneViewController.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/16/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

final class SceneViewController: BaseViewController {

    @IBOutlet private var sceneView: ARSCNView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        ///debug
        sceneView.showsStatistics = true
        
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
//        sceneView.scene =
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
}

extension SceneViewController: ARSCNViewDelegate {
    
    func session(_ session: ARSession, didFailWithError error: Error) { }
    
    func sessionWasInterrupted(_ session: ARSession) { }
    
    func sessionInterruptionEnded(_ session: ARSession) { }
}
