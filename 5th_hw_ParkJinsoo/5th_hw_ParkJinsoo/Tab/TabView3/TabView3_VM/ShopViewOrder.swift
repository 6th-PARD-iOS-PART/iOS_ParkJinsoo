//
//  ShopViewOrder.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//

import SwiftUI

class ShopViewOrder {
    var products: [ShopData] = ShopData.product

    var sortedByLowestPrice: [ShopData] {
        products.sorted { $0.price < $1.price }
    }
}
