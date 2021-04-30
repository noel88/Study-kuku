//
//  ControlViewController.swift
//  Chapter03-Alert
//
//  Created by N on 2021/04/30.
//

import UIKit

class ControlViewController: UIViewController {

    let slider = UISlider()
    
    //프로퍼티 정의시 get만 있다면 키워드 생략 가능
    var sliderValue: Float {
        return self.slider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        
        self.slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        self.view.addSubview(self.slider)
        
        self.preferredContentSize = CGSize(width: self.slider.frame.width, height: self.slider.frame.height + 10)
        
    }
    
}
