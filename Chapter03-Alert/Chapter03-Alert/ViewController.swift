//
//  ViewController.swift
//  Chapter03-Alert
//
//  Created by N on 2021/04/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertBtn.center.x = self.view.frame.width / 2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(defaultAlertBtn)
    }
    
    @objc
    func defaultAlert(_ sender: Any) {
        // Title이 nil일시 해당 공간을 삭제한다.
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        
        // 알림창에 커스텀하게 들어가는 View
        let v = UIViewController()
        v.view.backgroundColor = UIColor.red
        alert.setValue(v, forKey: "contentViewController")
        
        self.present(alert, animated: false, completion: nil)
    }


}

