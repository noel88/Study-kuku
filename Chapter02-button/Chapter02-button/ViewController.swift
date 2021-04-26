//
//  ViewController.swift
//  Chapter02-button
//
//  Created by N on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //버튼 인스턴스를 생성하고, 속성을 설정한다.
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("테스트 버튼", for: .normal)
        
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
    }

    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        // 구현내용
    }
    
    @objc func btnOnClick(_ sender: Any) {
        if let btn = sender as? UIButton {
            btn.setTitle("클릭되었습니다.", for: .normal)
        }
    }

}

