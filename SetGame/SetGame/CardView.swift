//
//  CardView.swift
//  SetGame
//
//  Created by sorn tanharaphan on 25/12/2564 BE.
//

import SwiftUI

struct CardView: View{
    
    let card: SetGame.Card
    
    init(card: SetGame.Card){
        self.card = card
    }

    var body: some View{
        switch card.symbol {
        case .diamond:
            diamonds()
        case .oval:
            ovals()
        case .squiggle:
            squiggles()
        }
    }
    
    
    func ovals() -> some View{
        GeometryReader{ geometry in
            let width = geometry.size.width * 0.8
            ZStack{
                RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3)
                VStack{
                    ForEach(Range(1...card.number)){ _ in
                        switch card.shading {
                        case .fill:
                            Capsule()
                                .foregroundColor(card.color)
                                .padding(.vertical, 5)
                                .frame(width: width, height: width/2)
                        case .stroke:
                            Capsule()
                                .strokeBorder(lineWidth: 3)
                                .foregroundColor(card.color)
                                .padding(.vertical, 5)
                                .frame(width: width, height: width/2)
                        case .gradient:
                            Capsule()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [card.color, .white]), startPoint: .leading, endPoint: .trailing)
                                )
                                .opacity(0.8)
                                .padding(.vertical, 5)
                                .frame(width: width, height: width/2)
                        }
                        
                    }
                }
            }
        }
    }
    
    func diamonds() -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3)
            VStack{
                Spacer()
                ForEach(Range(1...card.number)){ _ in
                    switch card.shading {
                    case .fill:
                        Diamond().foregroundColor(card.color)
                    case .stroke:
                        Diamond().stroke(lineWidth: 3).foregroundColor(card.color)
                    case .gradient:
                        Diamond()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [card.color, .white]), startPoint: .leading, endPoint: .trailing)
                            )
                            .opacity(0.8)
                    }
                }
                Spacer()
            }
        }
    }
    
    func squiggles() -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3)
            VStack{
                Spacer()
                ForEach(Range(1...card.number)){ _ in
                    switch card.shading {
                    case .fill:
                        Squiggle().foregroundColor(card.color)
                    case .stroke:
                        Squiggle().stroke(lineWidth: 3).foregroundColor(card.color)
                    case .gradient:
                        Squiggle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [card.color, .white]), startPoint: .leading, endPoint: .trailing)
                            )
                            .opacity(0.8)
                                
                    }
                }
                Spacer()
            }
        }
    }
    
    
    
}
