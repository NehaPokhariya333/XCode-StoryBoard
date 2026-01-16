//
//  AthleteTableViewController.swift
//  FavAthletes
//
//  Created by GEU on 13/01/26.
//

import UIKit

class AthleteTableViewController: UITableViewController {

    // MARK: - Properties
    var athletes: [Athlete] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "AthleteCell", for: indexPath)

        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description

        return cell
    }

    // MARK: - Segues

    // Add Athlete segue
    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormViewController? {
        return AthleteFormViewController(coder: coder, athlete: nil)
    }

    // Edit Athlete segue
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {

        let athleteToEdit: Athlete?

        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            athleteToEdit = athletes[indexPath.row]
        } else {
            athleteToEdit = nil
        }

        return AthleteFormViewController(coder: coder, athlete: athleteToEdit)
    }

    // MARK: - Unwind Segue
    @IBAction func unwindToAthleteTableView(_ segue: UIStoryboardSegue) {
        guard
            let sourceVC = segue.source as? AthleteFormViewController,
            let athlete = sourceVC.athlete
        else { return }

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = athlete
        } else {
            athletes.append(athlete)
        }

        tableView.reloadData()
    }
}

