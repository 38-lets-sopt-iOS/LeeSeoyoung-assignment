//
//  ContentView.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0

    private let tabs: [(image: ImageResource, label: String)] = [
        (.watcha, "구독"),
        (.category, "개별 구매"),
        (.wallet, "웹툰"),
        (.search, "찾기"),
        (.folder, "보관함")
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case 0: SubscriptionView()
                case 1: PurchaseView()
                case 2: WebtoonView()
                case 3: SearchView()
                default: LibraryView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack(spacing: 0) {
                Divider().background(.gray600)
                HStack(spacing: 0) {
                    ForEach(tabs.indices, id: \.self) { index in
                        Button {
                            selectedTab = index
                        } label: {
                            VStack(spacing: 8) {
                                Image(tabs[index].image)
                                    .renderingMode(.template)
                                    .frame(width: 24, height: 24)
                                Text(tabs[index].label)
                                    .font(.system(size: 12))
                            }
                            .foregroundStyle(selectedTab == index ? .white : .gray500)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 3)
                        }
                    }
                }
                .padding(.bottom, 34)
                .padding(.top, 17)
                .background(.black)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
}
