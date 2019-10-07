//
//  SummonController.swift
//  SummonerRougeLikeProofOfConcept
//
//  Created by William Moody on 10/7/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class SummonController {
    
    static let shared = SummonController()
    
    var summonArray: [Summon] = []
    
    //CRUD
    
    func createSummon(ID: Int) {
        switch ID {
        case 1:
            let archer = Summon(health: 1, attackDamage: 1, attackSpeed: 1, isRanged: true)
            summonArray.append(archer)
        case 2:
            let wolf = Summon(health: 2, attackDamage: 1, attackSpeed: 1, isRanged: false)
            summonArray.append(wolf)
        default:
            return
        }
    }
    
    func removeSummon(position: Int) {
        summonArray.remove(at: position)
    }
    
}
