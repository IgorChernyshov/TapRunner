//
//  GameScene.swift
//  TapRunner
//
//  Created by Igor Chernyshov on 01.08.2021.
//

import SpriteKit
import GameplayKit

final class GameScene: SKScene {

	var timer: Timer?
	var road: Road?

    override func didMove(to view: SKView) {
		timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
			self?.road?.removeFromParent()
			let newRoad = Road()
			self?.road = newRoad
			self?.addChild(newRoad)
		}
    }
}
