//
//  TabViewShopping.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/27/25.
//
import SwiftUI

struct TabView3_shopping: View {
    @State private var path = NavigationPath()
    @State private var selectedCategory: String = "모두"
    
    var body: some View {
        NavigationStack(path: $path){
            ScrollView{
                VStack{
                    Row1_tossshopping()
                    Row2_buttonview(selectedCategory: $selectedCategory,path: $path)
                    Row3_bread()
                    Row4_onedayprice()
                    Row5_productoftoday()
                    
                    
                    
                } //VStack
            } //ScrollView

                        
            .navigationDestination(for: String.self){ category in
                TabView3_1_Main(path: $path,selectedCategory: $selectedCategory)
            } //navigationDestination
        } //NavigationStack
                
        
        
        
        


    }
}

#Preview {
    TabView3_shopping()
}

