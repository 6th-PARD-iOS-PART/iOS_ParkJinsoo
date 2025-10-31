//
//  Keypad.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct KeyPad: View {
    @Binding var amount: String
    
    let keys: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["00", "0", "←"]
    ]
    
    var body: some View {
        
        
        VStack(spacing:40){
            ForEach(keys, id: \.self){ row in
                HStack(spacing:110){
                    ForEach(row, id: \.self){num in
                        Button{
                            if num == "←"{
                                if !amount.isEmpty{
                                    amount.removeLast()
                                }
                            }else{
                                amount += num
                            }
                        }label:{
                            Text(num)
                                .font(.system(size:28))
                                .foregroundColor(Color(red:103/255, green:113/255, blue:126/255))
                                .bold()
                        }
                    }
                }
            }
        } //VstackAll
    }
}

#Preview {
    KeyPad(amount: .constant(""))
}
