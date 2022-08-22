//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 10.08.22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                Text("All Recipes")
                    .bold()
                    .padding(.top,40)
                    .font(.largeTitle)
                ScrollView{
                    LazyVStack(alignment:.leading){
                        //creating items only as needed.
                        ForEach(model.recipes){ r in
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
                                    VStack(alignment: .leading){
                                        Text(r.name).bold()
                                        RecipeHighlights(highlights: r.highlights)
                                    }.foregroundColor(.black)
                                    
                                }
                            }
                        }.navigationBarHidden(true)
                    }
                }
            }.padding(.leading)
        }.navigationViewStyle(.stack)
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}

/**
 lazyVStack is better than VStack because it only creates elements or renders them as needed.
 imagine you have so many rows and the majority of rows are off the screen - with VStack it might allocate memory for all of those items ans render them even though you cant see them,whereas LazyVStack  will only render the objects and allocate memory as they are being scrolled into view as they are needed
 */
/*
 reference the view model
 @ObservedObject var model = RecipeModel()
 @ObservedObject is simply to get changes when recipeModel changes
 */


/*
 
 You can use ForEach inside of a scroll view to display items in a scrollable list! You can edit alignment, spacing, etc. with modifiers
 ScrollView {
   ForEach(...) { ... }
 }
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
 .listStyle(PlainListStyle())
 }.navigationViewStyle(.stack)
 */
