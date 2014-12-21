//
//  GameViewController.swift
//  Swiftris
//
//  Created by Emiliano on 12/20/14.
//  Copyright (c) 2014 eviera.net. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
        
        
    }
 
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
