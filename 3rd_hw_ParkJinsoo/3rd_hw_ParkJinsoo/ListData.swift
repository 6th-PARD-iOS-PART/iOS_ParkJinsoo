//
//  ListData.swift
//  3rd_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/9/25.
//
import SwiftUI

struct MockData: Identifiable {
    let id = UUID()
    var money: String
    var name: String
    var icon: String
}

extension MockData {
    static let modeling: [MockData] =
        [
            MockData(money: "339,690원", name: "WINGO통장", icon: "bank1"),
            MockData(money: "38,841원", name: "토스뱅크통장", icon: "bank2"),
            MockData(money: "114원", name: "토스뱅크에 쌓인 이자", icon: "bank3"),
            MockData(money: "650원", name: "MY입출금통장", icon: "bank4"),
            MockData(money: "2,090원", name: "KB나라사랑우대통장", icon: "bank5"),
            MockData(money: "29원", name: "보통예금(IBK나라사랑통장)", icon: "bank6"),
            MockData(money: "118원", name: "토스뱅크외화통장·2개", icon: "bank7"),
            MockData(money: "0원", name: "입출금통장", icon: "bank8"),
            MockData(money: "1,051원", name: "보통예금(IBK주거래생활금융통장)", icon: "bank9"),
            MockData(money: "15,257,990원", name: "투자 모아보기·15개", icon: "bank10")
        ]
}
