//
//  MainViewModel.swift
//  TESTSWIFTUI
//
//  Created by Даниил on 15.08.2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var items: [MainModel] = []
    
    init() {
        self.items = makeData()
    }
    
    private func makeData() -> [MainModel]{
        [
            MainModel(
                id: UUID(),
                image: "image",
                title: "Дорадо Охлажденная Непотрошеная 300-400г",
                price: "890",
                isChoose: true,
                subTitle: "Удар по ценам",
                isFavorite: false
            ),
            MainModel(
                id: UUID(),
                image: "image",
                title: "Дорадо Охлажденная Непотрошеная 300-400г",
                price: "890",
                isChoose: false,
                subTitle: "Новинка",
                isFavorite: true
            ),
            MainModel(
                id: UUID(),
                image: "image1",
                title: "Дорадо Охлажденная Непотрошеная 300-400г",
                price: "890",
                isChoose: false,
                subTitle: "Цена по карте",
                isFavorite: true
            ),
        ]
    }
}
