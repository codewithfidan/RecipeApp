//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 15.08.22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
       
        
        TabView{
            RecipeFeaturedView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }.environmentObject(RecipeModel())
}
/*
 instead of creating recipe model inside recipelistview,we have to move it up the view hierarchy and create recipe model in the recipetabview and whichever tab the user is looking at, recipetabview can pass that instance of recipe model to specific view.we only have maintain one instance of the recipe model and we are just passing it wherever we need it
 we have to add environment object modifier on some sort of parent view
 */
struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
}
