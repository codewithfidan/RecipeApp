//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 17.08.22.
//

import SwiftUI

struct RecipeFeaturedView: View {
  
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top,40)
                .font(.largeTitle)
                
            GeometryReader{ geo in
                TabView{
                    // Loop through each recipe
                    ForEach(0..<model.recipes.count,  id: \.self){ index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured {
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
            
            
            VStack(alignment: .leading,spacing: 10){
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights:")
                    .font(.headline)
                Text("Healthy")
            }.padding([.leading,.bottom])
        }
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
