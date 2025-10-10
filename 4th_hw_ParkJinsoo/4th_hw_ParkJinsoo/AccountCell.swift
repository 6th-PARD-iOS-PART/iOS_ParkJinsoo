//
//  AccountCell.swift
//  4th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/10/25.
//
import SwiftUI

struct AccountCell: View {
    @Binding var path: NavigationPath
    
    var data: AccountData
    var infoContainer: InfoContainer //주입받는 변수
    
    var body: some View {
        HStack{
            if data.icon == "samsung"{
                ZStack{
                    Image(data.icon)
                        .resizable()
                        .frame(width:45,height:45)
                        .padding(.leading,26)
                    Text("삼성증권")
                        .font(.system(size:8))
                        .padding(.leading,26)
                        .foregroundColor(Color(red: 152/255, green: 176/255, blue: 240/255))
                }
            }else if data.icon == "kb"{
                ZStack{
                    Image(data.icon)
                        .resizable()
                        .frame(width:45,height:45)
                        .padding(.leading,26)
                    VStack{
                        Text("KB국민은행")
                            .font(.system(size:6))
                            .padding(.leading,26)
                            .foregroundColor(Color(red: 128/255, green: 106/255, blue: 19/255))
                            .padding(.top,20)
                    }
                }
            }else{
                Image(data.icon)
                    .resizable()
                    .frame(width:45,height:45)
                    .padding(.leading,26)
            }
            Button{
                infoContainer.selectedName = data.name //클래스에 데이터 저장
                infoContainer.selectedBank = data.bank
                path.append("View4")
            }label:{
                VStack(alignment:.leading){
                    Text(data.name)
                        .foregroundStyle(Color(red:0.4,green:0.4,blue:0.4))
                        .font(.system(size:18))
                        .padding(.bottom,1)
                        .bold()
                    Text(data.bank)
                        .foregroundStyle(.gray)
                        .font(.system(size:16))
                }
                .padding(.leading,10)
                Spacer()
                    Image(data.star)
                    .resizable()
                    .frame(width:25,height:23)
                        .padding(.trailing,27)
            }
        }
        
        
        
        
        
        
    }
}


