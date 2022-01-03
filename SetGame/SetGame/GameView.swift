//
//  GameView.swift
//  SetGame
//
//  Created by sorn tanharaphan on 25/12/2564 BE.
//

import SwiftUI

struct GameView: View {
    
    let game: SetGameViewModel
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                ForEach(Array(game.cards), id: \.self){ card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .padding()
        
        
    }
}












struct ContentView_Previews: PreviewProvider {
    static let game1 =  SetGameViewModel()
    static var previews: some View {
        GameView(game: game1)
    }
}
