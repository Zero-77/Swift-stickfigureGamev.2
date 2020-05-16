//
//  howtoplay.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/13.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct howtoplay: View {
    var body: some View {
        ScrollView{
            Text("火柴人大亂鬥\n").offset(x:0,y:160)
            Text("請在玩家一與玩家二中設置\n火柴人的”名字““職業”“等級”\n“等級可分配3點超過視為犯規”\n\n每當玩家新增一個火柴人時\n會將他加入為第一個，也就\n會顯示於最上方的，請確認\n有加入三個火柴人，因為決\n鬥會依照三個火柴人順序對\n決。\n＊往左滑可做刪除＊\n\n接著點選準備決鬥，可以做\n最後調整，點選決鬥，就會\n顯示決鬥結果與圖表分析玩\n家一與玩家二的職業。\n\n決鬥規則：\n等級分為1~3級\n優先比較等級\n\n職業分為“鬥士”“法師”“刺客”\n").offset(x:0,y:150)
            Text("鬥士>刺客，法師>鬥士，刺客>法師\n等級大於職業，例如：Lv.2鬥士>Lv.1法師").offset(x:0,y:140)
        }.background(ZStack{
            Rectangle()
                .fill(Color.red)
                .frame(width:530,height:240)
                .offset(x:150,y:-400)
            Rectangle()
                .fill(Color.green)
                .frame(width:330,height:140)
                .offset(x:-150,y:410)
            Rectangle()
                .fill(Color.green)
                .frame(width:500,height:50)
                .offset(x:-150,y:420)
            Rectangle()
                .fill(Color.blue)
                .frame(width:90,height:340)
                .offset(x:170,y:0)
            Rectangle()
                .fill(Color.orange)
                .frame(width:90,height:540)
                .offset(x:-180,y:0)
            
        })
    }
}

struct howtoplay_Previews: PreviewProvider {
    static var previews: some View {
        howtoplay()
    }
}
