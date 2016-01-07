//
//  ViewController.swift
//  Amrit Calculator
//
//  Created by amrit on 1/6/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum Operation: String {
        case divide = "/"
        case Multiply = "*"
        case subtraction = "-"
        case addition = "+"
        case empty = "empty"
        
    }
    
    
    var btnSound: AVAudioPlayer!
    
    @IBOutlet var outputLevel: UILabel!
    
    var currentOperation = Operation.empty
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        }
        catch let error as NSError{
            print(error.debugDescription)
        }
        
        
    }

    
    @IBAction func btnPresed(btn:UIButton!){
    
        playSound()
      
        runningNumber += "\(btn.tag)"
        outputLevel.text = runningNumber
    }
    
    @IBAction func dividePressed(sender: AnyObject) {
        processOperation(Operation.divide)
        
    }
    
    @IBAction func MultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
        
    }
    @IBAction func SubtractPressed(sender: AnyObject) {
        processOperation(Operation.subtraction)
        
    }
    @IBAction func additionPressed(sender: AnyObject) {
        processOperation(Operation.addition)
        
    }
    @IBAction func equalPressed(sender: AnyObject) {
        processOperation(currentOperation)
        
    }
    
    
    func processOperation(operate:Operation){
        
        playSound()
    
        if(currentOperation != Operation.empty){
            
            if(runningNumber != ""){
            
            rightValue = runningNumber
            runningNumber = ""
            
            if(currentOperation == Operation.Multiply){
                result = "\(Double(leftValue)! * (Double(rightValue))!)"
            }
            else if (currentOperation == Operation.divide){
                result = "\(Double(leftValue)! / (Double(rightValue))!)"
            }
            
            if(currentOperation == Operation.addition){
                result = "\(Double(leftValue)! + (Double(rightValue))!)"
            }
            else if (currentOperation == Operation.subtraction){
                result = "\(Double(leftValue)! - (Double(rightValue))!)"
            }
            
            leftValue = result
            outputLevel.text = result
            }
            
            currentOperation = operate
            
        
        }
        else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operate
        }
    
    }
    
    func playSound(){
        if btnSound.playing{
            btnSound.stop()
        }
        
        btnSound.play()
    }
    

}

