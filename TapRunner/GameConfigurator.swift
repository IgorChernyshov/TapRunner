//
//  GameConfigurator.swift
//  TapRunner
//
//  Created by Igor Chernyshov on 02.08.2021.
//

import Foundation

final class GameConfigurator {

	// MARK: - Game Settings
	/// The number of seconds that takes a road to travel from bottom to top.
	let gameSpeed: Double = 6

	/// Random number of seconds between road spawn events.
	var roadSpawnInterval: TimeInterval { Double.random(in: 0.75...1.75) }

	// MARK: - Singleton
	/// Please use shared instance.
	private init() {}

	static let shared = GameConfigurator()
}
