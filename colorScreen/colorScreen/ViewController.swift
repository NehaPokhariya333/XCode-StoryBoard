//
//  ViewController.swift
//  colorScreen
//
//  Created by GEU on 27/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    let colors: [UIColor] = [.white, .red, .green, .blue]
    let colorNames = ["White", "Red", "Green", "Blue"]
    
    var currentIndex = 0
    
    @IBOutlet weak var colorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = colors[currentIndex]
        
        
        let nextIndex = (currentIndex + 1) % colors.count
        colorButton.setTitle("\(colorNames[nextIndex])", for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        currentIndex = (currentIndex + 1) % colors.count
        view.backgroundColor = colors[currentIndex]
        
        
        let nextIndex = (currentIndex + 1) % colors.count
        colorButton.setTitle("\(colorNames[nextIndex])", for: .normal)
    }
}
