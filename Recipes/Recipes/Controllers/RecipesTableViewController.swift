//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Tobi Kuyoro on 10/02/2020.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var recipes: [Recipe] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeDetailShowSegue" {
            if let recipeDetailVC = segue.destination as? RecipeDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                recipeDetailVC.recipe = recipes[indexPath.row]
            }
        }
    }
}
