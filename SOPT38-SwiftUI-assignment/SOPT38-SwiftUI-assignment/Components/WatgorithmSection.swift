//
//  WatgorithmSection.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct WatgorithmSection: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Image(.watgorithm)
                Spacer()
            }.padding(.horizontal, 24)
            HStack(alignment: .top) {
                Text("예능부터 드라마까지!")
                    .foregroundStyle(.gray100)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                Text("더보기")
                    .foregroundStyle(.gray100)
                    .font(.caption)
            }.padding(.horizontal, 24)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Spacer()
                    Image(.miniPoster1)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster2)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster3)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster1)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster2)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster3)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster1)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster2)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster3)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Image(.miniPoster1)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

#Preview {
    WatgorithmSection()
}
