//
//  ViewController.swift
//  DITMap
//
//  Created by D7703_30 on 2017. 8. 31..
//  Copyright © 2017년 D7703_30. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // DIT 위치정보 35.166127, 129.072616
        let center = CLLocationCoordinate2DMake(35.166127, 129.072616 )
        // 시민공원 위치정보
        let location01 = CLLocationCoordinate2DMake(35.168125, 129.057802)
        
        //반경(span)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        //지도에보여줄영역
        let region = MKCoordinateRegionMake(center,span)
        //(위치정보,반경) 반경은 똑같이할거라서 span02를 따로 만들필요없음.
        
        // 지도(myMapView)에 보여주기
        myMapView.setRegion(region, animated: true)
        //pin(annotation) 꼽기
        let anno01 = MKPointAnnotation()
        anno01.coordinate = center
        anno01.title = "DIT 동의과학대학교"
        anno01.subtitle = "나의 꿈이 자라는 곳"
        
        let anno02 = MKPointAnnotation()
        anno02.coordinate = location01
        anno02.title = "부산시민공원"
        anno02.subtitle = "시민공원임"
        
        myMapView.addAnnotation(anno01)
        myMapView.addAnnotation(anno02)
        
        // delegate 연결
        myMapView.delegate = self
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
    let identifier = "MyPin"
    var annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
       
        if annotationView == nil {
    annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView?.pinTintColor = UIColor.yellow
            //celloutAcce
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        }else{
        //nil이 아닐경우 이미 만들어진 것을 재활용
            annotationView?.annotation = annotation
        }
        if (annotation.title! == "부산시민공원" ){
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        
        leftIconView.image = UIImage(named: "download.jpg")
        
        annotationView?.leftCalloutAccessoryView = leftIconView
            
            return annotationView
        }else{
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            leftIconView.image = UIImage(named: "download2.png")
            annotationView?.leftCalloutAccessoryView = leftIconView
            return annotationView
        }  }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let viewAnno = view.annotation
        let viewTitle: String = ((viewAnno?.title)!)!
        let viewSubTitle: String =
        ((viewAnno?.subtitle)!)!
        
        print("\(viewTitle) \(viewSubTitle)")
        
        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "o", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
