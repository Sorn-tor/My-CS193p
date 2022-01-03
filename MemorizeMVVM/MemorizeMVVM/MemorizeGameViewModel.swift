//
//  MemorizeGameViewModel.swift
//  MemorizeMVVM
//
//  Created by sorn tanharaphan on 16/12/2564 BE.
//

import Foundation
import SwiftUI

class MemorizeGameViewModel: ObservableObject{
    private static let emojis1 = ["🚉", "🚃", "🚗", "🚕", "🚂", "✈️", "🛸", "🛺", "🚡", "🚛", "🚑", "🚇", "🚀", "🛶", "🚢", "🚍", "🛩", "🎠", "🎡", "🚔", "🚜", "🚲", "🛵", "🦽"]
    private static let emojis2 = ["🏋🏻‍♀️", "🪃", "🪀", "🤿", "⛸", "🏀", "🏓", "⛳️", "🤺", "🏏"]
    private static let emojis3 = ["🍟", "🍅", "🍖", "🍕", "🥓", "🍔", "🥪", "🦴", "🥟", "🍙", "🍫", "🍣", "🍱"]
    
    private static var emojis = emojis1
    var themeColor : Color = .black
    
    enum emojiTheme: CaseIterable {
        case theme1, theme2, theme3
    }
    
    private static func randomedCardContents(nPairs numberOfPairsOfCards: Int) -> [String]{
        var chosenEmojis: [String] = []
        
        while chosenEmojis.count<numberOfPairsOfCards{
            if let randomEmoji = emojis.randomElement() {
                if !chosenEmojis.contains(randomEmoji){
                    chosenEmojis.append(randomEmoji)
                }
            }
        }
        
        return chosenEmojis
    }
    
    func changeTheme(to theme: emojiTheme = .theme1){
        switch theme{
        case .theme1:
            MemorizeGameViewModel.emojis = MemorizeGameViewModel.emojis1
            themeColor = .black
        case .theme2:
            MemorizeGameViewModel.emojis = MemorizeGameViewModel.emojis2
            themeColor = .red
        case .theme3:
            MemorizeGameViewModel.emojis = MemorizeGameViewModel.emojis3
            themeColor = .orange

        }
        
        model = MemorizeGameViewModel.newSetofCards()
    }
    
    func newGame(){
        let newGameTheme = emojiTheme.allCases.randomElement()
        changeTheme(to: newGameTheme!)
    }
    
    static func newSetofCards() -> MemorizeGameModel<String>{
    
        let nPairs = Int.random(in: 4..<MemorizeGameViewModel.emojis.count)
        
        return MemorizeGameModel<String>.init(contents: MemorizeGameViewModel.randomedCardContents(nPairs: nPairs))
    }
    
    @Published private var model: MemorizeGameModel<String> = newSetofCards()
    
    var cards: Array<MemorizeGameModel<String>.Card>{
        model.cards
    }
    
    var score: Int{
        model.score
    }
    
    func chooseThis(_ card: MemorizeGameModel<String>.Card){
        model.chooseThis(card)
    }
    
}
