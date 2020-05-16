//
//  stickfigureData.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import Foundation
import Combine

class stickfiguresData:ObservableObject{
    @Published var stickfigures = [stickfigure]()
    var cancellable: AnyCancellable? //取得訂閱資料，問號是不確定型別
    init(){
        if let data = UserDefaults.standard.data(forKey: "stickfigures"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([stickfigure].self,from: data){
                stickfigures=decodedData
            }
        }
        cancellable=$stickfigures.sink(receiveValue: {(value) in
            let encoder = JSONEncoder()
            do{
                let data=try encoder.encode(value)
                UserDefaults.standard.set(data,forKey: "stickfigures")
            }//do
            catch{
                
            }//catch
        })//receiveValue//sink
    }
}
