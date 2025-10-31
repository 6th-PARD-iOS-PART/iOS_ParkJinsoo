//
//  ShopData.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//

import SwiftUI

struct ShopData: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let image: String
    let price: Double
    let originalprice: Double
    let tag: String
    let view: String
    let reserve: String
    let category: String
}

extension ShopData {
    static let product: [ShopData] =
        [
            ShopData(name: "키위", subtitle: "[단독구매불가]압도적 당도 제스프리 루비레드키위 &골드키위사...", image: "kiwi", price: 2900, originalprice: 5900, tag: "최저가보상+", view: "44.6만명이구경함무료배송", reserve: "토스프라임537원적립", category: "특가"),
            
            ShopData(name: "물", subtitle: "[오늘만]스파클생수 500mL*60병/2L*24병", image: "water", price: 9900, originalprice: 18000, tag: "최저가보상+", view: "54.9만명이구경함·무료배송", reserve: "토스프라임693원적립", category: "식품"),
            
            ShopData(name: "선크림", subtitle: "[오늘의특가]메디큐브 UV쉴드 톤업 선크림 50mL 2개입", image: "suncream", price: 8900, originalprice: 24000, tag: "", view: "31.2만명이구경함·빠른배송", reserve: "토스프라임480원적립", category: "뷰티"),

            ShopData(name: "텀블러", subtitle: "[한정수량]스타리 텀블러 500mL·보온보냉겸용", image: "tumbler", price: 11900, originalprice: 22000, tag: "최저가보상+", view: "12.7만명이구경함", reserve: "토스프라임580원적립", category: "전자제품"),

            ShopData(name: "무선마우스", subtitle: "[특가]로지텍 무소음 블루투스 마우스 M331", image: "mouse", price: 17900, originalprice: 29900, tag: "", view: "67.1만명이구경함·무료배송", reserve: "토스프라임715원적립", category: "전자제품"),

            ShopData(name: "에어프라이어", subtitle: "[최대혜택]쿠쿠 4L 대용량 에어프라이어 AF101", image: "airfryer", price: 35900, originalprice: 89000, tag: "최저가보상+", view: "25.9만명이구경함·무료배송", reserve: "토스프라임1,070원적립", category: "전자제품"),

            ShopData(name: "화이트셔츠", subtitle: "[가을필수템]베이직 옥스포드 남녀공용 셔츠", image: "shirt", price: 15900, originalprice: 39000, tag: "최저가보상+", view: "48.5만명이구경함·무료배송", reserve: "토스프라임620원적립", category: "의류"),

            ShopData(name: "샴푸", subtitle: "[인기상품]려 자양윤모 탈모완화 샴푸 500mL", image: "shampoo", price: 5900, originalprice: 13900, tag: "", view: "33.8만명이구경함·빠른배송", reserve: "토스프라임410원적립", category: "뷰티"),

            ShopData(name: "식용유", subtitle: "[가정용]백설 해바라기유 900mL 2개입 세트", image: "oil", price: 7900, originalprice: 13500, tag: "최저가보상+", view: "21.4만명이구경함", reserve: "토스프라임530원적립", category: "식품"),

            ShopData(name: "요거트", subtitle: "[냉장배송]풀무원 그릭요거트 플레인 100g*8입", image: "yogurt", price: 6500, originalprice: 9800, tag: "최저가보상+", view: "19.3만명이구경함·무료배송", reserve: "토스프라임370원적립", category: "식품")

        ]
}
