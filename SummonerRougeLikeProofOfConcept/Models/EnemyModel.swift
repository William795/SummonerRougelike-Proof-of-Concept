//
//  EnemyModel.swift
//  SummonerRougeLikeProofOfConcept
//
//  Created by William Moody on 10/7/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class Enemy {
    var health: Int
    var attackDamage: Int
    var attackSpeed: Int
    
    init(health: Int, attackDamage: Int, attackSpeed: Int) {
        self.health = health
        self.attackDamage = attackDamage
        self.attackSpeed = attackSpeed
    }
}
