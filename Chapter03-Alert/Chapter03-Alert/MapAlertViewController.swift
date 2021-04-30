//
//  MapAlertViewController.swift
//  Chapter03-Alert
//
//  Created by N on 2021/04/30.
//

import UIKit
import MapKit

class MapAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let alertBtn = UIButton(type: .system)
        
        alertBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width / 2
        alertBtn.setTitle("Map Alert", for: .normal)
        alertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(alertBtn)
        
        let imageBtn = UIButton(type: .system)
        
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.width / 2
        imageBtn.setTitle("Image Alert", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(imageBtn)
        
        let sliderBtn = UIButton(type: .system)
        
        sliderBtn.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        sliderBtn.center.x = self.view.frame.width / 2
        sliderBtn.setTitle("Slider Alert", for: .normal)
        sliderBtn.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(sliderBtn)

        
        let listBtn = UIButton(type: .system)
        
        listBtn.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        listBtn.center.x = self.view.frame.width / 2
        listBtn.setTitle("List Alert", for: .normal)
        listBtn.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(listBtn)

    }
    
    @objc
    func mapAlert(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        let contentVC = MapKitViewController()
//        let contentVC = UIViewController()
        
//        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        contentVC.view = mapkitView
//        //높이값 할당
//        contentVC.preferredContentSize.height = 200
//
//        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
//
//        //지도에서 보여줄 넓이, 일종의 축척, 숫자가 작을수록 좁은 범위를 확대시켜서 보여준다.
//        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.05)
//        //지도 영역을 정의
//        let region = MKCoordinateRegion(center: pos, span: span)
//
//        mapkitView.region = region
//        mapkitView.regionThatFits(region)
//
//        let point = MKPointAnnotation()
//        point.coordinate = pos
//        mapkitView.addAnnotation(point)
//
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false, completion: nil)
    }
    
    @objc
    func imageAlert(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "이번 글의 평점은 다음과 같습니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false, completion: nil)
    }
    
    @objc
    func sliderAlert(_ sender: Any) {
        let contentVC = ControlViewController()
        
        let alert = UIAlertController(title: nil, message: "이번 글의 평점을 입력해주세요.", preferredStyle: .alert)
        alert.setValue(contentVC, forKey: "contentViewController")
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            print(">>> slider Value = \(contentVC.sliderValue)")
        }
        alert.addAction(okAction)
        
        self.present(alert, animated: false, completion: nil)
    }
    
    @objc
    func listAlert(_ sender: Any) {
        let contentVC = ListViewController()
        
        contentVC.delegate = self
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.setValue(contentVC, forKey: "contentViewController")
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: false, completion: nil)
        
    }

    func didSelectRowAt(indexPath: IndexPath) {
        print(">>> 선택된 행은 \(indexPath.row)입니다.")
    }
}
