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
open class BaseViewController: UIViewController, UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        
    }
    

    /// FlexLayout을 사용하기 위한 루트 컨테이너 뷰
    public let rootFlexContainer = UIView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = false
    }
    
    open func setSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = true
        self.navigationItem.searchController = searchController
    }
}
