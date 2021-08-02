//
//  Road.swift
//  TapRunner
//
//  Created by Igor Chernyshov on 01.08.2021.
//

import SpriteKit

final class Road: SKSpriteNode {

	// MARK: - Properties
	private static var isLeftToRight: Bool = false

	// MARK: - Initialization
	convenience init() {
		self.init(color: .green, size: CGSize(width: 1536, height: 10))
		configure()
		toggleLeftToRight()
	}

	// MARK: - Configuration
	private func configure() {
		position = CGPoint(x: 512, y: -125)
		zRotation = CGFloat.random(in: 0.05...0.20) * (Road.isLeftToRight ? -1 : 1)
		name = "road"

		physicsBody = SKPhysicsBody(rectangleOf: size)
		physicsBody?.isDynamic = false
	}

	private func toggleLeftToRight() {
		let isToggleRequired = Bool.random()
		if isToggleRequired {
			Road.isLeftToRight.toggle()
		}
	}

	// MARK: - Game Logic
	func activate(gameSpeed: Double) {
		let moveUp = SKAction.moveTo(y: 893, duration: gameSpeed)
		let delete = SKAction.run { [weak self] in self?.removeFromParent() }
		run(SKAction.sequence([moveUp, delete]))
	}
}
