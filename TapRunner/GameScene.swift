//
//  GameScene.swift
//  TapRunner
//
//  Created by Igor Chernyshov on 01.08.2021.
//

import SpriteKit
import GameplayKit

final class GameScene: SKScene {

	// MARK: - Timers
	private var roadTimer: Timer?

	// MARK: - Properties
	private var configuration = GameConfigurator.shared

	// MARK: - Lifecycle
    override func didMove(to view: SKView) {
		startGame()
    }

	// MARK: - Game States
	private func startGame() {
		roadTimerTick()
	}

	// MARK: - Roads
	@objc private func roadTimerTick() {
		spawnRoad()
		restartRoadsTimer()
	}

	private func spawnRoad() {
		let newRoad = Road()
		addChild(newRoad)
		newRoad.activate(gameSpeed: configuration.gameSpeed)
	}

	private func restartRoadsTimer() {
		roadTimer?.invalidate()
		roadTimer = Timer.scheduledTimer(timeInterval: configuration.roadSpawnInterval,
										 target: self,
										 selector: #selector(roadTimerTick),
										 userInfo: nil,
										 repeats: false)
	}
}
