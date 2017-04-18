//
//  ViewController.swift
//  HomeAutomation
//
//  Created by Nakul on 15/03/17.
//  Copyright © 2017 GetThisDone. All rights reserved.
//

import UIKit
import RAMPaperSwitch
import Firebase

class ViewController: UIViewController {
    
    
    var DataTaken = [AnyObject]()
    @IBOutlet weak var Switch: RAMPaperSwitch!
    @IBOutlet weak var Led2: UIView!
    @IBOutlet weak var Switch2: RAMPaperSwitch!
    @IBOutlet weak var Switch3: RAMPaperSwitch!
    @IBOutlet weak var Switch4: RAMPaperSwitch!
    @IBOutlet weak var Led3: UIView!
    @IBOutlet weak var Led1: UIView!
    @IBOutlet weak var Led4: UIView!
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image3: UIImageView!
    @IBOutlet weak var Image4: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let rootRef = FIRDatabase.database().reference().child("Leds")
         
        self.Switch.animationDidStartClosure = {(onAnimation: Bool) in
            UIView.transition(with: self.Image, duration: self.Switch.duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.Image.image = UIImage(named: !onAnimation ? "lightbulb-2-64-3.png" : "lightbulb-2-64-6.png")
                self.Switch.thumbTintColor = !onAnimation ? UIColor(red: 68/256, green: 193/256, blue: 251/256, alpha: 1.0) : UIColor.white
                let changer = onAnimation ? "On" : "Off"
                rootRef.updateChildValues(["Led1": changer])
                
            }, completion:nil)
        }
        self.Switch2.animationDidStartClosure = {(onAnimation: Bool) in
            UIView.transition(with: self.Image, duration: self.Switch.duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                    self.Image2.image = UIImage(named: !onAnimation ? "lightbulb-2-64-2.png" : "lightbulb-2-64-6.png")
                self.Switch2.thumbTintColor = !onAnimation ? UIColor(red: 224/256, green: 64/256, blue: 6/256, alpha: 1.0) : UIColor.white
                let changer = onAnimation ? "On" : "Off"
                rootRef.updateChildValues(["Led2": changer])
                //self.Led1.backgroundColor = onAnimation ? UIColor.white : UIColor.blue
            }, completion:nil)
        }
        self.Switch3.animationDidStartClosure = {(onAnimation: Bool) in
            UIView.transition(with: self.Image, duration: self.Switch.duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                    self.Image3.image = UIImage(named: !onAnimation ? "lightbulb-2-64-5.png" : "lightbulb-2-64-6.png")
                    self.Switch3.thumbTintColor = !onAnimation ? UIColor(red: 255/256, green: 165/256, blue: 2/256, alpha: 1.0) : UIColor.white
                let changer = onAnimation ? "On" : "Off"
                rootRef.updateChildValues(["Led3": changer])
                //self.Led1.backgroundColor = onAnimation ? UIColor.white : UIColor.blue
            }, completion:nil)
        }
        self.Switch4.animationDidStartClosure = {(onAnimation: Bool) in
            UIView.transition(with: self.Image, duration: self.Switch.duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                
                    self.Image4.image = UIImage(named: !onAnimation ? "lightbulb-2-64-4.png" : "lightbulb-2-64-6.png")
                self.Switch4.thumbTintColor = !onAnimation ? UIColor(red: 166/256, green: 215/256, blue: 133/256, alpha: 1.0) : UIColor.white
                let changer = onAnimation ? "On" : "Off"
                rootRef.updateChildValues(["Led4": changer])
                }, completion:nil)
                //self.Led1.backgroundColor = onAnimation ? UIColor.white : UIColor.blue
        }

        
        self.Led1.layer.cornerRadius = 8
        self.Led2.layer.cornerRadius = 8
        self.Led3.layer.cornerRadius = 8
        self.Led4.layer.cornerRadius = 8
        
        rootRef.observe(.value) {
            (snap: FIRDataSnapshot) in
            if(((snap.value as AnyObject)["Led1"] as! String) == "On")
            {
                self.Switch.setOn(true, animated: true)
            }
            
            else{
                self.Switch.setOn(false, animated: true)
            }
            if(((snap.value as AnyObject)["Led2"] as! String) == "On")
            {
                self.Switch2.setOn(true, animated: true)
            }
                
            else{
                self.Switch2.setOn(false, animated: true)
            }
            if(((snap.value as AnyObject)["Led3"] as! String) == "On")
            {
                self.Switch3.setOn(true, animated: true)
            }
                
            else{
                self.Switch3.setOn(false, animated: true)
            }
            if(((snap.value as AnyObject)["Led4"] as! String) == "On")
            {
                self.Switch4.setOn(true, animated: true)
            }
                
            else{
                self.Switch4.setOn(false, animated: true)
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

