//
//  Row1_tossbanksend2.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/30/25.
//

import SwiftUI

struct Row1_tossbanksend2: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        HStack{ // 토스뱅크송금 Row
            ZStack{
                Text("토스뱅크송금")
                    .foregroundStyle(.gray)
                    .font(.system(size:18.4))
                    .padding(.trailing,20)
                HStack{
                    Button{
                        path.removeLast()
                    }label:{
                        Image("arrowleft")
                            .resizable()
                            .frame(width:12,height:20)
                            .padding(.leading,20)
                    }
                    Spacer()
                }
            }
        }
      .frame(height:62)
//              .background(Color.red.opacity(0.1))


        
    }
}

#Preview {
    Row1_tossbanksend2(path: .constant(NavigationPath()))
}
