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
        case equal = "="
        case empty = "empty"
        
    }
    
    
    var btnSound: AVAudioPlayer!
    
    @IBOutlet var outputLevel: UILabel!
    
    var currentOperation = Operation.empty
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    
    
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
    
        btnSound.play()
        runningNumber = "\(btn.tag)"
        outputLevel.text = runningNumber
    }
    
    @IBAction func dividePressed(sender: AnyObject) {
        
    }
    
    @IBAction func MultiplyPressed(sender: AnyObject) {
        
    }
    @IBAction func SubtractPressed(sender: AnyObject) {
        
    }
    @IBAction func additionPressed(sender: AnyObject) {
        
    }
    @IBAction func equalPressed(sender: AnyObject) {
        
    }
    
    

}

