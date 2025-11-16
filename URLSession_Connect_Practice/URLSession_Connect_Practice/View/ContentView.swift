//
//  ContentView.swift
//  URLSession_Connect_Practice
//
//  Created by Kim Kyengdong on 11/8/25.
//

import SwiftUI

struct ContentView: View {
    private enum Destination: Hashable {
        case product(Product)
        case newProduct
    }

    @StateObject private var viewModel = ProductViewModel()
    @State private var quantityInput: String = ""
    @State private var feedbackMessage: String? 
    @State private var isFeedbackError = false
    @State private var path: [Destination] = []
    private static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()

    var body: some View {
        NavigationStack(path: $path) {
            content
                .navigationTitle("iOS 화이팅~!! 서버통신 할 수 있다~")
                .navigationBarTitleDisplayMode(.inline)
                .onChange(of: viewModel.selectedColor, perform: handleColorChange)
                .onChange(of: path, perform: handlePathChange)
                .navigationDestination(for: Destination.self) { destination in
                    destinationView(destination)
                }
        }
    }

    private var content: some View {
        ScrollView{
            VStack(spacing: 16) {
                headerSection
                statusSection
                if viewModel.selectedColor == "전체" {
                    productListSection    // 기존 리스트 그대로
                    emptyStateSection
                } else {
                    colorSelectedSection  // 서버에서 가져온 색상전용 리스트 UI
                    emptyStateEachColorSection
                }
                emptyStateSection
                batchUpdateSection
                Spacer(minLength: 0)
            }
            .padding()
        }

        }

    private var headerSection: some View {
        HStack {
            addProductButton
            Spacer()
            colorPicker
        }
    }

    private var addProductButton: some View {
        Button {
            viewModel.prepareForCreation()
            path.append(.newProduct)
        } label: {
            Label("상품 추가하기", systemImage: "plus")
                .font(.subheadline)
        }
        .buttonStyle(.borderedProminent)
    }

    private var colorPicker: some View {
        VStack(alignment: .trailing, spacing: 2) {
            Text("색상을 고르세요.")
            Picker("색상 선택", selection: $viewModel.selectedColor) {
                Text("전체").tag("전체")
                ForEach(viewModel.availableColors, id: \.self) { color in
                    Text(color).tag(color)
                }
            }
            .pickerStyle(.menu)
            .onAppear{
                Task{
                    await viewModel.loadAllColor()
                }
            }
        }
    }

    private var statusSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(viewModel.statusText)
                .font(.headline)
        }
    }

    @ViewBuilder
    private var productListSection: some View {
        ForEach(viewModel.productNames, id: \.self) { name in
            productSection(for: name)
        }
    }
    
    @ViewBuilder
        private var colorSelectedSection: some View {
            ForEach(viewModel.productEachColor, id: \.self) { item in
                productSection(for: item.name)
            }
        }

    @ViewBuilder
    private var emptyStateSection: some View {
        if viewModel.productNames.isEmpty {
            VStack(spacing: 8) {
                Text("표시할 상품이 없습니다.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
    }
    
    @ViewBuilder
    private var emptyStateEachColorSection: some View {
        if viewModel.productEachColor.isEmpty {
            VStack(spacing: 8) {
                Text("표시할 상품이 없습니다.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
    }

    @ViewBuilder
    private var batchUpdateSection: some View {
        if let color = selectedColorForBatch {
            Divider()
            BatchUpdateView(
                color: color,
                totalQuantity: viewModel.totalQuantity(for: color),
                quantityInput: $quantityInput,
                feedbackMessage: feedbackMessage,
                isFeedbackError: isFeedbackError,
                isQuantityInputValid: isQuantityInputValid,
                onApply: applyBatchUpdate
            )
        }
    }

    @ViewBuilder
    private func productSection(for name: String) -> some View {
        let summary = viewModel.summary(for: name)
        let priceText = formatPrice(summary.price)
        let countText = "\(summary.totalCount)"

        VStack(alignment: .leading, spacing: 8) {
            ProductRowView(
                name: name,
                priceText: priceText,
                countText: countText,
                isSellable: summary.isSellable
            ) {
                withAnimation(.spring) {
                    viewModel.toggleDetails(for: name)
                }
                
                Task{
                    await viewModel.loadProductsColorCount(name: name)
                }
            }

            if viewModel.shouldShowDetails(for: name) {
                colorDetailsSection(for: name)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }

    @ViewBuilder
    private func colorDetailsSection(for name: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("색상별 재고 현황")
                .font(.headline)

            ForEach(viewModel.productColors, id: \.color) { item in
                ColorDetailRow(
                    color: item.color,
                    total: item.count
                ) {
                    guard let product = viewModel.product(name: name, color: item.color) else { return }
                    viewModel.selectProduct(name: name, color: item.color)
                    path.append(.product(product))
                }
            }
        }
    }

    private var selectedColorForBatch: String? {
        let color = viewModel.selectedColor
        return color == "전체" ? nil : color
    }

    private var isQuantityInputValid: Bool {
        guard let value = Int(quantityInput) else { return false }
        return value >= 0
    }

    private func applyBatchUpdate() {
        guard let color = selectedColorForBatch else { return }
        guard let newCount = Int(quantityInput) else {
            feedbackMessage = "수량은 숫자로 입력해주세요."
            isFeedbackError = true
            return
        }

        viewModel.updateQuantityForSelectedColor(to: newCount)
        feedbackMessage = "\(color) 색상 상품 수량을 \(newCount)개로 변경했습니다."
        isFeedbackError = false
    }

    private func formatPrice(_ price: Int) -> String {
        let formatted = Self.priceFormatter.string(from: NSNumber(value: price)) ?? "\(price)"
        return "\(formatted)원"
    }
}

private extension ContentView {
    func handleColorChange(_ newColor: String) {
            quantityInput = ""
            feedbackMessage = nil
            isFeedbackError = false
            
            if newColor != "전체" {
                Task {
                    await viewModel.loadEachColorProduct(color: newColor)
                }
            }
        }

    private func handlePathChange(_ newPath: [Destination]) {
        guard let last = newPath.last else {
            viewModel.selectedProduct = nil
            return
        }

        switch last {
        case .product(let product):
            viewModel.selectedProduct = product
        case .newProduct:
            viewModel.selectedProduct = nil
        }
    }

    @ViewBuilder
    private func destinationView(_ destination: Destination) -> some View {
        switch destination {
        case .product(let product):
            ProductDetailView(viewModel: viewModel, mode: .edit(product))
        case .newProduct:
            ProductDetailView(viewModel: viewModel, mode: .create)
        }
    }
}

#Preview {
    ContentView()

}

private struct ProductRowView: View {
    let name: String
    let priceText: String
    let countText: String
    let isSellable: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(priceText)
                    .frame(width: 120, alignment: .trailing)

                Text(countText)
                    .frame(width: 60, alignment: .trailing)

                Text(isSellable ? "가능" : "불가")
                    .foregroundColor(isSellable ? .green : .red)
                    .frame(width: 60, alignment: .center)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}

private struct ColorDetailRow: View {
    let color: String
    let total: Int
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(color)
                        .font(.subheadline)
                    Text("총 \(total)개")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
//                    .foregroundColor(.tertiaryLabel)
            }
            .padding(.vertical, 6)
            .padding(.horizontal)
            .background(Color(.systemGray5))
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}

private struct BatchUpdateView: View {
    let color: String
    let totalQuantity: Int
    @Binding var quantityInput: String
    let feedbackMessage: String?
    let isFeedbackError: Bool
    let isQuantityInputValid: Bool
    let onApply: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("\(color) 색상 수량 일괄 변경")
                .font(.headline)

            Text("현재 총 수량: \(totalQuantity)개")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack {
                TextField("새 수량을 입력하세요", text: $quantityInput)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)

                Button("적용", action: onApply)
                    .buttonStyle(.borderedProminent)
                    .disabled(!isQuantityInputValid)
            }

            if let feedbackMessage {
                Text(feedbackMessage)
                    .font(.footnote)
                    .foregroundColor(isFeedbackError ? .red : .green)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
