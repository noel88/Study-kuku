//
//  FrontViewController.swift
//  Chapter04-SideBar
//
//  Created by Xiah Lee on 2021/05/03.
//

import UIKit

class FrontViewController: UIViewController {

    @IBOutlet weak var sideBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let revealVC = self.revealViewController() {
            self.sideBarButton.target = revealVC
            self.sideBarButton.action = #selector(revealVC.revealToggle(_:))
            
            //스와이프 제스처 인식
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
        
    }
    
}
