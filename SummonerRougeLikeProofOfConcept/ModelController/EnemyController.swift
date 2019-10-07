//
//  EnemyController.swift
//  SummonerRougeLikeProofOfConcept
//
//  Created by William Moody on 10/7/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class EnemyController {
    
    static let shared = EnemyController()
    
    //CRUD
    
    var EnemyArray: [Enemy] = []
    
    func createEnemy(ID: Int) {
        switch ID {
        case 1:
            let archerBoss = Enemy(health: 10, attackDamage: 1, attackSpeed: 2)
            EnemyArray.append(archerBoss)
        default:
            return
        }
    }
    
}
