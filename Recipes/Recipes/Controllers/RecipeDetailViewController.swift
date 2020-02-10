//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Tobi Kuyoro on 10/02/2020.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
      // MARK: - Outlets
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeInstructions: UITextView!
    
      // MARK: - Properties
    
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Methods
    
    func updateViews() {
        guard isViewLoaded,
            let recipe = recipe else { return }
        
        recipeName.text = recipe.name
        recipeInstructions.text = recipe.instructions
    }
}
