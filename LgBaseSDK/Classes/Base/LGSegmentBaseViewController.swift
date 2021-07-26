//
//  LGSegmentBaseViewController.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/5/24.
//

import UIKit
import JXSegmentedView

open class LGSegmentBaseViewController: LGViewController {
    
    /// 返回segment的控制器
    public var childViewController : ((_ index: Int) -> LGViewController)?
    /// 返回布局
    public var segmentedFrame: (() -> CGRect)?
    public var listContainerViewFrame: (() -> CGRect)?
    /// segment的数据源
    public var segmentedDataSource: JXSegmentedBaseDataSource? {
        didSet {
            //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
            segmentedView.dataSource = segmentedDataSource
            segmentedView.delegate = self
            view.addSubview(segmentedView)
            
            segmentedView.listContainer = listContainerView
            view.addSubview(listContainerView)
        }
    }
    /// 指示 JXSegmentedIndicatorBaseView
    public var indicators: [JXSegmentedIndicatorProtocol & UIView]? {
        didSet {
            segmentedView.indicators = indicators!
        }
    }

    open var segmentedView = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView = {
        return JXSegmentedListContainerView(dataSource: self)
    }()

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //处于第一个item的时候，才允许屏幕边缘手势返回
        navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let frame = segmentedFrame?() {
            segmentedView.frame = frame
        }

        if let frame = listContainerViewFrame?() {
            listContainerView.frame = frame
        }
    }
    
    
}

extension LGSegmentBaseViewController: JXSegmentedViewDelegate {
    open func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        if let dotDataSource = segmentedDataSource as? JXSegmentedDotDataSource {
            //先更新数据源的数据
            dotDataSource.dotStates[index] = false
            //再调用reloadItem(at: index)
            segmentedView.reloadItem(at: index)
        }

        navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }
}

extension LGSegmentBaseViewController: JXSegmentedListContainerViewDataSource {
    open func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource {
            return titleDataSource.dataSource.count
        }
        return 0
    }

    open func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        return childViewController!(index)
    }
}
