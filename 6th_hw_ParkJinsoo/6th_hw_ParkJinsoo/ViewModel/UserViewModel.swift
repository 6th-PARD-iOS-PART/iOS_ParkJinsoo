//
//  UserViewModel.swift
//  URLSession_Practice
//
//  Created by Kim Kyengdong on 11/1/25.
//
import SwiftUI
import Combine

final class UserViewModel: ObservableObject {
    
    //MARK: - get
    public func getUserList(_ search: String = "all") async throws -> [getUserModel] {
        let urlString = BaseURL.baseUrl.rawValue
        
        guard let url = URL(string: "\(urlString)/user?part=\(search)") else{
            throw ErrorType.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let HTTPresponse = response as? HTTPURLResponse, (200...299).contains(HTTPresponse.statusCode) else{
            throw ErrorType.invalidResponse
        }
        
        do{
            let decodedData = try JSONDecoder().decode([getUserModel].self,from:data)
            print(decodedData)
            
            return(decodedData)
        } catch {
            print(error)
            throw ErrorType.networkError
        }
    }

    //MARK: - delete
    //"deleteUser" 함수를 작성하시오.
    
    public func deleteUser(id: Int) async {
        let urlString = BaseURL.baseUrl.rawValue
        
        guard let url = URL(string: "\(urlString)/user/\(id)") else {
            print("invalidURL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("delete failed: \(response)")
                return
            }
            
            print("User deleted successfully.")
        } catch {
            print("networking error: \(error)")
        }
    }

    
    //MARK: - post
    //"postUser" 함수를 작성하시오.
    public func postUser(data: UserModel) async {
        let urlString = BaseURL.baseUrl.rawValue
        
        guard let url = URL(string: "\(urlString)/user") else{
            print("invalidURL")
            return
        }
        
        let newUser = UserModel(user_name: data.user_name, user_age: data.user_age, pard_part: data.pard_part)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        do {
            request.httpBody = try JSONEncoder().encode(newUser)
        } catch {
            print("encoding failed")
        }
        
        do{
            let(_, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else{
                print("error \(response)")
                return
            }
        } catch{
            print("networking error \(error)")
        }

    }
    
    //MARK: - PATCH
    //"updateUser" 함수를 작성하시오.
    
    public func updateUser(id: Int, data: UserModel) async {
        let urlString = BaseURL.baseUrl.rawValue
        
        guard let url = URL(string: "\(urlString)/user/\(id)") else {
            print("invalidURL")
            return
        }
        
        let updatedUser = UserModel(user_name: data.user_name, user_age: data.user_age, pard_part: data.pard_part)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        do {
            request.httpBody = try JSONEncoder().encode(updatedUser)
        } catch {
            print("encoding failed")
            return
        }
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("update failed: \(response)")
                return
            }
            
            print("User updated successfully.")
        } catch {
            print("networking error: \(error)")
        }
    }

}
