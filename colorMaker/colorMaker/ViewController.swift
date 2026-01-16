//
//  ViewController.swift
//  colorMaker
//
//  Created by GEU on 04/09/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var red: UITextField!
    @IBOutlet weak var green: UITextField!
    @IBOutlet weak var blue: UITextField!
    @IBOutlet weak var generatedColour: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generate(_ sender: Any) {
        let redcolor = Double(red.text ?? "0") ?? 0
        let greencolor = Double(green.text ?? "0") ?? 0
        let bluecolor = Double(blue.text ?? "0") ?? 0
        generatedColour.backgroundColor = UIColor(red: CGFloat(redcolor)/255, green: CGFloat(greencolor)/255, blue: CGFloat(bluecolor)/255, alpha: 1)
    }
    @IBAction func reset(_ sender: Any) {
        red.text = ""
        green.text = ""
        blue.text = ""
        generatedColour.backgroundColor = .white
    }
    
}

