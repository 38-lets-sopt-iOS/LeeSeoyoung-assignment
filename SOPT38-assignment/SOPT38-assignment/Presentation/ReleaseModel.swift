//
//  ReleaseModel.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

struct ReleaseModel {
    let posterImg: UIImage
}

extension ReleaseModel {
    static func dummy() -> [ReleaseModel] {
        return [
            ReleaseModel(posterImg: .miniPoster1),
            ReleaseModel(posterImg: .miniPoster2),
            ReleaseModel(posterImg: .miniPoster3),
            ReleaseModel(posterImg: .miniPoster1),
            ReleaseModel(posterImg: .miniPoster2),
            ReleaseModel(posterImg: .miniPoster3),
            ReleaseModel(posterImg: .miniPoster1),
            ReleaseModel(posterImg: .miniPoster2),
            ReleaseModel(posterImg: .miniPoster3),
            ReleaseModel(posterImg: .miniPoster1)
        ]
    }
}
