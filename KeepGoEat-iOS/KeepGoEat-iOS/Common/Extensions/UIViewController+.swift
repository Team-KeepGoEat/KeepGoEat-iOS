//
//  UIViewController+.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation
import SwiftUI

/// SwiftUI를 이용한 프리뷰 표시
#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
// 아래 코드를 원하는 뷰컨 맨 아래에 넣고 swiftUI 임포트해주기
//struct ViewControllerPreView: PreviewProvider {
//  static var previews: some View {
//    뷰컨 이름().toPreview()
//  }
//}
