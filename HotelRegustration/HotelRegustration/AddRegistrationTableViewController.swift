//
//  AddRegistrationTableViewController.swift
//  guestRegistration
//
//  Created by GEU on 12/01/26.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var roomTypeLabel: UILabel!
    var roomType: RoomType?
    
    enum Section: Int, CaseIterable {
        case dates
        case guests
        case wifi
        case roomType
        case charges
    }
    
    let checkInDateCellIndexPath =
        IndexPath(row: 0, section: 1)

    let checkInDatePickerCellIndexPath =
        IndexPath(row: 1, section: 1)

    let checkOutDateCellIndexPath =
        IndexPath(row: 2, section: 1)

    let checkOutDatePickerCellIndexPath =
        IndexPath(row: 3, section: 1)

    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }

    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkOutDatePicker.minimumDate = midnightToday
        checkInDatePicker.isHidden = true
        checkOutDatePicker.isHidden = true
        updateDateViews()
        updateNumberOfGuests()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath == checkInDatePickerCellIndexPath {
            return isCheckInDatePickerVisible ? 216 : 0
        }

        if indexPath == checkOutDatePickerCellIndexPath {
            return isCheckOutDatePickerVisible ? 216 : 0
        }

        return UITableView.automaticDimension
    }

    /*override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }

        switch section {
        case .dates:
            return 4
        case .guests:
            return 2
        case .wifi:
            return 1
        case .roomType:
            return 1
        case .charges:
            return 4
        }
    }*/
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(rawValue: section) else { return nil }
        return section == .charges ? "CHARGES" : nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateRoomType()
        updateCharges()
    }
    
    /*override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if Section(rawValue: indexPath.section) == .charges {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
            var content = cell.defaultContentConfiguration()

            switch indexPath.row {
            case 0:
                content.text = "Number of Nights"
                content.secondaryText = "\(numberOfNights)"
            case 1:
                content.text = "Room"
                content.secondaryText = "$\(roomCharge)"
            case 2:
                content.text = "Wi-Fi"
                content.secondaryText = "$\(wifiCharge)"
            case 3:
                content.text = "Total"
                content.secondaryText = "$\(totalCharge)"
                content.textProperties.font = .boldSystemFont(ofSize: 17)
            default:
                break
            }

            cell.contentConfiguration = content
            return cell
        }

        return super.tableView(tableView, cellForRowAt: indexPath)
    }*/
    
    var registration: Registration? {
        guard let roomType = roomType else { return nil }
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        return Registration(
            firstName: firstName,
            lastName: lastName,
            email: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren,
            wifi: hasWifi,
            roomType: roomType
        )
    }
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = checkInDatePicker.date
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text =
            "\(Int(numberOfAdultsStepper.value))"
        
        numberOfChildrenLabel.text =
            "\(Int(numberOfChildrenStepper.value))"
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func updateCharges() {
        let indexPaths = [
            IndexPath(row: 0, section: Section.charges.rawValue),
            IndexPath(row: 1, section: Section.charges.rawValue),
            IndexPath(row: 2, section: Section.charges.rawValue),
            IndexPath(row: 3, section: Section.charges.rawValue)
        ]
        tableView.reloadRows(at: indexPaths, with: .none)
    }
    var numberOfNights: Int {
        Calendar.current.dateComponents(
            [.day],
            from: checkInDatePicker.date,
            to: checkOutDatePicker.date
        ).day ?? 0
    }

    var roomCharge: Int {
        guard let roomType else { return 0 }
        return numberOfNights * roomType.price
    }

    var wifiCharge: Int {
        wifiSwitch.isOn ? numberOfNights * 10 : 0
    }

    var totalCharge: Int {
        roomCharge + wifiCharge
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
        updateCharges()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        updateCharges()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == checkInDateCellIndexPath {
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible = false
        }
        if indexPath == checkOutDateCellIndexPath {
            isCheckOutDatePickerVisible.toggle()
            isCheckInDatePickerVisible = false
        }
        tableView.beginUpdates()
        tableView.endUpdates()
        updateCharges()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomTypeSegue" {
            let navController = segue.destination as! UINavigationController
            let selectRoomTypeVC =
            navController.topViewController
            as! SelectRoomTypeTableViewController
            selectRoomTypeVC.delegate = self
            selectRoomTypeVC.roomType = roomType
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension AddRegistrationTableViewController:
    SelectRoomTypeTableViewControllerDelegate {
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType
    ) {
        self.roomType = roomType
        updateRoomType()
        updateCharges()
        navigationController?.popViewController(animated: true)
    }
}
