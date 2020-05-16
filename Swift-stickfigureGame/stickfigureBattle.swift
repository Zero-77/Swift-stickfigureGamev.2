//
//  stickfigureBattle.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI


struct PieChart:Shape{
    var startAngle:Angle
    var endAngle:Angle
    
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            let center=CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

func countwarrior(f:Int,s:Int,t:Int, xx:inout Double)->Double{
    if (f==0){ xx = xx+1}
    if (s==0){ xx = xx+1}
    if (t==0){ xx = xx+1}
    if(xx==0){xx=0}
    else if(xx==1){xx=30}
    else if(xx==2){xx=70}
    else if(xx==3){xx=100}
    return xx
}
func countmagician(f:Int,s:Int,t:Int, yy:inout Double)->Double{
    if (f==1){ yy = yy+1}
    if (s==1){ yy = yy+1}
    if (t==1){ yy = yy+1}
    if(yy==0){yy=0}
    else if(yy==1){yy=30}
    else if(yy==2){yy=70}
    else if(yy==3) {yy=100}
    return yy
}
func countassassin(f:Int,s:Int,t:Int, zz:inout Double)->Double{
    if (f==2){ zz = zz+1}
    if (s==2){ zz = zz+1}
    if (t==2){ zz = zz+1}
    if(zz==0){zz=0}
    else if(zz==1){zz=30}
    else if(zz==2){zz=70}
    else if (zz==3) {zz=100}
    return zz
}
struct PieChartView:View{
    var percentages:[Double]
    var angles:[Angle]
    
    init(percentages:[Double]){
        self.percentages=percentages
        angles=[Angle]()
        var startDegree:Double=0
        for percentage in percentages{
            angles.append(.degrees(startDegree))
            startDegree+=360*percentage/100
        }
    }
    let colorset:[Color]=[Color(red: 255/255, green: 155/255, blue: 5/255),Color(red: 77/255, green: 110/255, blue: 248/255),Color(red: 77/255, green: 255/255, blue: 45/255)]
    func addOne(index:Int)->Int{
        return index+1
    }
    var body: some View {
        ZStack{
            ForEach(angles.indices){ (index) in
                if index == self.angles.count-1{
                    PieChart(startAngle: self.angles[index], endAngle: .zero).fill(self.colorset[index])
                }else{
                    PieChart(startAngle: self.angles[index], endAngle: self.angles[self.addOne(index:index)]).fill(self.colorset[index])
                }
            }
        }
    }
}

struct stickfigureBattle: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var stickfiguredata=stickfiguresData()
    @State private var roles=["鬥士Warrior","法師Magician","刺客Assassin"]
    @ObservedObject var stickfiguredata2=stickfiguresData2()
    @State private var door=false
    @State private var analist:[Double]=[0,0,0]
    @State private var w:Double=0
    @State private var m:Double=0
    @State private var a:Double=0
    @State private var xx:Double=0
    @State private var yy:Double=0
    @State private var zz:Double=0
    var body: some View {
        
        VStack {
            if (stickfiguredata.stickfigures[0].level)+(stickfiguredata.stickfigures[1].level)+(stickfiguredata.stickfigures[2].level)>6 && (stickfiguredata2.stickfigures2[0].level)+(stickfiguredata2.stickfigures2[1].level)+(stickfiguredata2.stickfigures2[2].level)<=6{
                
                Text("*玩家一違反規定，玩家二獲勝*")
            }
            else if (stickfiguredata.stickfigures[0].level)+(stickfiguredata.stickfigures[1].level)+(stickfiguredata.stickfigures[2].level)<=6 && (stickfiguredata2.stickfigures2[0].level)+(stickfiguredata2.stickfigures2[1].level)+(stickfiguredata2.stickfigures2[2].level)>6{
                
                Text("*玩家二違反規定，玩家一獲勝*")
            }
            else if (stickfiguredata.stickfigures[0].level)+(stickfiguredata.stickfigures[1].level)+(stickfiguredata.stickfigures[2].level)>6 && (stickfiguredata2.stickfigures2[0].level)+(stickfiguredata2.stickfigures2[1].level)+(stickfiguredata2.stickfigures2[2].level)>6{
                
                Text("*玩家一與玩家二皆違反規定，無勝負*")
            }
                //battle1
            else if (stickfiguredata.stickfigures[0].level)+(stickfiguredata.stickfigures[1].level)+(stickfiguredata.stickfigures[2].level)<=6 && (stickfiguredata2.stickfigures2[0].level)+(stickfiguredata2.stickfigures2[1].level)+(stickfiguredata2.stickfigures2[2].level)<=6{
                battle1()
                Text("\n")
                battle2()
                Text("\n")
                battle3()
            }//else if 3battle
            HStack{
                VStack{
            Color(red: 255/255, green: 155/255, blue: 5/255).frame(width:50,height:50)
                Text("鬥士")
            Color(red: 77/255, green: 110/255, blue: 248/255).frame(width:50,height:50)
            Text("法師")
            Color(red: 77/255, green: 255/255, blue: 45/255).frame(width:50,height:50)
            Text("刺客")
                   
                }
                
                VStack{
                    Text("玩家一")
                    Text("角色職業分析")
                    PieChartView(percentages: [countwarrior(f: stickfiguredata.stickfigures[0].occupation, s: stickfiguredata.stickfigures[1].occupation, t: stickfiguredata.stickfigures[2].occupation, xx: &xx),countmagician(f: stickfiguredata.stickfigures[0].occupation, s: stickfiguredata.stickfigures[1].occupation, t: stickfiguredata.stickfigures[2].occupation, yy: &yy),countassassin(f: stickfiguredata.stickfigures[0].occupation, s: stickfiguredata.stickfigures[1].occupation, t: stickfiguredata.stickfigures[2].occupation, zz: &zz)]).frame(width:150,height:150)
                }
                VStack{
                    Text("玩家二")
                    Text("角色職業分析")
                    PieChartView(percentages: [countwarrior(f: stickfiguredata2.stickfigures2[0].occupation, s: stickfiguredata2.stickfigures2[1].occupation, t: stickfiguredata2.stickfigures2[2].occupation, xx: &xx),countmagician(f: stickfiguredata2.stickfigures2[0].occupation, s: stickfiguredata2.stickfigures2[1].occupation, t: stickfiguredata2.stickfigures2[2].occupation, yy: &yy),countassassin(f: stickfiguredata2.stickfigures2[0].occupation, s: stickfiguredata2.stickfigures2[1].occupation, t: stickfiguredata2.stickfigures2[2].occupation, zz: &zz)]).frame(width:150,height:150)
                }
            }
            Text("本次決鬥綜合職業")
             Path(CGRect(x:10,y:0,width:(countwarrior(f: stickfiguredata.stickfigures[0].occupation, s: stickfiguredata.stickfigures[1].occupation, t: stickfiguredata.stickfigures[2].occupation, xx: &xx)+countwarrior(f: stickfiguredata2.stickfigures2[0].occupation, s: stickfiguredata2.stickfigures2[1].occupation, t: stickfiguredata2.stickfigures2[2].occupation, xx: &xx))*2,height:50)).fill(Color(red: 255/255, green: 155/255, blue: 5/255))
            Path(CGRect(x:10,y:0,width:( countmagician(f: stickfiguredata.stickfigures[0].occupation, s: stickfiguredata.stickfigures[1].occupation, t: stickfiguredata.stickfigures[2].occupation, yy: &yy)+countmagician(f: stickfiguredata2.stickfigures2[0].occupation, s: stickfiguredata2.stickfigures2[1].occupation, t: stickfiguredata2.stickfigures2[2].occupation, yy: &yy))*2,height:50)).fill(Color(red: 77/255, green: 110/255, blue: 248/255))
            Path(CGRect(x:10,y:0,width: (countassassin(f: stickfiguredata.stickfigures[0].occupation, s: stickfiguredata.stickfigures[1].occupation, t: stickfiguredata.stickfigures[2].occupation, zz: &zz)+countassassin(f: stickfiguredata2.stickfigures2[0].occupation, s: stickfiguredata2.stickfigures2[1].occupation, t: stickfiguredata2.stickfigures2[2].occupation, zz: &zz))*2,height:50)).fill(Color(red: 77/255, green: 255/255, blue: 45/255))
            //}//draw piechartview group
        }//Vstack
    }
}


struct stickfigureBattle_Previews: PreviewProvider {
    static var previews: some View {
        stickfigureBattle()
    }
}

struct battle1: View {
    @ObservedObject var stickfiguredata=stickfiguresData()
    @State private var roles=["鬥士Warrior","法師Magician","刺客Assassin"]
    @ObservedObject var stickfiguredata2=stickfiguresData2()
    var body: some View {
        Group{
            HStack{
                Spacer()
                //player1
                VStack{
                    Text(roles[stickfiguredata.stickfigures[0].occupation])
                    Text("等級\(stickfiguredata.stickfigures[0].level)")
                }//vstack
                Spacer()
                //player2
                VStack{
                    Text(roles[stickfiguredata2.stickfigures2[0].occupation])
                    Text("等級\(stickfiguredata2.stickfigures2[0].level)")
                }//vstack
                Spacer()
                
            }//hstack
            if (stickfiguredata.stickfigures[0].level)>(stickfiguredata2.stickfigures2[0].level){
                Text("本局玩家一勝利")
            }
            else if(stickfiguredata.stickfigures[0].level)<(stickfiguredata2.stickfigures2[0].level){
                Text("本局玩家二勝利")
            }
            else if(stickfiguredata.stickfigures[0].level)==(stickfiguredata2.stickfigures2[0].level){
                if (stickfiguredata.stickfigures[0].occupation)==0{
                    if (stickfiguredata2.stickfigures2[0].occupation)==0{
                        Text("本局平手")
                    }
                    else if(stickfiguredata2.stickfigures2[0].occupation)==1{
                        Text("本局玩家二勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[0].occupation)==2{
                        Text("本局玩家一勝利")
                    }
                }
                else if (stickfiguredata.stickfigures[0].occupation)==1{
                    if (stickfiguredata2.stickfigures2[0].occupation)==0{
                        Text("本局玩家一勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[0].occupation)==1{
                        Text("本局平手")
                    }
                    else if(stickfiguredata2.stickfigures2[0].occupation)==2{
                        Text("本局玩家二勝利")
                    }
                }
                else if (stickfiguredata.stickfigures[0].occupation)==2{
                    if (stickfiguredata2.stickfigures2[0].occupation)==0{
                        Text("本局玩家二勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[0].occupation)==1{
                        Text("本局玩家一勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[0].occupation)==2{
                        Text("本局平手")
                    }
                }
            }
        }
    }
}

struct battle2: View {
    @ObservedObject var stickfiguredata=stickfiguresData()
    @State private var roles=["鬥士Warrior","法師Magician","刺客Assassin"]
    @ObservedObject var stickfiguredata2=stickfiguresData2()
    var body: some View {
        Group{
            //battle2
            HStack{
                Spacer()
                //player1
                VStack{
                    Text(roles[stickfiguredata.stickfigures[1].occupation])
                    Text("等級\(stickfiguredata.stickfigures[1].level)")
                }//vstack
                Spacer()
                //player2
                VStack{
                    Text(roles[stickfiguredata2.stickfigures2[1].occupation])
                    Text("等級\(stickfiguredata2.stickfigures2[1].level)")
                }//vstack
                Spacer()
                
            }//hstack
            if (stickfiguredata.stickfigures[1].level)>(stickfiguredata2.stickfigures2[1].level){
                Text("本局玩家一勝利")
            }
            else if(stickfiguredata.stickfigures[1].level)<(stickfiguredata2.stickfigures2[1].level){
                Text("本局玩家二勝利")
            }
            else if(stickfiguredata.stickfigures[1].level)==(stickfiguredata2.stickfigures2[1].level){
                if (stickfiguredata.stickfigures[1].occupation)==0{
                    if (stickfiguredata2.stickfigures2[1].occupation)==0{
                        Text("本局平手")
                    }
                    else if(stickfiguredata2.stickfigures2[1].occupation)==1{
                        Text("本局玩家二勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[1].occupation)==2{
                        Text("本局玩家一勝利")
                    }
                }
                else if (stickfiguredata.stickfigures[1].occupation)==1{
                    if (stickfiguredata2.stickfigures2[1].occupation)==0{
                        Text("本局玩家一勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[1].occupation)==1{
                        Text("本局平手")
                    }
                    else if(stickfiguredata2.stickfigures2[1].occupation)==2{
                        Text("本局玩家二勝利")
                    }
                }
                else if (stickfiguredata.stickfigures[1].occupation)==2{
                    if (stickfiguredata2.stickfigures2[1].occupation)==0{
                        Text("本局玩家二勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[1].occupation)==1{
                        Text("本局玩家一勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[1].occupation)==2{
                        Text("本局平手")
                    }
                }
            }
        }
    }
}

struct battle3: View {
    @ObservedObject var stickfiguredata=stickfiguresData()
    @State private var roles=["鬥士Warrior","法師Magician","刺客Assassin"]
    @ObservedObject var stickfiguredata2=stickfiguresData2()
    var body: some View {
        Group{
            //battle3
            HStack{
                Spacer()
                //player1
                VStack{
                    Text(roles[stickfiguredata.stickfigures[2].occupation])
                    Text("等級\(stickfiguredata.stickfigures[2].level)")
                }//vstack
                Spacer()
                //player2
                VStack{
                    Text(roles[stickfiguredata2.stickfigures2[2].occupation])
                    Text("等級\(stickfiguredata2.stickfigures2[2].level)")
                }//vstack
                Spacer()
                
            }//hstack
            if (stickfiguredata.stickfigures[2].level)>(stickfiguredata2.stickfigures2[2].level){
                Text("本局玩家一勝利")
            }
            else if(stickfiguredata.stickfigures[2].level)<(stickfiguredata2.stickfigures2[2].level){
                Text("本局玩家二勝利")
            }
            else if(stickfiguredata.stickfigures[2].level)==(stickfiguredata2.stickfigures2[2].level){
                if (stickfiguredata.stickfigures[2].occupation)==0{
                    if (stickfiguredata2.stickfigures2[2].occupation)==0{
                        Text("本局平手")
                    }
                    else if(stickfiguredata2.stickfigures2[2].occupation)==1{
                        Text("本局玩家二勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[2].occupation)==2{
                        Text("本局玩家一勝利")
                    }
                }
                else if (stickfiguredata.stickfigures[2].occupation)==1{
                    if (stickfiguredata2.stickfigures2[2].occupation)==0{
                        Text("本局玩家一勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[2].occupation)==1{
                        Text("本局平手")
                    }
                    else if(stickfiguredata2.stickfigures2[2].occupation)==2{
                        Text("本局玩家二勝利")
                    }
                }
                else if (stickfiguredata.stickfigures[2].occupation)==2{
                    if (stickfiguredata2.stickfigures2[2].occupation)==0{
                        Text("本局玩家二勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[2].occupation)==1{
                        Text("本局玩家一勝利")
                    }
                    else if(stickfiguredata2.stickfigures2[2].occupation)==2{
                        Text("本局平手")
                    }
                }
            }
        }
    }
}
