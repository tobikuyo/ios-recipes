//
//  RecipesController.swift
//  Recipes
//
//  Created by Tobi Kuyoro on 10/02/2020.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import Foundation

class RecipesController {
    var recipes: [Recipe] = []
    
    var recipesURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let recipesURL = documentsDir.appendingPathComponent("RecipesList.plist")
        
        return recipesURL
    }
    
    func saveToPersistentStore() {
        guard let recipesURL = recipesURL else { return }
        
        do {
            let recipesData = try PropertyListEncoder().encode(recipes)
            try recipesData.write(to: recipesURL)
        } catch {
            print("Error saving recipes: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let recipesURL = recipesURL else { return }
        
        do {
            let recipesData = try Data(contentsOf: recipesURL)
            let recipes = try PropertyListDecoder().decode([Recipe].self, from: recipesData)
            self.recipes = recipes
        } catch {
            print("Error loading recipes: \(error)")
        }
    }
}
