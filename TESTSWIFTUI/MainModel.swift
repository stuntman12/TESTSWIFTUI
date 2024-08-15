//
//  MainModel.swift
//  TESTSWIFTUI
//
//  Created by Даниил on 15.08.2024.
//

import Foundation

struct MainModel: Identifiable {
    let id: UUID
    let image: String
    let title: String
    let price: String
    let isChoose: Bool
    let subTitle: String
    var isFavorite: Bool
}
