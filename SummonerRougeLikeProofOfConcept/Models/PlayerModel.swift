//
//  PlayerModel.swift
//  SummonerRougeLikeProofOfConcept
//
//  Created by William Moody on 10/4/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class Player {
    var health: Int
    var mana: Int
    var summonLimit: Int
    
    init(health: Int, mana: Int, summonLimit: Int) {
        self.health = health
        self.mana = mana
        self.summonLimit = summonLimit
    }
}
