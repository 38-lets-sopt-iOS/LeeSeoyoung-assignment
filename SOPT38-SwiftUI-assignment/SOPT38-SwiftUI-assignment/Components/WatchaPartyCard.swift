//
//  WatchaPartyCard.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct WatchaPartyCard: View {
    var imageName: String
    var startTime: String
    var title: String
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 6) {
                Image("\(imageName)")
                    .resizable()
                    .frame(width: 196, height: 139)
                    .aspectRatio(contentMode: .fit)
                Text("오늘 \(startTime)에 시작")
                    .foregroundStyle(.pink)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.leading, 8)
                Text("# \(title)")
                    .foregroundStyle(.white)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding([.leading, .bottom], 8)
            }.background(.gray600)
            Image(.alarm)
                .padding(7)
        }
    }
}

#Preview {
    WatchaPartyCard(imageName: "party1", startTime: "21:13", title: "왕과 사는 남자")
}
