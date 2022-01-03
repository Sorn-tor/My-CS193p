//
//  SetGame.swift
//  SetGame
//
//  Created by sorn tanharaphan on 25/12/2564 BE.
//

import Foundation
import SwiftUI

enum Symbol: CaseIterable{
    case diamond, oval, squiggle
}
enum Shading: CaseIterable{
    case fill, stroke, gradient
}

struct SetGame{
    private(set) var cards: [Card]
    
    func pickThis(_ card: Card){
        
    }
    
    init(){
        cards = []
        
        let rangeOfNumberOfSymbolsOnACard = 1...3
        let colors = [Color.red, Color.blue, Color.green]
        var cardAssignedId = 0
        
        for n in rangeOfNumberOfSymbolsOnACard{
            for c in colors{
                for s in Shading.allCases{
                    for sym in Symbol.allCases{
                        print("\(n) \(c) \(s) \(sym) \(cardAssignedId)")
                        cards.append(Card(symbol: sym, color: c, shading: s, number: n))
                        cardAssignedId += 1
                    }
                }
            }
        }
    }
    
    struct Card{
        let symbol: Symbol
        let color: Color
        let shading: Shading
        let number: Int
        
    }
    
}


