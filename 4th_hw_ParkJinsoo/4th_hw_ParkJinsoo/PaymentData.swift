//
//  PaymentData.swift
//  4th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/10/25.
//
import SwiftUI

struct PaymentData: Identifiable {
    let id = UUID()
    var icon: String
    var shop: String
    var time: String
    var price: String
    var balance: String
}

extension PaymentData {
    static let payment: [[PaymentData]] = [
        [
         PaymentData(icon: "kakao", shop: "카카오 택시_0", time: "11:13", price: "-6,200원", balance: "38,841원"),
         PaymentData(icon: "kakao", shop: "카카오 택시 선승인", time: "11:00", price: "+6,900원", balance: "45,041원"),
         PaymentData(icon: "kakao", shop: "카카오 택시 선승인", time: "11:00", price: "-6,900원", balance: "38,141원")
        ],
        [
        PaymentData(icon: "game", shop: "플렉스PC방", time: "22:44", price: "-5,500원", balance: "45,041원"),
         PaymentData(icon: "game", shop: "플렉스PC방", time: "21:35", price: "-5,000원", balance: "50,541원"),
         PaymentData(icon: "cu", shop: "씨유한동대오석관점", time: "16:17", price: "-2,000원", balance: "55,541원"),
         PaymentData(icon: "cu", shop: "씨유한동대오석관점", time: "15:59", price: "-4,400원", balance: "57,541원"),
         PaymentData(icon: "kakao", shop: "카카오 택시_0", time: "10:00", price: "-7,000원", balance: "61,941원"),
         PaymentData(icon: "kakao", shop: "카카오 택시 선승인", time: "09:47", price: "+7,300원", balance: "68,941원"),
         PaymentData(icon: "kakao", shop: "카카오 택시 선승인", time: "09:47", price: "-7,300원", balance: "61,941원"),
        PaymentData(icon: "kakao", shop: "카카오 택시 선승인", time: "09:46", price: "+7,300원", balance: "68,941원"),
        PaymentData(icon: "kakao", shop: "카카오 택시 선승인", time: "09:46", price: "-7,300원", balance: "61,941원"),
        ]
    ]
}
