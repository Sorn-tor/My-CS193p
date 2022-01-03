//
//  ContentView.swift
//  Memorize
//
//  Created by sorn tanharaphan on 13/12/2564 BE.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🎮", "🚃", "🚗", "🚕", "🚂", "✈️", "🛸", "🛺", "🚡", "🚛", "🚑", "🚇", "🚀", "🛶", "🚢", "🚍", "🛩", "🎠", "🎡", "🚔", "🚜", "🚲", "🛵", "🦽"]
    
    @State var emojicount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    
                    ForEach(emojis[0..<emojicount], id: \.self){ emoji in
                        CardView(emoji: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack{
                removeBtn
                Spacer()
                randomBtn
                Spacer()
                addBtn
            }
        }
        .font(.largeTitle)
        .padding()
    }
    
    
    var addBtn: some View{
        Button {
            if (emojicount<emojis.count) {
                emojicount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeBtn: some View{
        Button {
            if (emojicount>0){
                emojicount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var randomBtn: some View{
        Button{
            emojicount = Int.random(in: 4...emojis.count)
        } label: {
            Image(systemName: "arrow.triangle.2.circlepath.circle")
        }
    }
}


struct CardView: View{
    
    var emoji: String
    @State var isFaceUp = true
    
    var body: some View{
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.black)
                Text(emoji)
            }
            else{
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.black)
                Text(emoji)
                RoundedRectangle(cornerRadius: 20)
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
        
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
