//
//  WatchaPartyModel.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

struct WatchaPartyModel {
    let posterImg: UIImage
    let startTime: String
    let title: String
    let isAlarmOn: Bool
}

extension WatchaPartyModel {
    static func dummy() -> [WatchaPartyModel] {
        return [
            WatchaPartyModel(posterImg: .party1, startTime: "21:00", title: "왕과 사는 남자", isAlarmOn: true),
            WatchaPartyModel(posterImg: .party2, startTime: "22:30", title: "파묘", isAlarmOn: true),
            WatchaPartyModel(posterImg: .party1, startTime: "23:00", title: "왕과 사는 남자", isAlarmOn: true)
        ]
    }
}
