//
//  UIFont+.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit

extension UIFont {
    enum Pretendard {
        static func black(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Black", size: size) ?? .systemFont(ofSize: size, weight: .black)
        }
        static func extraBold(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-ExtraBold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        }
        static func bold(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        }
        static func semiBold(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-SemiBold", size: size) ?? .systemFont(ofSize: size, weight: .semibold)
        }
        static func medium(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Medium", size: size) ?? .systemFont(ofSize: size, weight: .medium)
        }
        static func regular(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        }
        static func light(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Light", size: size) ?? .systemFont(ofSize: size, weight: .light)
        }
        static func extraLight(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-ExtraLight", size: size) ?? .systemFont(ofSize: size, weight: .ultraLight)
        }
        static func thin(size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Thin", size: size) ?? .systemFont(ofSize: size, weight: .thin)
        }
    }
    enum Watcha {
        static let head1 = Pretendard.bold(size: 30)
        static let head2 = Pretendard.semiBold(size: 23)
        static let head3 = Pretendard.semiBold(size: 20)
        static let subhead1 = Pretendard.semiBold(size: 18)
        static let subhead2 = Pretendard.semiBold(size: 15)
        static let subhead3 = Pretendard.semiBold(size: 12)
        static let medium = Pretendard.medium(size: 18)
        static let body1 = Pretendard.medium(size: 12)
        static let body2 = Pretendard.regular(size: 12)
        static let cap1 = Pretendard.regular(size: 12)
    }
}
