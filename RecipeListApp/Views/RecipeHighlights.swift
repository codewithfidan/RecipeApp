//
//  RecipeHighlights.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 22.08.22.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = " "
    
    init(highlights: [String]){
        
        //loop through the highlights and build the string
        for index in 0..<highlights.count{
            //if this is the last item ,dont add comma
            if index == highlights.count - 1{
                allHighlights += highlights[index]
            }else{
                allHighlights += highlights[index] + ", "
            }
        }
        
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: [])
    }
}
