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
    
    var sceneView = ARSCNView()
    
    var checkers: [CheckerModel] = [CheckerModel]()
    var desk: DeskModel! = {
        let deskScene = SCNScene(named: SceneNameConstant.Scene.desk)
        debugPrint("Desk scene - \(deskScene.debugDescription)")
        let deskNode = deskScene?
            .rootNode
            .childNode(withName: SceneNameConstant.Model.desk, recursively: true)
        debugPrint("Desk node - \(deskNode.debugDescription)")
        
        return DeskModel(node: deskNode!, squarePositions: [])
    }()
    
    //MARK: - Life Cycle
    override func setup() {
        super.setup()
        
        self.view.addSubview(sceneView)
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        
        sceneView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        sceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        sceneView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        sceneView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        sceneView.delegate = self
        
        ///debug
        sceneView.showsStatistics = true
        sceneView.debugOptions = [
            ARSCNDebugOptions.showConstraints,
            ARSCNDebugOptions.showFeaturePoints,
            ARSCNDebugOptions.showSkeletons,
            ARSCNDebugOptions.showWorldOrigin,
            ARSCNDebugOptions.showBoundingBoxes,
            ARSCNDebugOptions.showLightInfluences,
            ARSCNDebugOptions.showLightExtents,
            ARSCNDebugOptions.showPhysicsShapes,
            ARSCNDebugOptions.showCameras
        ]
        ///~debug
        
        debugPrint("Start to load Scene")

        let scene = SCNScene(named: "art.scnassets/Checkers.scn")!
        sceneView.scene = scene
        
        debugPrint("Scene loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        sceneView.scene.rootNode.addChildNode(self.desk.node)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let location = touches.first?.location(in: sceneView) {
            let hitResultsFeaturePoints: [ARHitTestResult] = sceneView.hitTest(location, types: .featurePoint)
            
            if let hit = hitResultsFeaturePoints.first {
                
                let rotate = simd_float4x4(SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0))
                let finalTransform = simd_mul(hit.worldTransform, rotate)
                
                let pointTranslation = finalTransform.translation
                
                desk.node.position = SCNVector3(pointTranslation.x,
                                                pointTranslation.y,
                                                pointTranslation.z)
                sceneView.scene.rootNode.addChildNode(desk.node)
            }
        }
        
        super.touchesBegan(touches, with: event)
    }
}

extension SceneViewController: ARSCNViewDelegate {
    
    func session(_ session: ARSession, didFailWithError error: Error) { }
    
    func sessionWasInterrupted(_ session: ARSession) { }
    
    func sessionInterruptionEnded(_ session: ARSession) { }
}
