//
//  SubscriptionView.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack() {
                HeaderView()
                ScrollView(showsIndicators: false) {
                    MainPosterView()
                    Spacer().frame(height: 34)
                    VStack(spacing: 45) {
                        NewContentSection()
                        WatgorithmSection()
                        ReleaseSection()
                        WatchaPartySection()
                        Spacer().frame(height: 149)
                    }
                }
            }
        }
    }
}

#Preview {
    SubscriptionView()
}
