//
//  ViewController.swift
//  Light
//
//  Created by GEU on 26/08/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lightButton: UIButton!
    var lightOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func updateUI() {
        if lightOn{
            view.backgroundColor = .white
            lightButton.setTitle("OFF", for: .normal)
        }
        else{
            view.backgroundColor = .black
            lightButton.setTitle("ON", for: .normal)
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
}
