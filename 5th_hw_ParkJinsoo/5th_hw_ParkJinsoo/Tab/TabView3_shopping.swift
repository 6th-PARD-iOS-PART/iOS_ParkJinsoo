//
//  TabViewShopping.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/27/25.
//
import SwiftUI

struct TabView3_shopping: View {
    @State private var selectedCategory: String = "모두"
    
    var body: some View {
            ScrollView{
                VStack{
                    Row1_tossshopping()
                    Row2_buttonview(selectedCategory: $selectedCategory)
                    if selectedCategory == "모두" {
                        Row3_bread()
                        Row4_onedayprice()
                        Row5_productoftoday()
                    }
                    CategoryView(category: selectedCategory)
                    
            
                    
                } //VStack
            } //ScrollView
                
        
        
        
        


    }
}

#Preview {
    TabView3_shopping()
}

