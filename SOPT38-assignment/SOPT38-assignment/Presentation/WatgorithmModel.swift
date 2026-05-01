//
//  WatgorithmModel.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

struct WatgorithmModel {
    let posterImg: UIImage
}

extension WatgorithmModel {
    static func dummy() -> [WatgorithmModel] {
        return [
            WatgorithmModel(posterImg: .miniPoster1),
            WatgorithmModel(posterImg: .miniPoster2),
            WatgorithmModel(posterImg: .miniPoster3),
            WatgorithmModel(posterImg: .miniPoster1),
            WatgorithmModel(posterImg: .miniPoster2),
            WatgorithmModel(posterImg: .miniPoster3),
            WatgorithmModel(posterImg: .miniPoster1),
            WatgorithmModel(posterImg: .miniPoster2),
            WatgorithmModel(posterImg: .miniPoster3),
            WatgorithmModel(posterImg: .miniPoster1)
        ]
    }
}
