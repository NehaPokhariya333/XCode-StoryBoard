//
//  ViewController.swift
//  Timerr
//
//  Created by GEU on 05/01/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var preTimer: UISegmentedControl!

    var timer: Timer?
    var remainingSeconds: Int = 0
    var isRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

    func setupInitialState() {
        preTimer.selectedSegmentIndex = 0
        setGivenTime()
        updateTimerLabel()
    }

    @IBAction func GivenDuration(_ sender: UISegmentedControl) {
        stopTimer()
        setGivenTime()
    }

    func setGivenTime() {
        let minutes: Int

        switch preTimer.selectedSegmentIndex {
        case 0:
            minutes = 10
        case 1:
            minutes = 15
        case 2:
            minutes = 30
        default:
            minutes = 0
        }

        remainingSeconds = minutes * 60
        updateTimerLabel()
    }

    @IBAction func start(_ sender: Any) {
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

    @IBAction func pause(_ sender: Any) {
        timer?.invalidate()
        isRunning = false
    }

    @IBAction func stop(_ sender: Any) {
        stopTimer()
        setGivenTime()
    }

    @objc func updateTimer() {
        guard remainingSeconds > 0 else {
            stopTimer()
            return
        }

        remainingSeconds -= 1
        updateTimerLabel()
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }

    func updateTimerLabel() {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}
