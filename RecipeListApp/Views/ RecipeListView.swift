//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 10.08.22.
//

import SwiftUI

struct RecipeListView: View {
    
    //reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes){ r in
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    //MARK: row item
                    HStack(spacing: 15.0){
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70, alignment: .center)
                            .clipped()//clip image that are outside of the frame
                            .cornerRadius(5.0)
                        
                        Text(r.name)
                    }
                }

                
                    
            }.navigationBarTitle("All Recipes")
        }.navigationViewStyle(.stack)
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
