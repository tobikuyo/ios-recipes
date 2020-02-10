//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Tobi Kuyoro on 10/02/2020.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeInstructions: UITextView!
    
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: -View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Methods
    
    func updateViews() {
        guard let recipe = recipe else { return }
        
        recipeName.text = recipe.name
        recipeInstructions.text = recipe.instructions
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
