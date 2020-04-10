//
//  Command.swift
//  calc WatchKit Extension
//
//  Created by Spenser Dubin on 12/7/18.
//  Copyright © 2018 Spenser Dubin. All rights reserved.
//

import WatchKit

enum CommandType {
    case Divide
    case Multiply
    case Add
    case Subtract
}

class Command: NSObject {
    var type: CommandType
    let oldValue: Double
    
    init(type: CommandType, oldValue: Double){
        self.type = type
        self.oldValue = oldValue
        super.init()
    }
    
    func executeWithNewValue(newValue: Double) -> Double {
        var result = oldValue
        switch type{
            case .Divide: result /= newValue
            case .Multiply: result *= newValue
            case .Add: result += newValue
            case .Subtract: result -= newValue
        }
    return result
    }
}
