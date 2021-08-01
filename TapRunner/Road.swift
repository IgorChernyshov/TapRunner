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
		Road.isLeftToRight.toggle()
		configure()
	}

	// MARK: - Configuration
	func configure() {
		position = CGPoint(x: 512, y: 100) // 0
		zRotation = CGFloat.random(in: 0.1...0.25) * (Road.isLeftToRight ? -1 : 1)
		name = "road"

		physicsBody = SKPhysicsBody(rectangleOf: size)
		physicsBody?.isDynamic = false
	}
}
