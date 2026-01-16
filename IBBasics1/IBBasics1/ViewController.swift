//
//  ViewController.swift
//  IBBasics1
//
//  Created by GEU on 25/08/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var labelfield: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonfield(_ sender: Any) {
        textfield.text = "Neha"
        labelfield.text = "Name:"
    }
    
}

