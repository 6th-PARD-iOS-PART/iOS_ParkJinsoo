//
//  TabView3_1_Main.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//

import SwiftUI

struct TabView3_1_Main: View {
    @Binding var path: NavigationPath
    @Binding var selectedCategory: String
    
    var body: some View {
            ScrollView{
                VStack{
                    Row1_tossshopping()
                    Row2_buttonview(selectedCategory: $selectedCategory, path: $path)
                    CategoryView(category: selectedCategory)
                    
                    
                } //VStack
            } //ScrollView
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .navigationBar)
            
            

    }
}

#Preview {
    TabView3_1_Main(path: .constant(NavigationPath()),
    selectedCategory: .constant("모두"))
}


