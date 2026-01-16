//
//  ViewController.swift
//  Traffic_Lights
//
//  Created by GEU on 06/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToRed(unwindToSegue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, Sender: Any?){
        segue.destination.navigationItem.title = textField.text
    }


}

