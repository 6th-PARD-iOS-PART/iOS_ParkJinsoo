//
//  TabView1_4_Main.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct TabView1_4_Main: View {
    @Binding var path: NavigationPath
    @State private var amount: String = "" //입력한 금액 저장
    @Environment(InfoContainer.self) var infoContainer
    @State var isOn: Bool = false
    @State var next: Bool = false
    @State private var warning: String = "" //경고문
    
    var body: some View {
    ZStack{
        Color.white.ignoresSafeArea()
            
            VStack(spacing:0){
                Row1_tossbanksend(path: $path)
                Row2_frommytoss()
                Row3_tothisbank()
                Row4_movehowmuch(path: $path, amount: $amount, isOn: $isOn)
                KeyPad(amount: $amount)
                

                    
    //경고문 2차bool?
    //spacing

                    

                
                    
                } //VStackAll
        } //ZStack
        .navigationBarHidden(true)
    }
}

#Preview {
    TabView1_4_Main(path: .constant(NavigationPath()))
        .environment(InfoContainer())
}
