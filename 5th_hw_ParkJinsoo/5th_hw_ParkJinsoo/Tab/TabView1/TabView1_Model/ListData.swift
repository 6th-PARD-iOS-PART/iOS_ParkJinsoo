//
//  ListData.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//
import SwiftUI

struct ListData: Identifiable {
    let id = UUID()
    var money: String
    var name: String
    var icon: String
}

extension ListData {
    static let modeling: [ListData] =
        [
            ListData(money: "339,690원", name: "WINGO통장", icon: "bank1"),
            ListData(money: "38,841원", name: "토스뱅크통장", icon: "bank2"),
            ListData(money: "114원", name: "토스뱅크에 쌓인 이자", icon: "bank3"),
            ListData(money: "650원", name: "MY입출금통장", icon: "bank4"),
            ListData(money: "2,090원", name: "KB나라사랑우대통장", icon: "bank5"),
            ListData(money: "29원", name: "보통예금(IBK나라사랑통장)", icon: "bank6"),
            ListData(money: "118원", name: "토스뱅크외화통장·2개", icon: "bank7"),
            ListData(money: "0원", name: "입출금통장", icon: "bank8"),
            ListData(money: "1,051원", name: "보통예금(IBK주거래생활금융통장)", icon: "bank9"),
            ListData(money: "15,257,990원", name: "투자 모아보기·15개", icon: "bank10")
        ]
}
