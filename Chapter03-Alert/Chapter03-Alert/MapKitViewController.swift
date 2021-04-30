//
//  MapKitViewController.swift
//  Chapter03-Alert
//
//  Created by N on 2021/04/30.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = mapkitView
        self.preferredContentSize.height = 200
        
        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        
        //지도에서 보여줄 넓이, 일종의 축척, 숫자가 작을수록 좁은 범위를 확대시켜서 보여준다.
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.05)
        //지도 영역을 정의
        let region = MKCoordinateRegion(center: pos, span: span)
        
        mapkitView.region = region
        mapkitView.regionThatFits(region)
        
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapkitView.addAnnotation(point)
    }
    

}
