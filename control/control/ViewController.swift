//
//  ViewController.swift
//  control
//
//  Created by GEU on 13/10/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var Switch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: Any) {
        if Switch.isOn {
            print("Switch is On!")
        }
        else{
            print("Switch is Off!")
        }
        
        print(Slider.value)
    }

}
