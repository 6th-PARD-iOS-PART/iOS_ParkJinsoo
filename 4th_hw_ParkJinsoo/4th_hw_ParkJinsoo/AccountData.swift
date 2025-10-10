//
//  AccountData.swift
//  4th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/10/25.
//
import SwiftUI

struct AccountData: Identifiable {
    let id = UUID()
    var icon: String
    var name: String
    var bank: String
    var star: String
}

extension AccountData {
    static let account: [[AccountData]] = [
        [
            AccountData(icon: "hana", name: "WINGO통장", bank: "하나은행157-891652-62107",star: "bluestar"),
            AccountData(icon: "samsung", name: "종합매매", bank: "삼성증권711289802-01",star: "bluestar")
        ],
        [
            AccountData(icon: "kb", name: "김정희", bank: "KB국민96314175848",star: "graystar"),
            AccountData(icon: "kabang", name: "내입출금통장", bank: "카카오뱅크3333-20-8455742",star: "graystar"),
            AccountData(icon: "giup", name: "김래언", bank: "IBK기업286-104115-01-019",star: "graystar"),
            AccountData(icon: "kb", name: "김정희", bank: "KB국민96314175848",star: "graystar"),
            AccountData(icon: "kabang", name: "내입출금통장", bank: "카카오뱅크3333-20-8455742",star: "graystar"),
            AccountData(icon: "giup", name: "김래언", bank: "IBK기업286-104115-01-019",star: "graystar")
        ]
    ]
}
