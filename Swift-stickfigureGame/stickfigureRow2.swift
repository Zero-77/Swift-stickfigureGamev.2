//
//  stickfigureRow2.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct stickfigureRow2: View {
    var Stickfigures:stickfigure2
       //@Binding var pickeroccupation:Int
        @State private var roles=["鬥士Warrior","法師Magician","刺客Assassin"]
    var body: some View {
        HStack{
                 Image("occupation\(Stickfigures.occupation)")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(hue: 0.987, saturation: 0.687, brightness: 0.99),lineWidth: 4))
                .shadow(radius: 10)
                
                Text(Stickfigures.name)
                Spacer()
                Text(roles[Stickfigures.occupation])
                Spacer()
                Text("Lv.\(Stickfigures.level)")
              
            }
        }
    }


struct stickfigureRow2_Previews: PreviewProvider {
    static var previews: some View {
        stickfigureRow2(Stickfigures: stickfigure2(name: "123", occupation:0,level:1))
    }
}
