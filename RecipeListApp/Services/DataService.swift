//
//  DataService.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 12.08.22.
//

import Foundation

class DataService{
    
    //MARK: parse local json file
    static func getLocalData() -> [Recipe]{
        
        /*
         static - we dont need to create instance of it .static keyword turns this method into static method or a type method
         a type method as like a data type method.because DataService is a data type.
         instead of calling get local data on an instance of data service,when you turn it into a type method directly on the data type
         */
        
        // 1.Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json") //this gives us optional string
        
        //check if pathString is not nil,otherwise...
        guard pathString != nil else{
            return [Recipe]() //because there is no point to continuing if we cant find the path to data
        }
        // 2.Create a url object
        let url = URL(fileURLWithPath: pathString!) //we have to unwrap it.we check above is not nil we can safely unwrap it
        
        do{
            // 3.Create a data object
            let data = try Data(contentsOf: url) //because this potentially throws an error
            
            // 4.Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data) //self - we are passing a type in as a parameter,to refer data type
                // 5.Add the unique IDs
                for r in recipeData{
                    r.id = UUID()
                }
                // 6.FINAL - Return the list of recipes
                return recipeData
            }catch{
                // error with parsing json
                print(error)
            }
        }catch{
            //error with getting data
            print(error)
        }
        return [Recipe]()
    }
}
