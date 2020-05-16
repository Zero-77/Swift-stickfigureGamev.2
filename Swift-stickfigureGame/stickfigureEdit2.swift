//
//  stickfigureEdit2.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct stickfigureEdit2: View {
    @Environment(\.presentationMode) var presentationMode
    var stickfiguredata: stickfiguresData2
    @State private var name=""
    @State private var occupation=0
    @State private var level=1
    
    var editstickfigure:stickfigure2?
    
    //@Binding var pickeroccupation:Int
    
    @State private var roles=["鬥士Warrior","法師Magician","刺客Assassin"]
   // @State private var selectedIndexroles=0
    
    var body: some View {
        Form{
            Image("occupation\(self.occupation)")
            .resizable()
            .scaledToFit()
            TextField("名字",text:$name)
            Picker(selection:$occupation,label:Text("選擇職業")){
                ForEach(0..<roles.count){
                    (index) in
                    Text(self.roles[index])
                }
            }//picker mood
                .frame(height:70)
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.yellow)
                .cornerRadius(50)
                .shadow(radius: 30)
            Stepper("等級 Lv.\(level)",value:$level,in:1...3)
        }.navigationBarTitle(editstickfigure == nil ? "Add new stickfigure":"Edit stickfigure")
            .navigationBarItems(trailing:Button("Save"){
                let newstickfigures = stickfigure2(name: self.name, occupation: self.occupation, level: self.level)
                if let editstickfigures = self.editstickfigure{
                    let index = self.stickfiguredata.stickfigures2.firstIndex{
                        $0.id == editstickfigures.id
                        }!
                    self.stickfiguredata.stickfigures2[index] = newstickfigures
                }
                else{
                    self.stickfiguredata.stickfigures2.insert(newstickfigures,at:0)
                }
                self.presentationMode.wrappedValue.dismiss()
            })//點選save時，判斷是否為編輯或新資料
            .onAppear{
                if let editstick = self.editstickfigure { self.name = editstick.name
                    self.occupation = editstick.occupation
                    self.level = editstick.level
                }//判斷是否為編輯頁面所要加入寫法，加入是為了要在編輯lovers的時候能後顯示目前lover的資料，顯示name weight trueHeart
        }
    }
}

struct stickfigureEdit2_Previews: PreviewProvider {
    static var previews: some View {
        stickfigureEdit2(stickfiguredata:stickfiguresData2())
    }
}
