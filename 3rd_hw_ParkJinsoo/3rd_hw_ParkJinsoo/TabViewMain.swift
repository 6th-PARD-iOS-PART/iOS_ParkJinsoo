//
//  TabViewMain.swift
//  3rd_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/8/25.
//
import SwiftUI

struct TabViewMain: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            ContentView()
            .tabItem {
                Image("홈")
                    .renderingMode(.template)
                Text("홈")
            }.tag(0)
            
            TabViewSecond()
            .tabItem {
                Image("혜택")
                    .renderingMode(.template)
                Text("혜택")
            }.tag(1)
            
            TabViewThird()
            .tabItem {
                Image("토스쇼핑")
                    .renderingMode(.template)
                Text("토스쇼핑")
            }.tag(2)

            TabViewFourth()
            .tabItem {
                Image("증권")
                    .renderingMode(.template)
                Text("증권")
            }.tag(3)

            TabViewFifth()
            .tabItem {
                Image("전체")
                    .renderingMode(.template)
                Text("전체")
            }.tag(4)
        }
    }
}

#Preview {
    TabViewMain()
}

