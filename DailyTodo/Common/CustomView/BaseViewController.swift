//
//  BaseViewController.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit
import FlexLayout
import PinLayout
import Then
import RxSwift
import ReactorKit

/// 모든 뷰에 사용되는 베이스 화면 컨트롤러
open class BaseViewController: UIViewController {
    
    /// FlexLayout을 사용하기 위한 루트 컨테이너 뷰
    public let rootFlexContainer = UIView()
    
    /// 각 뷰컨트롤러에서 사용할 DisposeBag
    public let disposeBag = DisposeBag()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        /// 뷰 백그라운드 색상 지정
        view.backgroundColor = .white
    }
}
