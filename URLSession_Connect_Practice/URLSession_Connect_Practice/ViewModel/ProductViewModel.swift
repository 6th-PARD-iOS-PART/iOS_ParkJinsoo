import Foundation
import Combine
/*
Hint: ViewModel 속에 있는 모든 모델의 정보들을 자세히 확인하세요.
 */
final class ProductViewModel: ObservableObject {
    @Published private var products: [Product]
    @Published private(set) var productColors: [ProductColorCount] = []
    @Published private(set) var productAllColors: [ProductAllColor] = []
    @Published private(set) var productEachColor: [ProductEachColor] = []
    @Published var selectedColor: String = "전체" {
        didSet {
            if oldValue != selectedColor {
                handleColorChange()
            }
        }
    }
    
    private let service: ProductAPIService

    @Published private var expandedProductName: String?
    @Published var selectedProduct: Product?
    private let isoFormatter: ISO8601DateFormatter

    init(service:ProductAPIService = ProductAPIService()) {
        self.service = service
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        self.isoFormatter = formatter
        
        self.products = []
        
        Task {
            await loadProducts()
        }
    }
    
    @MainActor
        func loadProducts() async {
            do {
                let fetched = try await service.fetchProducts()
                self.products = fetched   // UI 업데이트
            } catch {
                print("GET 실패:", error)
            }
        }
    
    @MainActor
    func loadProductsColorCount(name: String) async {
            do {
                let fetched = try await service.fetchProductsColorCount(name: name)
                self.productColors = fetched   // UI 업데이트
            } catch {
                print("GET 실패:", error)
            }
        }
    
    @MainActor
        func loadAllColor() async {
            do {
                let fetched = try await service.fetchAllColor()
                self.productAllColors = fetched   // UI 업데이트
//                self.productColors = fetched.map { item in
//                            ProductColorCount(color: item.color, count: item.count)
//                        }
            } catch {
                print("GET 실패:", error)
            }
        }
    
    @MainActor
    func loadEachColorProduct(color: String) async {
            do {
                let fetched = try await service.fetchEachColorProduct(color: color)
                self.productEachColor = fetched   // UI 업데이트
            } catch {
                print("GET 실패:", error)
            }
        }

    
    
    @MainActor
        func createProductOnServer(_ request: ProductRequest) async throws {
            try await service.createProduct(request: request)
            
            let fetched = try await service.fetchProducts()
            self.products = fetched
        }


    var availableColors: [String] {
        Array(Set(productAllColors.filter { $0.count > 0 }.compactMap { $0.color })).sorted()
    }

    var filteredProducts: [Product] {
        products
            .filter { selectedColor == "전체" || $0.color == selectedColor }
    }

    var productNames: [String] {
        Array(Set(filteredProducts.map { $0.name })).sorted()
    }

    var selectedProductName: String? {
        expandedProductName
    }

    var statusText: String {
        if selectedColor == "전체" {
            if let selectedProductName {
                return "선택한 상품: \(selectedProductName)"
            } else {
                return "상품을 선택하세요"
            }
        } else {
            if filteredProducts.isEmpty {
                return "\(selectedColor) 색상 상품이 없습니다"
            }

            if let selectedProductName {
                return "\(selectedColor) 색상 - \(selectedProductName) 선택됨"
            } else {
                return "\(selectedColor) 색상 상품 목록"
            }
        }
    }

    func products(for name: String) -> [Product] {
        filteredProducts.filter { $0.name == name }
    }

    func colorTotals(for name: String) -> [(color: String, total: Int)] {
        let matchedProducts = products(for: name)
        
        return Dictionary(grouping: matchedProducts,
                          by: {
            if $0.color == nil && $0.count == 0 {
                return "없음"
            }else{
                return $0.color ?? "red"
            }
        }
            )
            .map { color, items in
                (color: color, total: items.reduce(0) { $0 + $1.count })
            }
            .sorted { $0.color < $1.color }
    }
    
    

    func summary(for name: String) -> (price: Int, totalCount: Int, isSellable: Bool) {
        let items = products(for: name)
        guard !items.isEmpty else { return (0, 0, false) }

        let price = items.map(\.price).min() ?? 0
        let totalCount = items.reduce(0) { $0 + $1.count }

        let isSellable = items.contains { $0.sellable && $0.count > 0 }

        return (price, totalCount,  isSellable)
    }

    func rowColorLabel(for name: String) -> String {
        if selectedColor != "전체" {
            return selectedColor
        }
        let colors = Set(products(for: name).map { $0.color })
        switch colors.count {
        case 0:
            return "-"
        case 1:
            return colors.compactMap { $0 }.first ?? "-"
        default:
            return "다양"
        }
    }

    func product(name: String, color: String) -> Product? {
        products.first { $0.name == name && $0.color == color }
    }

    func selectProduct(name: String, color: String) {
        selectedProduct = product(name: name, color: color)
    }

    func prepareForCreation() {
        selectedProduct = nil
    }

    @discardableResult
    func createProduct(name: String, price: Int, count: Int, color: String, sellable: Bool) -> Product {
        let newId = (products.compactMap(\.id).max() ?? 0) + 1
        let timestamp = isoFormatter.string(from: Date())
        let newProduct = Product(
            id: newId,
            name: name,
            color: color,
            price: price,
            count: count,
//            createdAt: timestamp,
//            modifiedAt: timestamp,
            sellable: sellable
        )

        products.append(newProduct)
        selectedProduct = newProduct

        if selectedColor != "전체", selectedColor != color {
            selectedColor = "전체"
        }

        return newProduct
    }

    func updateProduct(id: Int, name: String, price: Int, count: Int, color: String, sellable: Bool) {
        guard let index = products.firstIndex(where: { $0.id == id }) else { return }
        let original = products[index]
        let updated = Product(
            id: id,
            name: name,
            color: color,
            price: price,
            count: count,
//            createdAt: original.createdAt,
//            modifiedAt: isoFormatter.string(from: Date()),
            sellable: sellable
        )
        products[index] = updated
        selectedProduct = updated

        if selectedColor != "전체", selectedColor != color {
            selectedColor = "전체"
        }
    }

    func toggleDetails(for name: String) {
        if expandedProductName == name {
            if selectedColor == "전체" {
                expandedProductName = nil
            }
        } else {
            expandedProductName = name
        }
    }

    func shouldShowDetails(for name: String) -> Bool {
        selectedColor != "전체" || expandedProductName == name
    }

    func updateQuantityForSelectedColor(to newCount: Int) {
        guard selectedColor != "전체" else { return }
        updateQuantity(for: selectedColor, to: newCount)
    }

    func totalQuantity(for color: String) -> Int {
        products
            .filter { $0.color == color }
            .reduce(0) { $0 + $1.count }
    }

    private func handleColorChange() {
        expandedProductName = nil
        if selectedColor == "전체" {
            selectedProduct = nil
        } else if let selectedProduct, selectedProduct.color != selectedColor {
            self.selectedProduct = nil
        }
    }

    private func updateQuantity(for color: String, to newCount: Int) {
        guard newCount >= 0 else { return }

        let timestamp = isoFormatter.string(from: Date())
        var wasUpdated = false

        products = products.map { product in
            guard product.color == color else { return product }
            wasUpdated = true
            return Product(
                id: product.id,
                name: product.name,
                color: product.color,
                price: product.price,
                count: newCount,

//                createdAt: product.createdAt,
//                modifiedAt: timestamp,
                sellable: product.sellable
            )
        }

        guard wasUpdated else { return }

        expandedProductName = nil

        if selectedColor != "전체" {
            let hasInStock = products.contains { $0.color == selectedColor && $0.count > 0 }
            if !hasInStock {
                selectedColor = "전체"
            }
        }
//
//        if let selectedProduct, selectedProduct.color == color {
//            self.selectedProduct = products.first { $0.id == selectedProduct.id }
//        }
        
        if let selectedProductId = selectedProduct?.id,
           selectedProduct?.color == color {
            self.selectedProduct = products.first { $0.id == selectedProductId }
        }

    }
}



