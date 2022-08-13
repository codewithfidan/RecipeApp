//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 12.08.22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var  recipe:Recipe
    /*  i am not going to set this property to any particular instance right now, because i am going to rely on the list view to assign the particular recipe that we want to use.to display the ui.that is why this is going to be unset right now.it is gonna determined by what the user tabs on in the view list.
    */
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading){
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                Divider()
                Text("Ingredients")
                    .font(.headline)
                    .padding(.bottom, 5.0)
                ForEach(recipe.ingredients, id: \.self){item in
                    Text("• " + item)
                        .padding(.bottom, 3.0)
                }
                Divider()
                
                Text("Directions")
                    .font(.headline)
                    .padding(.bottom, 5.0)
                ForEach(0..<recipe.directions.count, id: \.self){index in
                    Text(String(index+1) + ". " + recipe.directions[index])
                        .padding(3.0)
                }
            }.padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass it into the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
