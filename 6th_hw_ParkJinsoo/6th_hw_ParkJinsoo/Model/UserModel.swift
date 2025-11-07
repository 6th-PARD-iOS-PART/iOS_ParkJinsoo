//
//  Data.swift
//  URLSession_Practice
//
//  Created by Kim Kyengdong on 11/1/25.
//

//MARK: - Model
struct getUserModel : Codable, Hashable {
    var id: Int?
    let name: String
    let age: Int
    let part: String
}

struct UserModel: Codable {
    let user_name: String
    let user_age: Int
    let pard_part: String
}

