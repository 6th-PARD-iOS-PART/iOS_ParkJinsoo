//
//  TabView1_3_Main.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct TabView1_3_Main: View {
    @Binding var path: NavigationPath
    @Environment(InfoContainer.self) var infoContainer //environment에서 가져옴
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            
            ScrollView{
                VStack(spacing:0){
                    Row1_where(path: $path)
                    Row2_inputbank()
                    Row3_mybank()
                    Row4_accountlist(path: $path)
                    
                } //VStackAll
            } //ScrollView
        } //ZStack

        .navigationBarHidden(true)
    }
}

#Preview {
    TabView1_3_Main(path: .constant(NavigationPath()))
        .environment(InfoContainer())
}
