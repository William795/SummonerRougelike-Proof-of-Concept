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
        physicsWorld.contactDelegate = self
//        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        createPlayer()
        makeSummonButton(named: "A", position: CGPoint(x: frame.maxX * 0.9, y: frame.midY / 2))
        makeSummonButton(named: "B", position: CGPoint(x: frame.maxX * 0.8, y: frame.midY / 4))
        makeEnemy()
    }
    
    //MARK: - Sprite Creation
    
    func createPlayer() {
        player = SKSpriteNode(color: .cyan, size: CGSize(width: 15, height: 15))
        player?.name = "player"
        player?.position = CGPoint(x: frame.midX, y: frame.midY)
        player.zPosition = ZPositions.player
        player?.physicsBody = SKPhysicsBody(circleOfRadius: 15/2)
        player.physicsBody?.categoryBitMask = PhysicsCategorys.player
        player.physicsBody?.collisionBitMask = PhysicsCategorys.player
        player.physicsBody?.affectedByGravity = false
        
        addChild(player!)
    }
    
    func makeSummonButton(named: String, position: CGPoint) {
        let button = SKSpriteNode()
        button.name = named
        button.position = position
        button.color = .blue
        button.size = CGSize(width: 50, height: 50)
        button.physicsBody?.collisionBitMask = PhysicsCategorys.none
        button.physicsBody?.affectedByGravity = false
        
        addChild(button)
    }
    
    func summonArcher() {
        let size = CGSize(width: 25, height: 25)
        let rangeSize = CGSize(width: 300, height: 300)
        
        let minion = SKSpriteNode()
        minion.name = "archer"
        minion.position = player.position
        minion.color = .green
        minion.size = size
        minion.zPosition = ZPositions.ally
        minion.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        minion.physicsBody?.categoryBitMask = PhysicsCategorys.summon
        minion.physicsBody?.collisionBitMask = PhysicsCategorys.summon
        minion.physicsBody?.affectedByGravity = false
        
        addChild(minion)
        
        let range = SKSpriteNode()
        range.name = "archerRange"
        range.position = player.position
        range.color = .lightGray
        range.size = rangeSize
        range.zPosition = ZPositions.rangeIndicator
        range.physicsBody = SKPhysicsBody(circleOfRadius: rangeSize.width / 2)
        range.physicsBody?.categoryBitMask = PhysicsCategorys.allyRange
        range.physicsBody?.collisionBitMask = PhysicsCategorys.none
        range.physicsBody?.contactTestBitMask = PhysicsCategorys.enemy
        range.physicsBody?.affectedByGravity = false
        
        addChild(range)
    }
    
    func fireAllyProjectile(enemyPosition: CGPoint,  allyPosition: CGPoint) {
        let allyAttack = SKSpriteNode()
        let attackSize = CGSize(width: 50, height: 50)
        let velocity = CGVector(dx: enemyPosition.x - allyPosition.x, dy: enemyPosition.y - allyPosition.y)
        allyAttack.name = "archerRange"
        allyAttack.position = self.childNode(withName: "archer")!.position
        allyAttack.color = .yellow
        allyAttack.size = attackSize
        allyAttack.zPosition = ZPositions.allyProjectile
        allyAttack.physicsBody = SKPhysicsBody(circleOfRadius: attackSize.width / 2)
        allyAttack.physicsBody?.affectedByGravity = false
        allyAttack.physicsBody?.categoryBitMask = PhysicsCategorys.allyProjectiles
        allyAttack.physicsBody?.collisionBitMask = PhysicsCategorys.allyProjectiles
        allyAttack.physicsBody?.contactTestBitMask = PhysicsCategorys.enemy
        allyAttack.physicsBody?.velocity = velocity
        
        addChild(allyAttack)
    }
    
    func makeEnemy() {
        let enemy = SKSpriteNode()
        enemy.name = "enemy"
        enemy.position = CGPoint(x: frame.midX, y: frame.midY)
        enemy.color = .white
        enemy.size = CGSize(width: 40, height: 40)
        enemy.zPosition = ZPositions.enemy
        enemy.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        enemy.physicsBody?.categoryBitMask = PhysicsCategorys.enemy
        enemy.physicsBody?.collisionBitMask = PhysicsCategorys.enemy
        enemy.physicsBody?.affectedByGravity = false
        
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
    
    //MARK: - battle funtions
    
    func summonAttack(inRange: Bool, ally: CGPoint, enemy: CGPoint) {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("timer ran")
            if inRange {
                self.fireAllyProjectile(enemyPosition: enemy, allyPosition: ally)
            }
        }
    }
    
    //MARK: - Touch functions
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
//MARK: - physics contact delegate
extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        case PhysicsCategorys.allyRange | PhysicsCategorys.enemy:
            //shoot enemy
            if let enemy = contact.bodyA.node?.name == "archerRange" ? contact.bodyB.node as? SKSpriteNode : contact.bodyA.node as? SKSpriteNode {
                summonAttack(inRange: true, ally: self.childNode(withName: "archer")!.position, enemy: enemy.position)
                print("contact")
            }
            print("maybe not")
            return
        case PhysicsCategorys.allyProjectiles | PhysicsCategorys.enemy:
            //enemy take damage
            return
        case PhysicsCategorys.enemyProjectiles | PhysicsCategorys.summon:
            //summon takes damage
            return
        case PhysicsCategorys.enemyProjectiles | PhysicsCategorys.player:
            //player takes damage
            return
        default:
            return
        }
    }
}
