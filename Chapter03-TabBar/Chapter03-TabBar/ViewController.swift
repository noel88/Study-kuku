//
//  ViewController.swift
//  Chapter03-TabBar
//
//  Created by N on 2021/04/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "첫 번째 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.sizeToFit() //콘텐츠의 내용에 맞게 레이블 크기 변경
        title.center.x = self.view.frame.width / 2
        self.view.addSubview(title)
        
//        self.tabBarItem.image = UIImage(named: "calendar.png")
//        self.tabBarItem.title = "Calendar"
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        
        
        // 트레일링 클로저
        // 메소드의 마지막 매개변수가 클로저를 인자값으로 입력받는 경우 인자값의 위치에 클로저 구문을 넣지 않고,
        // 대신 메소드 뒤쪽에 실행 블록처럼 붙일 수 있도록 하는 예외 문법.
        UIView.animate(withDuration: TimeInterval(0.15)) {
            // 호출될 때마다 점점 투명해졌다가 점점 진해짐.
            tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
        }
    }

}

