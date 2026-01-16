//
//  MealTrackerTableViewController.swift
//  mealTracker
//
//  Created by GEU on 06/01/26.
//

import UIKit

class MealTrackerTableViewController: UITableViewController {
    
    var meals: [Meal] = {
        let breakfastFoods = [
            Food(name: "Idli", description: "Steamed rice cakes"),
            Food(name: "Upma", description: "Semolina breakfast dish"),
            Food(name: "Tea", description: "Hot Indian tea")
        ]

        let lunchFoods = [
            Food(name: "Dal Rice", description: "Lentils with steamed rice"),
            Food(name: "Paneer Curry", description: "Cottage cheese gravy"),
            Food(name: "Buttermilk", description: "Spiced yogurt drink")
        ]

        let dinnerFoods = [
            Food(name: "Chapati", description: "Whole wheat flatbread"),
            Food(name: "Mixed Vegetables", description: "Seasonal vegetables"),
            Food(name: "Fruit Bowl", description: "Fresh fruits")
        ]

        let breakfast = Meal(name: "Breakfast", food: breakfastFoods)
        let lunch = Meal(name: "Lunch", food: lunchFoods)
        let dinner = Meal(name: "Dinner", food: dinnerFoods)

        return [breakfast, lunch, dinner]
    }()

    @IBAction func editButtonTapped(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let foodItem = meal.food[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = foodItem.name
        content.secondaryText = foodItem.description
        cell.contentConfiguration = content
        cell.showsReorderControl = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                                titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
    override func tableView(_ tableView: UITableView,
                                didSelectRowAt indexPath: IndexPath) {
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        let alert = UIAlertController(
                title: food.name,
                message: food.description,
                preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .none
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        guard fromIndexPath.section == to.section else {
            tableView.reloadData()
            return
        }
        var foods = meals[fromIndexPath.section].food
        let movedFood = foods.remove(at: fromIndexPath.row)
        foods.insert(movedFood, at: to.row)
        meals[fromIndexPath.section] = Meal(name: meals[fromIndexPath.section].name, food: foods)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
