//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 10.08.22.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()

    init(){
        
        self.recipes = DataService.getLocalData() //without static DataService().getLocalData()
        
    }

}
