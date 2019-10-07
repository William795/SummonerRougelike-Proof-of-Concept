//
//  PlayerController.swift
//  SummonerRougeLikeProofOfConcept
//
//  Created by William Moody on 10/7/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class PlayerController {
    
    static let shared = PlayerController()
    
    var currentPlayer = Player(health: 10, mana: 5, summonLimit: 3)
    
    //CRUD
    
    func createPlayer() {
        let newPlayer = Player(health: 10, mana: 5, summonLimit: 3)
        currentPlayer = newPlayer
    }
    
    func playerDamaged(amount: Int) {
        currentPlayer.health -= amount
    }
    
    func summonMinion(cost: Int) -> Bool {
        if currentPlayer.summonLimit >= 3 || currentPlayer.mana < cost {
            return false
        }
        currentPlayer.mana -= cost
        return true
    }
}
