//
//  Row4_send2.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/30/25.
//

import SwiftUI

struct Row4_send2: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        
        Button{
            path.removeLast(path.count)
        }label:{
            ZStack{
                Rectangle()
                    .frame(width:360,height:62)
                    .foregroundStyle(.blue)
                    .cornerRadius(20)
                Text("옮기기")
                    .font(.system(size:18))
                    .padding(.leading,20)
                    .foregroundColor(Color(red:199/255,green:229/255,blue:255/255))
            }
        }


        ZStack{
            Rectangle()
                .frame(width:360,height:62)
                .foregroundStyle(.white)
                .cornerRadius(20)
            Text("평생 수수료 무료")
                .font(.system(size:16))
                .padding(.leading,20)
                .foregroundColor(Color(red:140/255,green:153/255,blue:164/255))
        }



        
    }
}

#Preview {
    Row4_send2(path: .constant(NavigationPath()))
}
