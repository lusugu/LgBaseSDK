//
//  BTMainViewController.swift
//  BellTone
//
//  Created by 鲁术光 on 2020/12/7.
//

import UIKit
import LgBaseSDK
import JXSegmentedView

class BtMainViewController: LGSegmentBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    override func setUpViews() {
        super.setUpViews()
        
        let dataSource = JXSegmentedTitleDataSource()
        dataSource.isTitleColorGradientEnabled = true
        dataSource.titles = ["猴哥", "青蛙王子"]
        segmentedDataSource = dataSource
        
        //配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        indicators = [indicator]
        
        childViewController = { index in
            
            if index == 0 {
                return BtFristViewController()
            }
            
            return BtSecondViewController()
        }
    
        segmentedFrame = {
            return CGRect(x: 0, y: 0, width: CGFloat.width, height: 100)
        }
        
        listContainerViewFrame = {
            return CGRect(x: 0, y: 100, width: CGFloat.width, height: CGFloat.height - 100)
        }
    }
}
