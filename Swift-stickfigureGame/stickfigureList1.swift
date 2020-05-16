//
//  stickfigureList1.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct stickfigureList1: View {
    @ObservedObject var stickfiguredata=stickfiguresData()
    
    @State private var showeditstickfigure=false
    
    @State private var selectedIndex=0
    
    @State private var showbattle=false
    init(){
        UINavigationBar.appearance().backgroundColor = .orange
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font:UIFont(name: "Noteworthy-Bold", size: 50)!]
    }
    var body: some View {
        NavigationView{
            
            List{
                ForEach(stickfiguredata.stickfigures){
                    (stick) in
                    NavigationLink( destination: stickfigureEdit( stickfiguredata: self.stickfiguredata,editstickfigure:stick)/*(loversData: self.loversData,editLover:lover)*/){
                        stickfigureRow(Stickfigures: stick)
                        
                    }//加入,editLover:lover，修改情人時，生成 LoverEditor 時傳入
                }.onDelete{(indexSet) in self.stickfiguredata.stickfigures.remove(atOffsets: indexSet)}
                
            }//list
                
                .navigationBarTitle("角色設置列表")
                .navigationBarItems(trailing: HStack{
                    Spacer()
                    Button(action: {self.showeditstickfigure=true}, label: {Image(systemName: "person.badge.plus.fill").resizable()
                        .frame(width:45,height: 45)}).sheet(isPresented:$showeditstickfigure){
                            NavigationView{
                                stickfigureEdit( stickfiguredata: self.stickfiguredata)
                            }//新增情人利用sheet顯示時再另外產生NavigationView
                    }
                    }//hstack
            )//navigationbaritem
        }//navigationview
    }
}

struct stickfigureList1_Previews: PreviewProvider {
    static var previews: some View {
        stickfigureList1()
    }
}
