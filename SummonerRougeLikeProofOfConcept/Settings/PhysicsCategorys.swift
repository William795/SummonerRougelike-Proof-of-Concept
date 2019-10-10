//
//  PhysicsCategorys.swift
//  SummonerRougeLikeProofOfConcept
//
//  Created by William Moody on 10/10/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation
import SpriteKit

enum PhysicsCategorys {
    static let none: UInt32 = 0
    static let allyProjectiles: UInt32 = 0x1
    static let allyRange: UInt32 = 0x1 << 1
    static let enemyProjectiles: UInt32 = 0x1 << 2
    static let enemy: UInt32 = 0x1 << 3
    static let summon: UInt32 = 0x1 << 4
    static let player: UInt32 = 0x1 << 5
}
