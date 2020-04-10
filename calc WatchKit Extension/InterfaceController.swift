//
//  InterfaceController.swift
//  calc WatchKit Extension
//
//  Created by Spenser Dubin on 10/30/18.
//  Copyright © 2018 Spenser Dubin. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var currentValue: String = "0"
    var calcExecuted = false
    var command: Command?
    
    func numberPressed(value: Int){
        let newValue = "\(value)"
        
        if currentValue == "0" || calcExecuted {
            calcExecuted = false
            currentValue = newValue
        } else {
            currentValue += newValue
        }
        calculationDisplay.setText(currentValue)
    }

    // label group that holds string values for calculations
    @IBOutlet weak var calculationDisplay: WKInterfaceLabel!
    
    
    //button group and actions
    @IBAction func button1tapped() {
        numberPressed(value: 1)
    }
    
    @IBAction func button2tapped() {
        numberPressed(value: 2)
    }
    
    @IBAction func button3tapped() {
        numberPressed(value: 3)
    }
    
    @IBAction func button4tapped() {
        numberPressed(value: 4)
    }
    
    @IBAction func button5tapped() {
        numberPressed(value: 5)
    }
    
    @IBAction func button6tapped() {
        numberPressed(value: 6)
    }
    
    @IBAction func button7tapped() {
        numberPressed(value: 7)
    }
    
    @IBAction func button8tapped() {
        numberPressed(value: 8)
    }
    
    @IBAction func button9tapped() {
        numberPressed(value: 9)
    }
    
    @IBAction func button0tapped() {
        numberPressed(value: 0)
    }
    
    @IBAction func decimalTapped() {
        //check if decimal is present
        //only want to have one per number
        if currentValue.range(of: ".") == nil{
            currentValue += "."
            calculationDisplay.setText(currentValue)
        }
    }
    
    func commandTapped(type: CommandType){
        calcExecuted = false
        if command != nil {
            command!.type = type
        } else {
            command = Command(type: type, oldValue: (currentValue as NSString).doubleValue)
            currentValue = "0"
        }
    }
    
    @IBAction func addTapped() {
        commandTapped(type: .Add)
    }
    
    @IBAction func subtractTapped() {
        commandTapped(type: .Subtract)
    }
    
    @IBAction func multiplyTapped() {
        commandTapped(type: .Multiply)
    }
    
    @IBAction func divideTapped() {
        commandTapped(type: .Divide)
    }
    
    func setDisplayValue(value: Double){
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            currentValue = "\(Int(value))"
        } else {
            currentValue = "\(value)"
        }
        calculationDisplay.setText(currentValue)
    }
   
    @IBAction func answerTapped() {
        if command != nil {
            let answer = command!.executeWithNewValue(newValue: (currentValue as NSString).doubleValue)
            setDisplayValue(value: answer)
            command = nil
            calcExecuted = true
        }
    }
    
    @IBAction func clearValue(_ sender: Any) {
        setDisplayValue(value: 0)
    }
    
}

