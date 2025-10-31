//
//  Row1_where.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row1_where: View {
    @Binding var path: NavigationPath
    var body: some View {
        HStack{ // ArrowLeft
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
        .frame(height:84)
        //                  .background(Color.red.opacity(0.1))


        HStack{ //어디로 돈을 보낼까요? Row
            Text("어디로 돈을 보낼까요?")
                .font(.system(size:27))
                .bold()
                .padding(.leading,28)
            Spacer()
        }
        .frame(height:33)
        //                    .background(Color.red.opacity(0.1))

        
    }
}

#Preview {
    Row1_where(path: .constant(NavigationPath()))
}
