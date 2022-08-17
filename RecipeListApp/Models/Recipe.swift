//
//  Recipe.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 10.08.22.
//

import Foundation

class Recipe: Identifiable,Decodable{
    //Identifiable - let us work inside a swiftui list so you can work each element apart
    //Decodable - let us easily decode json data
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
}
class Ingredient: Identifiable, Decodable{
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
