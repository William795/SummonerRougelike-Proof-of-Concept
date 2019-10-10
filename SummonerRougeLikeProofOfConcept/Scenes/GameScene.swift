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
        makeSummonButton(named: "A", position: CGPoint(x: frame.maxX * 0.9, y: frame.midY / 2))
        makeSummonButton(named: "B", position: CGPoint(x: frame.maxX * 0.8, y: frame.midY / 4))
    }
    
    func createPlayer() {
        player = SKSpriteNode(color: .cyan, size: CGSize(width: 15, height: 15))
        player?.name = "player"
        player?.position = CGPoint(x: frame.midX, y: frame.midY)
        player.zPosition = ZPositions.player
        player?.physicsBody = SKPhysicsBody(circleOfRadius: 15/2)
        player.physicsBody?.categoryBitMask = PhysicsCategorys.player
        
        addChild(player!)
    }
    
    func makeSummonButton(named: String, position: CGPoint) {
        let button = SKSpriteNode()
        button.name = named
        button.position = position
        button.color = .blue
        button.size = CGSize(width: 50, height: 50)
        
        addChild(button)
    }
    
    func summonArcher() {
        let size = CGSize(width: 25, height: 25)
        let rangeSize = CGSize(width: 100, height: 100)
        
        let minion = SKSpriteNode()
        minion.name = "archer"
        minion.position = player.position
        minion.color = .green
        minion.size = size
        minion.zPosition = ZPositions.ally
        minion.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        minion.physicsBody?.categoryBitMask = PhysicsCategorys.summon
        
        addChild(minion)
        
        let range = SKSpriteNode()
        range.name = "archerRange"
        range.position = player.position
        range.color = .lightGray
        range.size = rangeSize
        range.zPosition = ZPositions.rangeIndicator
        range.physicsBody = SKPhysicsBody(circleOfRadius: rangeSize.width / 2)
        range.physicsBody?.categoryBitMask = PhysicsCategorys.allyRange
        
        addChild(range)
    }
    
    func summonAttack() {
        let allyAttack = SKSpriteNode()
        let attackSize = CGSize(width: 10, height: 10)
        allyAttack.name = "archerRange"
        allyAttack.position = player.position
        allyAttack.color = .yellow
        allyAttack.size = attackSize
        allyAttack.zPosition = ZPositions.allyProjectile
        allyAttack.physicsBody = SKPhysicsBody(circleOfRadius: attackSize.width / 2)
        allyAttack.physicsBody?.categoryBitMask = PhysicsCategorys.allyProjectiles
    }
    
    func makeEnemy() {
        let enemy = SKSpriteNode()
        enemy.position = CGPoint(x: frame.midX, y: frame.midY)
        enemy.color = .white
        enemy.size = CGSize(width: 40, height: 40)
        enemy.zPosition = ZPositions.enemy
        enemy.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        enemy.physicsBody?.categoryBitMask = PhysicsCategorys.enemy
        
        addChild(enemy)
    }
    
    func enemyAttack() {
        let enemyAttack = SKSpriteNode()
        let attackSize = CGSize(width: 10, height: 10)
        enemyAttack.name = "archerRange"
        enemyAttack.position = player.position
        enemyAttack.color = .red
        enemyAttack.size = attackSize
        enemyAttack.zPosition = ZPositions.allyProjectile
        enemyAttack.physicsBody = SKPhysicsBody(circleOfRadius: attackSize.width / 2)
        enemyAttack.physicsBody?.categoryBitMask = PhysicsCategorys.allyProjectiles
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var pos: CGPoint!
        
        for touch in touches {
            pos = touch.location(in: self)
        }
        
        let childs = self.nodes(at: pos)
        for child in childs {
            switch child.name {
            case "A":
                summonArcher()
                return
            case "B":
                //do stuff
                print("B tapped")
                return
            default:
                print("didn't tap summon")
            }
        }
        self.player.run(SKAction.move(to: pos, duration: 0.5))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var pos: CGPoint!
        
        for touch in touches {
            pos = touch.location(in: self)
        }
        
        let childs = self.nodes(at: pos)
        for child in childs {
            switch child.name {
            case "A":
                return
            case "B":
                return
            default:
                print("ran over object")
            }
        }
        self.player.run(SKAction.move(to: pos, duration: 0.5))
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
