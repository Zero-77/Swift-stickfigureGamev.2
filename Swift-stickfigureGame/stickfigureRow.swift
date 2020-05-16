//
//  stickfigureRow.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct stickfigureRow: View {
    var Stickfigures:stickfigure
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

struct stickfigureRow_Previews: PreviewProvider {
    static var previews: some View {
        stickfigureRow(Stickfigures: stickfigure(name: "123", occupation:0,level:1))
    }
}
/*
   var name: String
   var occupation: String
   var level:Int
 */
