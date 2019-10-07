//
//  SummonModel.swift
//  SummonerRougeLikeProofOfConcept
//
//  Created by William Moody on 10/7/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class Summon {
    var health: Int
    var attackDamage: Int
    var attackSpeed: Int
    var isRanged: Bool
    
    init(health: Int, attackDamage: Int, attackSpeed: Int, isRanged: Bool) {
        self.health = health
        self.attackDamage = attackDamage
        self.attackSpeed = attackSpeed
        self.isRanged = isRanged
    }
}
