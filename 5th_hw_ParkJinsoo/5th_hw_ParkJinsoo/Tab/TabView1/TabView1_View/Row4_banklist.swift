//
//  Row4_banklist.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//

import SwiftUI

struct Row4_banklist: View {
    @Binding var path: NavigationPath
    var moneyContainer: MoneyContainer
    
    var body: some View {
        ForEach(ListData.modeling){ item in
            ListCell(path: $path,  data: item, moneyContainer: moneyContainer) //ListCell 반복구문으로 실행, MockData를 가져옴 //moneyContainer 같이 업데이트
                .listRowSeparator(.hidden) //구분 선 제거
        }
        
        HStack(spacing:25){
            Text("대출0")
                .font(.system(size:13.3))
                .foregroundStyle(.gray)
                .padding(.leading,5)
            Rectangle()
                .frame(width:1,height:20)
                .foregroundStyle(.gray)
            Text("증권7")
                .font(.system(size:13.3))
                .foregroundStyle(.gray)
            Rectangle()
                .frame(width:1,height:20)
                .foregroundStyle(.gray)
            Text("저축3")
                .font(.system(size:13.3))
                .foregroundStyle(.gray)
            Rectangle()
                .frame(width:1,height:20)
                .foregroundStyle(.gray)
            Text("전체26")
                .font(.system(size:13.3))
                .foregroundStyle(.gray)
        }
        .padding(.horizontal,20)

    }
}

#Preview {
    Row4_banklist(
        path: .constant(NavigationPath()),
        moneyContainer: MoneyContainer()
    )
    
}
