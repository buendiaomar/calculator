//
//  ViewController.swift
//  calculator
//
//  Created by Consultant on 2/18/22.
//

import UIKit

var numberOnScreen: Double = 0
var previousNumber:Double = 0
var performingMath = false
var operation = 0


class ViewController: UIViewController {

    //Label for the numbers
    @IBOutlet weak var label: UILabel!
    
    
    //Function to handle numbers buttons
    @IBAction func numbers(_ sender: UIButton) {
        
        //Eval if is a Math operation
        if performingMath == true {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }else {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    
    // Function to handle Operations buttons
    @IBAction func buttons(_ sender: UIButton) {
        
        // Check if there is not number on the screen and the button pressend isn't C or equal
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            //save the number on screen in previous number and choose the operation
            
            previousNumber = Double(label.text!)!
            
            
            if sender.tag==12 {
                label.text = "/"
            }
            if sender.tag==13 {
                label.text = "*"
            }
            if sender.tag==14 {
                label.text = "-"
            }
            if sender.tag==15 {
                label.text = "+"
            }
            
            //ojo abajo
            if sender.tag==18 {
                label.text = "+/-"
            }
            
            if sender.tag==19 {
                label.text = "%"
                
            }
            
            if sender.tag==17 {
                label.text = "."
                decimalClicked(sender.tag)
            }
            //ojo arriba
            
            operation = sender.tag
            performingMath = true
            
        } else if sender.tag == 16 {
            
            
            if operation == 12 {
                label.text = String(previousNumber/numberOnScreen)
            }
            if operation == 13 {
                label.text = String(previousNumber*numberOnScreen)
            }
            if operation == 14 {
                label.text = String(previousNumber-numberOnScreen)
            }
            if operation == 15 {
                label.text = String(previousNumber+numberOnScreen)
            }
            if operation == 18 {
                label.text = String(numberOnScreen * -1)
            }
            if operation == 19 {
                label.text = String(numberOnScreen/100)
            }
            
            
         } else if sender.tag == 11 {
             resetValues()
         }
            
    }
    
    
    
    
  //Functions
    
    
    //Reset values
    func resetValues(){
        label.text = ""
        previousNumber=0
        numberOnScreen=0
        operation=0
    }
    
    func decimalClicked(_ tag:Int){
        
            
        if operation == 17 {
            numberOnScreen = 0
            //var decimalPlace:Int = 1
             
        }
    }
        
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}



