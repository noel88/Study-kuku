//
//  RevealViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by Xiah Lee on 2021/05/03.
//

import UIKit

class RevealViewController: UIViewController {

    var contentVC: UIViewController?
    var sideVC: UIViewController?
    
    var isSideBarShowing = false
    
    let SLID_TIME = 0.3
    let SIDEBAR_WIDTH: CGFloat = 260
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }
    
    //초기 화면을 설정한다
    func setupView() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            self.contentVC = vc
            // _프론트컨트롤러 객체를 메인 컨트롤러의 자식으로 등록함.
            self.addChild(vc)
            // _프론트컨트롤러의 뷰를 메인 컨트롤러의 서브 뷰로 등록.
            self.view.addSubview(vc.view)
            
            // _프론트 컨트롤러에 부모 뷰 컨트롤러가 바뀌었음을 알려준다.
            vc.didMove(toParent: self)
            
            let frontVC = vc.viewControllers[0] as? FrontViewController
            frontVC?.delegate = self
        }
    }
    
    //사이드 바의 뷰를 읽어온다
    func getSideView() {
        if self.sideVC == nil {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") {
                self.sideVC = vc
                
                self.addChild(vc)
                self.view.addSubview(vc.view)
                
                vc.didMove(toParent: self)
                self.view.bringSubviewToFront(self.contentVC!.view)
            }
        }
    }

    //콘텐츠 뷰에 그림자 효과를 준다.
    func setShadowEffect(shadow: Bool, offset: CGFloat) {
        if (shadow == true) {
            self.contentVC?.view.layer.cornerRadius = 10
            self.contentVC?.view.layer.shadowOpacity = 0.8
            self.contentVC?.view.layer.shadowColor = UIColor.black.cgColor
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        } else {
            self.contentVC?.view.layer.cornerRadius = 0.0
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    //사이드 바를 연다.
    func openSideBar(_ complete: ( () -> Void)?) {
        self.getSideView()
        self.setShadowEffect(shadow: true, offset: -2)
        
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(self.SLID_TIME), delay: TimeInterval(0), options: options, animations: {
            self.contentVC?.view.frame = CGRect(x: self.SIDEBAR_WIDTH, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: {
            if $0 == true {
                self.isSideBarShowing = true
                complete?()
            }
        })
    }
    
    //사이드 바를 닫는다.
    func closeSideBar(_ complete: ( () -> Void)?) {
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(self.SLID_TIME), delay: TimeInterval(0), options: options, animations: {
            self.contentVC?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: {
            if $0 == true {
                self.sideVC?.view.removeFromSuperview()
                self.sideVC = nil
                self.isSideBarShowing = false
                self.setShadowEffect(shadow: false, offset: 0)
                complete?()
            }
        })
    }

}
