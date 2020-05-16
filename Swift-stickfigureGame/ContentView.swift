//
//  ContentView.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/13.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stickfiguredata=stickfiguresData()
    @State private var showhowtoplaypage = false
    @State private var showstickfigureList1=false
    @State private var showstickfigureList2=false
    @State private var showreadybattle=false
    var body: some View {
        
        ScrollView{
            
            ZStack {
                Image(systemName: "person.3.fill")
                    .resizable()
                    .frame(width:200,height: 100)
                    .offset(x:0,y:-380)
                Text("-火柴人亂鬥-")
                    .padding()
                    .font(.custom("Cochin-Italic",size:60))
                    .frame(width:400,height:50)
                    
                    .background(Color.pink)
                    //.cornerRadius(50)
                    .offset(x:0,y:-291)
                Button("遊戲規則",action:{
                    self.showhowtoplaypage=true
                }).sheet(isPresented:$showhowtoplaypage){
                    howtoplay()
                }.frame(width:250,height:80)
                    .font(.custom("Copperplate",size:30))
                    .background(Color.yellow)
                    .cornerRadius(50)
                    .offset(x:0,y:-107)
                
                Button("玩家一設置",action:{
                    self.showstickfigureList1=true
                }).sheet(isPresented:$showstickfigureList1){
                    stickfigureList1()
                }.frame(width:250,height:50)
                    .font(.custom("Copperplate",size:30))
                    .background(Color.purple)
                    .foregroundColor(Color.black)
                    .cornerRadius(50)
                    .offset(x:100,y:40)
                
                Button("玩家二設置",action:{
                    self.showstickfigureList2=true
                }).sheet(isPresented:$showstickfigureList2){
                    stickfigureList2()
                }.frame(width:250,height:80)
                    .font(.custom("Copperplate",size:30))
                    .background(Color.orange)
                    .foregroundColor(Color.black)
                    .cornerRadius(50)
                    .offset(x:-70,y:190)
                Button("準備決鬥",action:{
                    self.showreadybattle=true
                }).sheet(isPresented:$showreadybattle){
                    
                        readybattle()
                    
                }.frame(width:200,height:80)
                    .font(.custom("Copperplate",size:40))
                    .background(Color.red)
                    .foregroundColor(Color.black)
                    .cornerRadius(50)
                    .offset(x:-70,y:360)
            }.frame(width:400,height:900)
            Image("occupation0")
            .resizable()
            .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue,lineWidth: 4))
                .frame(width:150,height: 150)
                .offset(x:130,y:-740)
            Image("occupation1")
            .resizable()
            .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.purple,lineWidth: 4))
                .frame(width:150,height: 150)
                .offset(x:-70,y:-660)
            Image("occupation2")
            .resizable()
            .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.green,lineWidth: 4))
                .frame(width:150,height: 150)
                .offset(x:80,y:-620)
        }
        .background(ZStack{
            Group{
                Rectangle()
                    .fill(Color.gray)
                    .frame(width:300,height:100)
                    .offset(x:-100,y:-380)
                
                Rectangle()
                    .fill(Color.pink)
                    .frame(width:400,height:150)
                    .offset(x:100,y:-300)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width:500,height:70)
                    .offset(x:-100,y:-150)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width:300,height:70)
                    .offset(x:-100,y:-65)
                Rectangle()
                    .fill(Color.red)
                    .frame(width:200,height:70)
                    .offset(x:-110,y:20)
                Rectangle()
                    .fill(Color.purple)
                    .frame(width:300,height:70)
                    .offset(x:110,y:80)
                
                Rectangle()
                    .frame(width:400,height:100)
                    .offset(x:110,y:200)
                
                Rectangle()
                    .fill(Color.orange)
                    .frame(width:350,height:160)
                    .offset(x:-110,y:270)
            }
            Rectangle()
                .fill(Color.green)
                .frame(width:130,height:40)
                .offset(x:150,y:300)
            Rectangle()
                .fill(Color.green)
                .frame(width:230,height:40)
                .offset(x:150,y:350)
            Rectangle()
                .fill(Color.green)
                .frame(width:100,height:40)
                .offset(x:160,y:400)
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
