//
//  GameScene.swift
//  Swiftris
//
//  Created by Emiliano on 12/20/14.
//  Copyright (c) 2014 eviera.net. All rights reserved.
//

import SpriteKit

///Constante que define la velocidad del juego en el primer nivel (en milisegundos). Cada este tiempo las figuras van a bajar un piso
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {
    
    var tick:(() -> ())?
    var tickLenghtMillis = TickLengthLevelOne

    
    ///Representa el momento de la ultima vez que se computo un frame (un tick)
    ///
    ///Si es nil, no se ejecuta el update()
    var lastTick:NSDate?
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(size: CGSize) {
        super.init(size: size)
        
        //La vista se ancla arriba a la izquierda
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        //Pinta el fondo y lo ancla arriba a la izquierda
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
    }

    
    override func update(currentTime: CFTimeInterval) {
        if lastTick == nil {
            return
        }
        
        //Computa cuanto tiempo paso desde el ultimo tick 
        //timeIntervalSinceNow calcula automaticamente la diferencia como un double. Ej: 0.857 son 857 milesimas (de ahi que se multiplica por 1000)
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        
        //Si el tiempo que paso es mayor a un tick (600 ms en este caso), se llama al closure tick() y se resetea el contador lastTick a now
        if timePassed > tickLenghtMillis {
            lastTick = NSDate()
            //El ? hace que solo se invoque a tick si este no es nulo
            tick?()
        }
        
    }
    
   
    func startTicking() {
        lastTick = NSDate()
    }
    
    func stopTicking() {
        lastTick = nil
    }
    
    
}
