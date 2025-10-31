//
//  Row3_mybank.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row3_tothisbank: View {
    @Environment(InfoContainer.self) var infoContainer
    
    var body: some View {
        
        HStack{ //내 WINGO 통장으로
            VStack(alignment:.leading){
                HStack{
                    Text(infoContainer.selectedName)
                        .foregroundStyle(.black)
                        .bold()
                        .font(.system(size:22))
                        .padding(.leading,27)
                    Text("으로")
                        .foregroundStyle(.gray)
                        .font(.system(size:22))
                        .padding(.leading,-5)
                    Spacer()
                }
                HStack{
                    Text(infoContainer.selectedBank)
                        .foregroundStyle(.gray)
                        .bold()
                        .font(.system(size:15))
                        .padding(.leading,27)
                        .padding(.top,4)
                    Spacer()
                }
            }
            .frame(height:90)
//                    .background(Color.red.opacity(0.1))
        }
         
    }
}

#Preview {
    Row3_tothisbank()
}

