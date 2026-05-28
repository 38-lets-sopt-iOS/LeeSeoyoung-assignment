//
//  NewContentModel.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

struct NewContentModel {
    let posterImg: UIImage
}

extension NewContentModel {
    static func dummy() -> [NewContentModel] {
        return [
            NewContentModel(posterImg: .newPoster1),
            NewContentModel(posterImg: .newPoster2),
            NewContentModel(posterImg: .newPoster3),
            NewContentModel(posterImg: .newPoster1),
            NewContentModel(posterImg: .newPoster2)
        ]
    }
}
