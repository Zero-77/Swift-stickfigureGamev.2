//
//  stickfigureData2.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import Foundation
import Combine

class stickfiguresData2:ObservableObject{
    @Published var stickfigures2 = [stickfigure2]()
    var cancellable: AnyCancellable? //取得訂閱資料，問號是不確定型別
    init(){
        if let data = UserDefaults.standard.data(forKey: "stickfigures2"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([stickfigure2].self,from: data){
                stickfigures2=decodedData
            }
        }
        cancellable=$stickfigures2.sink(receiveValue: {(value) in
            let encoder = JSONEncoder()
            do{
                let data=try encoder.encode(value)
                UserDefaults.standard.set(data,forKey: "stickfigures2")
            }//do
            catch{
                
            }//catch
        })//receiveValue//sink
    }
}
