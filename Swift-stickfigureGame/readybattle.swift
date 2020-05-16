//
//  readybattle.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct readybattle: View {
    @ObservedObject var stickfiguredata=stickfiguresData()
    
    
    @State private var showeditstickfigure=false
    
    @State private var selectedIndex=0
    
    @ObservedObject var stickfiguredata2=stickfiguresData2()
    
    @State private var showeditstickfigure2=false
    
    @State private var showbattle=false
    @State private var roles=["鬥士Warrior","法師Magician","刺客Assassin"]
    @State private var x=0
    @State private var array1:[Int]=[]
    @State private var array2:[Int]=[]
    init(){
        UINavigationBar.appearance().backgroundColor = .blue
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font:UIFont(name: "Noteworthy-Bold", size: 40)!]
    }
    
    var body: some View {
        
        ZStack{
            Group{
                NavigationView{
                    
                    List{
                        ForEach(stickfiguredata.stickfigures){
                            (stick) in
                            
                            NavigationLink( destination: stickfigureEdit( stickfiguredata: self.stickfiguredata,editstickfigure:stick)/*(loversData: self.loversData,editLover:lover)*/){
                                stickfigureRow(Stickfigures: stick)
                                
                            }//加入,editLover:lover，修改情人時，生成 LoverEditor 時傳入
                        }.onDelete{(indexSet) in self.stickfiguredata.stickfigures.remove(atOffsets: indexSet)}
                        
                    }//list
                        
                        .navigationBarTitle("玩家一設置列表")
 
                }//navigationview
                    .frame(height:400)
                    .offset(y:-220)
                
                NavigationView{
                    List{
                        ForEach(stickfiguredata2.stickfigures2){
                            (stick) in
                            
                            NavigationLink( destination: stickfigureEdit2( stickfiguredata: self.stickfiguredata2,editstickfigure:stick)/*(loversData: self.loversData,editLover:lover)*/){
                                stickfigureRow2(Stickfigures: stick)
                                
                            }//加入,editLover:lover，修改情人時，生成 LoverEditor 時傳入
                        }.onDelete{(indexSet) in self.stickfiguredata2.stickfigures2.remove(atOffsets: indexSet)}
                        
                    }//list
                        .navigationBarTitle("玩家二設置列表")
                        
                }//navigationview
                    .frame(height:400)
                    .offset(y:220)
                 
            }
                Button("決鬥！",action:{
                    self.showbattle=true
                }).sheet(isPresented:$showbattle){
                    NavigationView{
                        VStack{
                        stickfigureBattle()
                        }.navigationBarTitle("～決鬥結果～")
                    }
                }.frame(width:200,height:80)
                    .font(.custom("Copperplate",size:40))
                    .background(Color.red)
                    .foregroundColor(Color.black)
                    .cornerRadius(50)
                    .offset(x:-70,y:400)
            
        }//ZStack
    }
}

struct readybattle_Previews: PreviewProvider {
    static var previews: some View {
        readybattle()
    }
}
