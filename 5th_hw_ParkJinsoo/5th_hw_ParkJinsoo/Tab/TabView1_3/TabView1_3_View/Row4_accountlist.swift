//
//  Row4_accountlist.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row4_accountlist: View {
    @Binding var path: NavigationPath
    @Environment(InfoContainer.self) var infoContainer //environment에서 가져옴
    
    var body: some View {
        
        ForEach(AccountData.account.indices, id: \.self){ sectionIndex in //2차 배열로 AccountData 그리기
            if sectionIndex == 1{
                HStack{
                    Text("최근 보낸 계좌")
                        .font(.system(size:17))
                        .foregroundStyle(Color(red:0.2,green:0.2,blue:0.2))
                        .bold()
                        .padding(.leading,27)
                        .padding(.top,24)
                    Spacer()
                }
            }
            ForEach(AccountData.account[sectionIndex]){ item in
                AccountCell(path: $path, data: item, infoContainer: infoContainer)
                    .padding(.top,24)
            }
        }


        
    }
}

#Preview {
    Row4_accountlist(path: .constant(NavigationPath()))
        .environment(InfoContainer())
}
