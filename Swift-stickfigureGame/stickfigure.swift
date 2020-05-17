//
//  stickfigure.swift
//  Swift-stickfigureGame
//
//  Created by 07 Zhang on 2020/5/14.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import Foundation
struct stickfigure: Identifiable,Codable{
    let id = UUID()
    var name: String
    var occupation: Int
    var level:Int
    var attack:Int
    var speed:Int
}
