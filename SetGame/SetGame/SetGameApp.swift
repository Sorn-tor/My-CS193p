//
//  SetGameApp.swift
//  SetGame
//
//  Created by sorn tanharaphan on 25/12/2564 BE.
//

import SwiftUI

@main
struct SetGameApp: App {
    let game = SetGameViewModel()
    var body: some Scene {
        WindowGroup {
            GameView(game: game)
        }
    }
}
