//
//  Row1_managebank.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row1_managebank: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        HStack{ // 통장관리 Row
            Button{
                path.removeLast()
            }label:{
                Image("arrowleft")
                    .resizable()
                    .frame(width:12,height:21)
                    .padding(.leading,20)
            }
            Spacer()
            Text("통장관리")
                .foregroundStyle(.gray)
                .font(.system(size:16.7))
                .padding(.trailing,18)
        }
        .frame(height:46)
        
    }
}

#Preview {
    Row1_managebank(path: .constant(NavigationPath()))
}




