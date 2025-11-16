import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse(statusCode: Int)
    case decodingError
    case encodingError
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "잘못된 URL 입니다."
        case .invalidResponse(let statusCode):
            return "서버 응답이 올바르지 않습니다. (code: \(statusCode))"
        case .decodingError:
            return "데이터 디코딩에 실패했습니다."
        case .encodingError:
            return "요청 본문 생성에 실패했습니다."
        case .unknown(let error):
            return "알 수 없는 오류가 발생했습니다: \(error.localizedDescription)"
        }
    }
}


final class ProductAPIService {

    func fetchProducts() async throws -> [Product] { //상품 일괄 출력 getAll
        //TODO: 상품의 전체 리스트를 받아오세요
//        print("fetchProducts called")
        
        let urlString = BaseURL.base.rawValue
        
        guard let url = URL(string: "\(urlString)/product/getAll") else{
            throw APIError.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
//        print("RAW JSON:", String(data: data, encoding: .utf8)!)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
            throw APIError.invalidResponse(statusCode: -1)
        }
        
        do{
            let products = try JSONDecoder().decode([Product].self,from:data)
            print(products)
            
            return(products)
        } catch {
            print(error)
            throw APIError.decodingError
        }
    }
    
    func fetchProductsColorCount(name: String) async throws -> [ProductColorCount]  { //상품 일괄 출력 시 color 받아오기 getPrdColor by name
        
        let urlString = BaseURL.base.rawValue
//        let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? name
        
        guard let url = URL(string: "\(urlString)/product/getPrdColor/\(name)") else{
            throw APIError.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
            throw APIError.invalidResponse(statusCode: -1)
        }
        
        do{
            let products = try JSONDecoder().decode([ProductColorCount].self,from:data)
            print(products)
            
            return(products)
        } catch {
            print(error)
            throw APIError.decodingError
        }
    }
    
    func fetchAllColor() async throws -> [ProductAllColor] { //전체 색깔 받아오기 getAllColor
        
        let urlString = BaseURL.base.rawValue
        
        guard let url = URL(string: "\(urlString)/product/getAllColor") else{
            throw APIError.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
            throw APIError.invalidResponse(statusCode: -1)
        }
        
        do{
            let products = try JSONDecoder().decode([ProductAllColor].self,from:data)
            print(products)
            
            return(products)
        } catch {
            print(error)
            throw APIError.decodingError
        }
    }
    
    func fetchEachColorProduct(color: String) async throws -> [ProductEachColor] { //getColor
        
        let urlString = BaseURL.base.rawValue
        
        guard let url = URL(string: "\(urlString)/product/getColor/\(color)") else{
            throw APIError.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
            throw APIError.invalidResponse(statusCode: -1)
        }
        
        do{
            let products = try JSONDecoder().decode([ProductEachColor].self,from:data)
            print(products)
            
            return(products)
        } catch {
            print(error)
            throw APIError.decodingError
        }
    }

        

    
//    func fetchProduct(id: Int) async throws -> Product { //수정하기에서 하나를 받아오고 수정 버튼을 누르면 패치되는 로직
//        //TODO: 상품에 대한 데이터를 받아오세요
//    }
//
//    func fetchColorCounts() async throws -> [Int] { //색상 출력
//        //TODO: 동일한 색상의 모든 상품 수를 받아오세요.
//    }

    func createProduct(request body: ProductRequest) async { //상품 등록
        //TODO: 상품 데이터를 서버에 보내세요
        let urlString = BaseURL.base.rawValue
                        
        guard let url = URL(string: "\(urlString)/product") else {
            print("Error: Invalid URL")
            return
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            print("Error: Failed encoding")
            
        }

        do {
            let (_, response) = try await URLSession.shared.data(for: request)
                    
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error: Invalid response")
                return
            }
            
        } catch {
            print("Error: Network Error")
        }
    }

    
//    func updateColorCount(request body: ??) async throws { //색상 일괄 변경
//        //TODO: 동일한 색상의 모든 상품들의 수량을 입력값으로 업데이트하세요.
//    }

}


