//
//  ViewController.swift
//  Chapter03-CSStepper
//
//  Created by N on 2021/05/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let steppter = CSStepper()
        steppter.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        
        steppter.addTarget(self, action: #selector(logging(_:)), for: .valueChanged)
        self.view.addSubview(steppter)
    }
    
    @objc
    func logging(_ sender: CSStepper) {
        NSLog("현재 스테퍼의 값은 \(sender.value) 입니다.")
    }


}

