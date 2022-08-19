//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 12.08.22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var selectedServingSize = 2
    var  recipe:Recipe
    /*  i am not going to set this property to any particular instance right now, because i am going to rely on the list view to assign the particular recipe that we want to use.to display the ui.that is why this is going to be unset right now.it is gonna determined by what the user tabs on in the view list.
     */
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing:5){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                //MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top,20)
                    .font(.largeTitle)
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 160)
                }.padding(.vertical)
                
                VStack(alignment: .leading){
                    
                    //MARK: Ingredients
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)//we dont need id: \.self because ingredients is identifiable object
                    ForEach(recipe.ingredients){item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                    }
                }
                Divider()
                
                //MARK: Directions
                Text("Directions")
                    .font(.headline)
                    .padding(.bottom, 5.0)
                ForEach(0..<recipe.directions.count, id: \.self){index in
                    Text(String(index+1) + ". " + recipe.directions[index])
                        .padding(3.0)
                }
            }.padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
