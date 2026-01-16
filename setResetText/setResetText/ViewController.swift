//
//  ViewController.swift
//  setResetText
//
//  Created by GEU on 13/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setTheText(_ sender: Any) {
        text.text = "Hello hope this works"
    }
    
    @IBAction func resetTheText(_ sender: Any) {
        text.text = ""
    }
    
}

