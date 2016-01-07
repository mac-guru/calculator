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

    var btnSound: AVAudioPlayer!
    
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
    }
    
    

}

