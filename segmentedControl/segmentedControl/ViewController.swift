//
//  ViewController.swift
//  segmentedControl
//
//  Created by GEU on 29/09/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        color()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func red(_ sender: Any) {
        color()
    }
    
    @IBAction func green(_ sender: Any) {
        color()
    }
    
    fileprivate func color() {
        view.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    
    @IBAction func blue(_ sender: Any) {
        color()
    }
    
    @IBAction func reset(_ sender: Any) {
        redSlider.value = 0
        blueSlider.value = 0
        greenSlider.value = 0
        color()
    }
    
}

