//
//  TabView1_2_Main.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//

import SwiftUI

struct TabView1_2_Main: View {
    @Binding var path: NavigationPath
    @Environment(MoneyContainer.self) var moneyContainer //environment에서 가져옴
    
    var body: some View {

            ZStack{
                Color.white.ignoresSafeArea()
                ScrollView{
                    VStack(spacing:0){
                        
                        Row1_managebank(path: $path)
                        Row2_bank()
                        Row3_currentmoney()
                        Row4_send(path: $path)
                        Row5_thunder()
                        Row6_all()
                        Row7_payhistory()
                        
                    } //VStack
                } //ScrollView
            } //ZStack
        .navigationBarHidden(true)

    }
}

#Preview {
    TabView1_2_Main(path: .constant(NavigationPath()))
        .environment(MoneyContainer())
}

