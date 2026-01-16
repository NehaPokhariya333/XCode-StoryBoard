//
//  ViewController.swift
//  Login
//
//  Created by GEU on 14/01/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    @IBOutlet weak var forgotUsername: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
    }
    @IBAction func forgotUsernameTapped(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: sender)
    }

    @IBAction func forgotPasswordTapped(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let button = sender as? UIButton else {
            return
        }
        if (button == forgotPassword) {
            segue.destination.navigationItem.title = "Forgot Password"
            
        }
        else if (button == forgotUsername) {
            segue.destination.navigationItem.title = "Forgot Username"
            
        }
        else{
            segue.destination.navigationItem.title = Username.text
        }
    }


}


