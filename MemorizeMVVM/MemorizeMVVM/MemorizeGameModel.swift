//
//  MemorizeGameModel.swift
//  MemorizeMVVM
//
//  Created by sorn tanharaphan on 16/12/2564 BE.
//

import Foundation

struct MemorizeGameModel<CardContent> where CardContent: Equatable{
    private(set) var cards: [Card]
    private(set) var score: Int
    
    private var theFacedUpCardIndex: Int? {
        let facedUpCards = cards.indices.filter({cards[$0].isFaceUp})
        return facedUpCards.count==1 ? facedUpCards.first : nil
    }
    
    mutating func chooseThis(_ chosenCard: Card){
        
        if let chosenCardIndex = cards.firstIndex(where: { $0.id == chosenCard.id}),
           cards[chosenCardIndex].isMatched != true,
           cards[chosenCardIndex].isFaceUp != true{
            
            if let facedUpCardIndex = theFacedUpCardIndex{
                // There is already a faced-up card.
                if cards[facedUpCardIndex].content == cards[chosenCardIndex].content{
                    cards[facedUpCardIndex].isMatched = true
                    cards[chosenCardIndex].isMatched = true
                    updateScore(by: 2)
                }
                else{
                    updateScore(by: -1)
                }
            }
            else{
                // All cards are faced-down.
                updateScore(by: -1)
                for i in cards.indices{
                    cards[i].isFaceUp = false
                }
            }
            
            cards[chosenCardIndex].isFaceUp.toggle()
        }
    }
    
    mutating func updateScore(by amount: Int){
        score+=amount
    }
    
    init(contents: [CardContent]){
        cards = []
        score = 0
        
        for index in contents.indices{
            cards.append(Card(content: contents[index], id: index*2))
            cards.append(Card(content: contents[index], id: index*2+1))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        let content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let id: Int
    }
}


