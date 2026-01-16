//
//  ViewController.swift
//  Timer
//
//  Created by GEU on 05/01/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer : Timer?
    var remainingSeconds : Int = 0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tenMinute(_ sender: Any) {
        setTime(10)
    }
    @IBAction func fifteenMinute(_ sender: Any) {
        setTime(15)
    }
    @IBAction func thirtyMinute(_ sender: Any) {
        setTime(30)
    }
    func setTime(_ minutes: Int){
        stopTimer()
        remainingSeconds = minutes * 60
        updateLabel()
    }
   
    func updateLabel(){
        let min  = remainingSeconds / 60
        let sec = remainingSeconds % 60
        timerLabel.text = String(format: "%d:%d", min, sec)
    }
    @IBAction func Start(_ sender: Any) {
        guard !isRunning else { return }

        isRunning = true
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
            }
    @IBAction func Stop(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    @IBAction func Pause(_ sender: Any) {
        timer?.invalidate()
        isRunning = false
    }
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    @objc func updateTimer() {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
        
    
}
