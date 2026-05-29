//
//  HeaderView.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Spacer()
                Image(.video)
                Image(.notification)
                Image(.profile)
            }
            .padding(.horizontal, 30)
            .padding(.top, 18)
            HStack {
                Text("구독")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 15)
            Divider().background(Color.gray600)
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

#Preview {
    HeaderView()
}
