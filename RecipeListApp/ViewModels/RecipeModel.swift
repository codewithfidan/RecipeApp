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
    /*
     By making a method static, we don't need to create a new instance of the class/model it's in. We can just call it on the class itself
     static -> we can call this method without creating instance recipemodel
     ingredient:Ingredient -> gives us numerator,denumerator
     recipe servings size
     
     */
    
    static func getPortion(ingredient:Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""//to store the string hat we are going to return
        var numerator = ingredient.num ?? 1
        var denomerator = ingredient.denom ?? 1
        var wholePortions = 0
        /*
         ?? -> nil coalescing operator and it gives you an alternative if the optional happens to be nil. if ingredient.num is not nil it is going to assign it to numerator but it is nil it is going to take 1 instead
         */
        //if ingredient does not have a numerator or denumerator we have  to skip all steps
        if ingredient.num != nil{
            //we dont hav to use this variables numerator and denomerator , because they are never going to be nil. if they are nil it is going to assign 1 to numerator and denomerator
            
            //  Get a single serving size by multiplying demoninator by the recipe servings
            denomerator = denomerator * recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator = numerator *  targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(a: numerator, b: denomerator)
            numerator = numerator / divisor
            denomerator = denomerator / divisor
            
            // Get the whole portion if numerator> denominator
            if numerator >= denomerator{
                
                //calculate the wholeportions
                wholePortions = numerator / denomerator
                
                //calculate the remainder
                numerator = numerator % denomerator
                
                //assign to portion string
                portion = portion + String(wholePortions)
            }
            
            // Express the remainder as a fraction
            
            if numerator > 0{
                // Assign reminder as fraction to the portion string
                portion += wholePortions > 0 ? " " : "" //inline if statement -> if is is greater than zero ,then we want to add a space portion = " ",if it is not ,dont add it portion = ""
                portion += "\(numerator)/\(denomerator)"
            }
            
        }
        
        if var  unit = ingredient.unit{
           
            //if we need to pluralize
            if wholePortions >= 1{

                // calculate appropriate suffix
                if unit.suffix(2) == "ch"{
                    unit += "es"
                }else if unit.suffix(1) == "f"{
                    unit = String(unit.dropLast())
                    unit += "ves"
                }else{
                    unit += "s"
                }
                
            }
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
    }
}
