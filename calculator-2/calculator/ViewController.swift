//
//  ViewController.swift
//  calculator
//
//  Created by GEU on 30/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    var current: Double = 0
    var previous: Double = 0
    var operation = ""
    var newInput = true

    @IBOutlet weak var output: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        output.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        switch sender.tag {
        case 16:
            output.text = "0"
            current = 0
            previous = 0
            operation = ""
            newInput = true
        case 17:
            current = -current
            output.text = String(current)
        case 18:
            current = current / 100
            output.text = String(current)
        case 19:
            if output.text?.contains(".") == false {
                output.text! += "."
                newInput = false
            }
        case 11,12,13,14:
            previous = current
            operation = ["11":"÷","12":"×","13":"-","14":"+"][String(sender.tag)]! ?? ""
            newInput = true
        case 15:
            switch operation {
            case "÷":
                current = previous / current
            case "×":
                current = previous * current
            case "-":
                current = previous - current
            case "+":
                current = previous + current
            default:
                break
            }
            output.text = String(current)
            newInput = true
        default:
            break
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let value = sender.tag
        if newInput {
            output.text = String(value)
            newInput = false
        }
        else {
            output.text! += String(value)
        }
        current = Double(output.text!) ?? 0
    }
    
}
