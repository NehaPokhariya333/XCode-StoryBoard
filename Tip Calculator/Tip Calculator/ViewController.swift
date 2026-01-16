import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    
    override func viewDidLoad() {
            super.viewDidLoad()

            billTextField.keyboardType = .decimalPad
            tipSegment.selectedSegmentIndex = 0

            tipAmountLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }

    @IBAction func billEditingChanged(_ sender: UITextField) {
        calculateTip()
    }

        @IBAction func tipChanged(_ sender: UISegmentedControl) {
            calculateTip()
        }

        @IBAction func resetTapped(_ sender: UIButton) {
            billTextField.text = ""
            tipSegment.selectedSegmentIndex = 0
            tipAmountLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }

        func calculateTip() {
            let billAmount = Double(billTextField.text ?? "") ?? 0.0

            // READ TIP % FROM SEGMENT TITLE
            let selectedTitle = tipSegment.titleForSegment(
                at: tipSegment.selectedSegmentIndex
            ) ?? "0%"

            let percentValue = selectedTitle.replacingOccurrences(of: "%", with: "")
            let tipPercentage = (Double(percentValue) ?? 0) / 100

            let tip = billAmount * tipPercentage
            let total = billAmount + tip

            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
    }
