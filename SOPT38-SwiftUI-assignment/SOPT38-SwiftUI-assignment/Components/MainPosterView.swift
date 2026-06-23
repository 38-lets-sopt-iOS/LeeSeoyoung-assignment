//
//  MainPosterView.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct MainPosterView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                Spacer()
                Image(.mainPoster1)
                    .resizable()
                    .frame(width: 273, height: 399)
                    .aspectRatio(contentMode: .fit)
                Image(.mainPoster2)
                    .resizable()
                    .frame(width: 273, height: 399)
                    .aspectRatio(contentMode: .fit)
                Image(.mainPoster3)
                    .resizable()
                    .frame(width: 273, height: 399)
                    .aspectRatio(contentMode: .fit)
                Image(.mainPoster1)
                    .resizable()
                    .frame(width: 273, height: 399)
                    .aspectRatio(contentMode: .fit)
                Image(.mainPoster2)
                    .resizable()
                    .frame(width: 273, height: 399)
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
        }
    }
}

#Preview {
    MainPosterView()
}
