//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 17.08.22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top,40)
                .font(.largeTitle)
            
            GeometryReader{ geo in
                TabView(selection: $tabSelectionIndex){
                    //binding for preparation and highlights.whenever user switches tabs it is going to write information below
                    
                    // Loop through each recipe
                    ForEach(0..<model.recipes.count,  id: \.self){ index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured {
                            
                            // Recipe card button
                            Button {
                                //show the recipe detail sheet
                                self.isDetailViewShowing = true//when button is tapped, it is going to change $isDetailViewShowing = true and Show the  recipeDetailView
                            } label: {
                                // Recipe card
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            }
                            .sheet(isPresented: $isDetailViewShowing){
                                //it is going to be binding.it is 2 way communication because when the user dismisses that pop up card, we want to turn back $isDetailViewShowing to false.on the button tap we are going to change it to true
                                
                                //accept one parameter isPresented is boolean.if it is true it is going to allow you to show view.if it is false it is going to hide view.We can add the .sheet modifier to the button and modify the state property variable to determine if the sheet view should show or not.
                                
                                // Show the  recipeDetailView
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width/1.1, height: geo.size.height/1.14, alignment: .center)
                            .cornerRadius(15)
                            .padding(.bottom,30)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            //how am i going to know which recipe the user is looking at in the geometryReader and display appropriate preparationtime and highlights? we need access recipe instance.in the tab view we can capture the selected tab index that is going to tell us which recipe it is looking at. we have to declare state variable --> @State var tabSelectionIndex = 0 and add that parameter to TabView as a binding. whenever user switches tabs it is going to write information here. and also do tag the card
            VStack(alignment: .leading,spacing: 10){
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights:")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                //Text(model.recipes[tabSelectionIndex].highlights)
            }.padding([.leading,.bottom])
        }
        .onAppear { //this is a little later after initialization
            setFeaturedIndex()
        }
    }
    
    //findFirstFeaturedRecipeIndex
    func setFeaturedIndex(){
        //While the third option would find elements in an array that matches the search criteria, it would give us all the elements instead of only the first index.
        //find the index of first recipe that is featured
        let index = model.recipes.firstIndex { recipe -> Bool in
            return recipe.featured //this return int
        }
        //firstIndex where this condition is true
        tabSelectionIndex = index ?? 0
    }
    
}


struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
/*
 @ObservedObject var model = RecipeModel()
 if we instance recipe model in here. everytime we are creating a new instance of recipe model it goes and gets  self.recipes = DataService.getLocalData()
 and if we already have the data inside the list view why we would recreate it in the featuredview?
 and biggest problem is user interaction and user changes, now we have two sets of data, that is why we have to get 2 sets of data in sync, it really does not make sence to create a new model here
 */
