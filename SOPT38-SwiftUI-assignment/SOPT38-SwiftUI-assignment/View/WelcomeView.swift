//
//  WelcomeView.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer().frame(height: 42)
                Image(.watchaLogo)
                Spacer().frame(height: 54)
                Text("서영님\n가입을 환영합니다!")
                    .foregroundStyle(.white)
                    .font(.title2).bold()
                    .multilineTextAlignment(.center)
                Spacer()
                Button("메인으로") {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isLoggedIn = true
                    }
                }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.pink)
                .cornerRadius(10)
                .contentShape(Rectangle())
                .padding(.horizontal, 22)
            }
        }
    }
}

#Preview {
    WelcomeView(isLoggedIn: .constant(false))
}
