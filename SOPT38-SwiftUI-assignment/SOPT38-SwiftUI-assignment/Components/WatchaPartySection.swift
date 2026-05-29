//
//  WatchaPartySection.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct WatchaPartySection: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("왓챠 파티")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                Spacer()
                Text("더보기")
                    .foregroundStyle(.gray100)
                    .font(.caption)
            }.padding(.horizontal, 24)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Spacer()
                    WatchaPartyCard(imageName: "party1", startTime: "21:13", title: "왕과 사는 남자")
                    WatchaPartyCard(imageName: "party2", startTime: "22:22", title: "파묘")
                    WatchaPartyCard(imageName: "party1", startTime: "23:30", title: "왕과 사는 남자")
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

#Preview {
    WatchaPartySection()
}
