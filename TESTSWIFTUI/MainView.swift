//
//  MainView.swift
//  TESTSWIFTUI
//
//  Created by Даниил on 15.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    private let columnsGrid = [
        GridItem(.flexible())
    ]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var isGridStyle = false
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: isGridStyle ? "square.grid.2x2" : "list.bullet")
                    .font(.title)
                    .foregroundStyle(.green)
                Spacer()
            }.onTapGesture {
                withAnimation(.easeOut) {
                    isGridStyle.toggle()
                }
            }
            
            ScrollView() {
                LazyVGrid(columns: isGridStyle ? columns : columnsGrid) {
                    ForEach(viewModel.items) { item in
                        VStack {
                            if isGridStyle {
                                ItemViewGrid(item: item)
                                    .cornerRadius(8)
                                    .shadow(radius: 1)
                            } else {
                                ItemViewList(item: item)
                            }
                        }
                        
                    }
                }
            }
            .padding(10)
            .scrollIndicators(.hidden)
        }
    }
}

struct ItemViewGrid: View {
    @State private var item: MainModel
    
    init(item: MainModel) {
        self.item = item
    }
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Image(item.image)
                Image(systemName: "list.clipboard")
                    .offset(x: 80, y: -70)
                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(item.isFavorite ? Color(.green) : .gray)
                    .offset(x: 80, y: -30)
                    .onTapGesture {
                        item.isFavorite.toggle()
                    }
            }
            HStack(spacing: 1) {
                Image(systemName: "star.fill")
                    .imageScale(.small)
                    .foregroundStyle(.yellow)
                Text("4.2")
                    .font(.system(size: 12))
                Spacer()
            }

            HStack {
                Text(item.title)
                    .fontWeight(.light)
                    .font(.system(size: 12))
                Spacer()
            }
            Spacer()

            HStack {
                ButtonTup(
                    flag: item.isChoose,
                    price: item.price
                )
            }
        }.background {
            Color(.white)
        }
    }
}


struct ItemViewList: View {
    @State private var item: MainModel
    
    init(item: MainModel) {
        self.item = item
    }
    
    var body: some View {
        ZStack {
            Image(systemName: "list.clipboard")
                .offset(x: 160, y: -60)
            Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(item.isFavorite ? Color(.green) : .gray)
                .offset(x: 160, y: -20)
                .onTapGesture {
                    item.isFavorite.toggle()
                }
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.2)
                HStack {
                    
                    Image(item.image)
                    
                    VStack(spacing: 8) {
                        HStack {
                            Image(systemName: "star.fill")
                                .imageScale(.small)
                                .foregroundStyle(.yellow)
                            Text("4.5")
                                .font(.system(size: 12))
                            Rectangle().frame(width: 1, height: 15)
                            Text("24 отзывов")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        HStack {
                            Text(item.title)
                                .fontWeight(.light)
                                .font(.system(size: 12))
                            Spacer()
                        }
                        Spacer()
                        ButtonTup(
                            flag: item.isChoose,
                            price: item.price
                        )
                    }
                }
            }
        }
    }
}


struct ButtonTup: View {
    @State private var flag: Bool
    @State private var index = 0
    private let price: String
    
    init(flag: Bool, price: String) {
        self.flag = flag
        self.price = price
    }
    
    var body: some View {
        if flag {
            HStack {
                VStack(alignment: .leading) {
                    Text(price + " ₽/кг")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                    HStack {
                        Text("234")
                            .font(.system(size: 12))
                            .strikethrough()
                    }
                }
                Spacer()
                Button {
                    flag.toggle()
                } label: {
                    Image(systemName: "basket")
                        .foregroundStyle(.white)
                        .padding(
                            EdgeInsets(
                                top: 10,
                                leading: 15,
                                bottom: 10,
                                trailing: 15
                            )
                        )
                        .background {
                            Rectangle()
                                .fill(.green)
                                .cornerRadius(8)
                        }
                }
            }.padding(
                EdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 8,
                    trailing: 8
                )
            )
        } else {
            VStack {
                Picker("Picker", selection: $index) {
                    Text("шт").tag(0)
                    Text("кг").tag(1)
                }.pickerStyle(.segmented)
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: 4,
                            bottom: 0,
                            trailing: 8
                        )
                    )
                HStack {
                    HStack {
                        VStack {
                            Button {
                                //TODO: - Inrease count
                                flag.toggle()
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundStyle(.white)
                            }
                        }
                        Spacer()
                        VStack {
                            Text("0.3 кг")
                                .foregroundStyle(.white)
                            Text("~200 ₽")
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        VStack {
                            Button {
                                //TODO: - Reduce count
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: 4,
                            bottom: 0,
                            trailing: 8
                        )
                    )
                    .background {
                        Rectangle()
                            .fill(.green)
                            .cornerRadius(8)
                        
                    }
                }.padding(
                    EdgeInsets(
                        top: 0,
                        leading: 4,
                        bottom: 8,
                        trailing: 8
                    )
                )
            }
        }
    }
}


#Preview {
    MainView()
}
