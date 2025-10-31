//
//  TabView1_5_Main.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/30/25.
//

import SwiftUI

struct TabView1_5_Main: View {
    @Binding var path: NavigationPath
    @Environment(InfoContainer.self) var infoContainer
    
    var body: some View {
    ZStack{
        Color.white.ignoresSafeArea()
            
            VStack(spacing:0){
                Row1_tossbanksend(path: $path)
                Row2_tomywingo()
                Row3_markreceiver()
                Row4_send2(path: $path)
               
                } //VStackAll
        } //ZStack
        .navigationBarHidden(true)
    }
}

#Preview {
    TabView1_5_Main(path: .constant(NavigationPath()))
        .environment(InfoContainer())
}

