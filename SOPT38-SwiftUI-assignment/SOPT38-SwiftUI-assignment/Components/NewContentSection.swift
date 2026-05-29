//
//  NewContentSection.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct NewContentSection: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                VStack(alignment: .leading) {
                    Text("방금 막 도착한 신상 컨텐츠")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                    Text("예능부터 드라마까지!")
                        .foregroundStyle(.gray100)
                        .font(.headline)
                        .bold()
                }
                Spacer()
            }.padding(.horizontal, 24)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Spacer()
                    Image(.newPoster1)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .aspectRatio(contentMode: .fit)
                    Image(.newPoster2)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .aspectRatio(contentMode: .fit)
                    Image(.newPoster3)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .aspectRatio(contentMode: .fit)
                    Image(.newPoster1)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .aspectRatio(contentMode: .fit)
                    Image(.newPoster2)
                        .resizable()
                        .frame(width: 321, height: 180)
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
    NewContentSection()
}
