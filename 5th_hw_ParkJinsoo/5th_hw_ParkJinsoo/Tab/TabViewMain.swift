//
//  TabViewMain.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/27/25.
//

import SwiftUI

struct TabViewMain: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            TabView1_home()
            .tabItem {
                Image("홈")
                    .renderingMode(.template)
                Text("홈")
            }.tag(0)
            
            TabView2_benefit()
            .tabItem {
                Image("혜택")
                    .renderingMode(.template)
                Text("혜택")
            }.tag(1)
            
            TabView3_shopping()
            .tabItem {
                Image("토스쇼핑")
                    .renderingMode(.template)
                Text("토스쇼핑")
            }.tag(2)

            TabView4_stock()
            .tabItem {
                Image("증권")
                    .renderingMode(.template)
                Text("증권")
            }.tag(3)

            TabView5_all()
            .tabItem {
                Image("전체")
                    .renderingMode(.template)
                Text("전체")
            }.tag(4)
        } //TabView
    }
}

#Preview {
    TabViewMain()
}

