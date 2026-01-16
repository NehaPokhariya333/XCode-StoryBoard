//
//  ViewController.swift
//  programaticalSegue
//
//  Created by GEU on 14/01/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segueSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func yellowButtonTapped(sender: Any){
        if segueSwitch.isOn {
            performSegue(withIdentifier: "Yellow", sender: nil)
        }
    }
    @IBAction func greenButtonTapped(sender: Any){
        if segueSwitch.isOn {
            performSegue(withIdentifier: "Green", sender: nil)
        }
    }


}

