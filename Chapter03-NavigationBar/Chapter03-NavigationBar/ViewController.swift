//
//  ViewController.swift
//  Chapter03-NavigationBar
//
//  Created by N on 2021/04/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.initTitle()
//        self.initTitleNew()
//        self.initTitleImage()
        self.initTitleInput()
    }
    
    func initTitleInput() {
        let tf = UITextField()
        
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = .white
        tf.font = .systemFont(ofSize: 13)
        tf.autocapitalizationType = .none // 자동 대문자 속성 사용안함
        tf.autocorrectionType = .no // 자동 입력 기능 헤제
        tf.spellCheckingType = .no // 스펠링 체크 기능 해제
        tf.keyboardType = .URL
        tf.keyboardAppearance = .dark
        tf.layer.borderWidth = 0.3
        tf.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        self.navigationItem.titleView = tf
        
//        let v = UIView()
//        v.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
//        v.backgroundColor = .brown
//
//        let leftItem = UIBarButtonItem(customView: v)
//        self.navigationItem.leftBarButtonItem = leftItem
        
        let back = UIImage(named: "arrow-back")
        let leftItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 100, height: 37)
//        rv.backgroundColor = .red
        
        let cnt = UILabel(frame: CGRect(x: 10, y: 8, width: 20, height: 20))
        cnt.font = .boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        
        cnt.layer.cornerRadius = 3
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        rv.addSubview(cnt)
        
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named: "more"), for: .normal)
        
        rv.addSubview(more)
        
        let rightItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    
    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        
        self.navigationItem.titleView = imageV
    }
    
    func initTitleNew() {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = .systemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "58개 숙소"
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = .systemFont(ofSize: 15)
        subTitle.textColor = .white
        subTitle.text = "1박 (1월 10일 ~ 1월 11일)"
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        self.navigationItem.titleView = containerView
        
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func initTitle() {
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        nTitle.numberOfLines = 2
        nTitle.textAlignment = .center
        nTitle.textColor = .white
        nTitle.font = .systemFont(ofSize: 15)
        nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        
        self.navigationItem.titleView = nTitle
        
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }


}

