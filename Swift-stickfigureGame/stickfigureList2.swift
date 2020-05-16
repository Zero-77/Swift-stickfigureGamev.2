//
//  stickfigureList2.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct stickfigureList2: View {
    @ObservedObject var stickfiguredata2=stickfiguresData2()
    
    @State private var showeditstickfigure=false
    
    @State private var selectedIndex=0
    
    
    init(){
        UINavigationBar.appearance().backgroundColor = .orange
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font:UIFont(name: "Noteworthy-Bold", size: 50)!]
    }
    var body: some View {
        NavigationView{
            List{
                ForEach(stickfiguredata2.stickfigures2){
                    (stick) in
                    NavigationLink( destination: stickfigureEdit2( stickfiguredata: self.stickfiguredata2,editstickfigure:stick)/*(loversData: self.loversData,editLover:lover)*/){
                        stickfigureRow2(Stickfigures: stick)
                        
                    }//加入,editLover:lover，修改情人時，生成 LoverEditor 時傳入
                }.onDelete{(indexSet) in self.stickfiguredata2.stickfigures2.remove(atOffsets: indexSet)}
                
            }//list
                .navigationBarTitle("角色設置列表")
                .navigationBarItems(trailing: HStack{
                    Spacer()
                    Button(action: {self.showeditstickfigure=true}, label: {Image(systemName: "person.badge.plus.fill").resizable()
                        .frame(width:45,height: 45)}).sheet(isPresented:$showeditstickfigure){
                            NavigationView{
                                stickfigureEdit2( stickfiguredata: self.stickfiguredata2)
                            }//新增情人利用sheet顯示時再另外產生NavigationView
                    }
                    }//hstack
            )//navigationbaritem
            
            
        }//navigationview
        //Text("stickfigurelist2")
    }
}

struct stickfigureList2_Previews: PreviewProvider {
    static var previews: some View {
        stickfigureList2()
    }
}
