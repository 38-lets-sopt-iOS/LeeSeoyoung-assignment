//
//  MainPosterModel.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

struct MainPosterModel {
    let posterImg: UIImage
}

extension MainPosterModel {
    static func dummy() -> [MainPosterModel] {
        return [
            MainPosterModel(posterImg: .mainPoster1),
            MainPosterModel(posterImg: .mainPoster2),
            MainPosterModel(posterImg: .mainPoster3),
            MainPosterModel(posterImg: .mainPoster1),
            MainPosterModel(posterImg: .mainPoster2)
        ]
    }
}
