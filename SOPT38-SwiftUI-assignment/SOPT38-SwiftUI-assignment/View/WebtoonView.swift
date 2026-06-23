//
//  WebtoonView.swift
//  SOPT38-SwiftUI-assignment
//
//  Created by Seoyoung Lee on 5/29/26.
//

import SwiftUI

struct WebtoonView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("웹툰").foregroundStyle(.white)
        }
    }
}

#Preview {
    WebtoonView()
}
