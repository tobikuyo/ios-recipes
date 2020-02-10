//
//  MainViewController.swift
//  Recipes
//
//  Created by Tobi Kuyoro on 10/02/2020.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Properties
    
    let recipesController = RecipeController()
    let networkClient = RecipesNetworkClient()
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableViewController?.recipes = self.filteredRecipes
        }
    }
    
    var recipesTableViewController: RecipesTableViewController? {
        didSet {
            recipesTableViewController?.recipes = self.filteredRecipes
        }
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkClient.fetchRecipes { (recipes, error) in
            if let error = error {
                NSLog("Error fetching recipes: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                if let recipes = recipes {
                    self.allRecipes = recipes
                }
            }
        }
        
        recipesController.saveToPersistentStore()
    }
    
    func filterRecipes() {
        guard let searchTerm = textField.text,
            !searchTerm.isEmpty else {
                filteredRecipes = allRecipes
                return
        }
        
        filteredRecipes = allRecipes.filter({ $0.name.contains(searchTerm) || $0.instructions.contains(searchTerm) })
    }
    
    @IBAction func doneEditing(_ sender: Any) {
        resignFirstResponder()
        filterRecipes()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipesEmbedSegue" {
            if let recipesTableVC = segue.destination as? RecipesTableViewController {
                recipesTableViewController = recipesTableVC
            }
        }
    }
}
