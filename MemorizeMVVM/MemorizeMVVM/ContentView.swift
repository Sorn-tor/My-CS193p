//
//  ContentView.swift
//  MemorizeMVVM
//
//  Created by sorn tanharaphan on 16/12/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewmodel = MemorizeGameViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Text("Score \(viewmodel.score)")
                Spacer()
                Button{
                    viewmodel.newGame()
                } label:{
                    Image(systemName: "arrow.triangle.2.circlepath.circle")
                }
                
            }.font(.title)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    
                    ForEach(viewmodel.cards){ card in
                        CardView(card)
                            .foregroundColor(viewmodel.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewmodel.chooseThis(card)
                            }
                    }
                    
                }
            }
            
        }
        .padding()
    }
    
    func themeBtn(theme: MemorizeGameViewModel.emojiTheme, btnName: String) -> some View{
        return Button{
            viewmodel.changeTheme(to: theme)
        } label:{
            VStack{
                Image(systemName: "theatermasks.circle").font(.largeTitle)
                Text(btnName)
            }
        }
    }
    
    
    
}

struct CardView: View{
    let card: MemorizeGameModel<String>.Card
    
    init(_ card: MemorizeGameModel<String>.Card){
        self.card = card
    }
    
    var body: some View{
        let cardShape = RoundedRectangle(cornerRadius: 20)
        ZStack{
            if card.isFaceUp{
                Text(card.content).font(.largeTitle)
                cardShape.strokeBorder(lineWidth: 3)
            }
            else if card.isMatched{
                cardShape.opacity(0)
            }
            else{
                cardShape
            }
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
