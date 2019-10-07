//
//  GameScene.swift
//  SummonerRougeLikeProofOfConcept
//
//  Created by William Moody on 10/4/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        createPlayer()
    }
    
    func createPlayer() {
        player = SKSpriteNode(color: .red, size: CGSize(width: 5, height: 5))
        player?.name = "player"
        player?.position = CGPoint(x: frame.midX, y: frame.midY)
        player?.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        player?.color = .red
        
        addChild(player!)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            self.player.run(SKAction.move(to: touch.location(in: self), duration: 0.5))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
