//
//  MainViewController.swift
//  DailyTodo
//
//  Created by NUNU:D on 5/18/24.
//

import UIKit
import RxSwift

/// Main화면에 대한 ViewController 클래스 입니다.
public final class MainViewController: BaseViewController {

    /// '오늘의 진척도' 제목 레이블
    private var titleLabel = UILabel().then {
        $0.text = "오늘의 진척도"
        $0.textColor = .black
        $0.font = FontDesign.title30heavy
    }
    /// '오늘 할일이 N개 남았습니다'  내용 레이블
    private var subTitleLabel = UILabel().then {
        $0.text = "오늘 할일이 N개 남았습니다."
        $0.textColor = .black
        $0.font = FontDesign.subTitle14heavy
    }
    /// 진척도 퍼센테이지 레이블
    private var percentageLabel = UILabel().then {
        $0.text = "70 %"
        $0.textColor = .black
        $0.textAlignment = .right
        $0.font = FontDesign.content50heavy
    }
    /// 진척도 프로그래스바
    private var progressView = UIProgressView().then {
        $0.progress = 0.7
        $0.tintColor = .main
        $0.trackTintColor = .enable
    }
    /// 뷰를 그리기 위한 콜렉션 뷰
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeCompositionalLayout()
    ).then {
        $0.showsVerticalScrollIndicator = false
        
        $0.register(
            TodoCollectionViewCell.self,
            forCellWithReuseIdentifier: TodoCollectionViewCell.identifier
        )
        
        $0.register(
            PriorityCardCollectionViewCell.self,
            forCellWithReuseIdentifier: PriorityCardCollectionViewCell.identifier
        )
        
        $0.backgroundView = list.isEmpty ? emptyView : nil
    }
    
    /// 메인 화면에 데이터가 없을 경우 보여질 빈 화면
    private var emptyView = EmptyView()
    
    //FIXME: 제거예정
    private var list: [String] = {
        return (0...10).map { "Todo \($0)" }
//        return []
    }()
    
    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(rootFlexContainer)
        
        rootFlexContainer.flex.direction(.column).define { flex in
            
            flex.addItem()
                .padding(30)
                .direction(.column)
                .define {
                    $0.addItem(titleLabel)
                        .marginBottom(8)
                    $0.addItem(subTitleLabel)
                }
            
            flex.addItem()
                .padding(15)
                .define {
                    $0.addItem(percentageLabel)
                        .marginBottom(20)
                    $0.addItem(progressView)
                    
                }
            
            flex.addItem(collectionView).grow(1)
        }
        
        //FIXME: subscribe구문이 실행되지않음. 수정 필요
        emptyView.createTodoPublished
            .subscribe(onNext: {
                print("tapped")
            })
            .disposed(by: disposeBag)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rootFlexContainer.pin.all(view.pin.safeArea)
        rootFlexContainer.flex.layout()
    }
}

private extension MainViewController {
    /// 우선순위 카드뷰 레이아웃 함수
    func makeProritySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 20,
            bottom: 0,
            trailing: 0
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .absolute(100)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        return section
    }
    
    /// 할일목록 리스트 카드 뷰 레이아웃 함수
    func makeTodoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 20,
            trailing: 0
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(120)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 20,
            leading: 20,
            bottom: 20,
            trailing: 20
        )
        
        return section
    }
    
    /// 콜렉션 뷰 레이아웃 함수
    func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, envoriment in
            switch section {
            case 0:
                self.makeProritySection()
            default:
                self.makeTodoSection()
            }
        }
    }
}

// FIXME: RXDataSource 변경예정
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "PriorityCardCollectionViewCell",
                for: indexPath
            ) as! PriorityCardCollectionViewCell
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TodoCollectionViewCell",
                for: indexPath
            ) as! TodoCollectionViewCell
            
            return cell
        }
    }
}

//MARK: - Preview
@available(iOS 17.0, *)
#Preview("메인화면", traits: .portrait, body: {
    UINavigationController(rootViewController: MainViewController())
})

