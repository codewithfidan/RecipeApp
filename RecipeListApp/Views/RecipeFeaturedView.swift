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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
/*
 @ObservedObject var model = RecipeModel()
 if we instance recipe model in here. everytime we are creating a new instance of recipe model it goes and gets  self.recipes = DataService.getLocalData()
 and if we already have the data inside the list view why we would recreate it in the featuredview?
 and biggest problem is user interaction and user changes, now we have two sets of data, that is why we have to get 2 sets of data in sync, it really does not make sence to create a new model here
 */
