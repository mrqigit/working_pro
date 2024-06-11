//
//  LocationCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/10.
//

import UIKit
import CoreLocation

class LocationCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(locationBtn)
        locationBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        
        view.addSubview(locationInfo)
        locationInfo.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(locationBtn.snp.bottom).offset(20)
            make.bottom.equalTo(-30)
        }
    }
    
    lazy var locationBtn: UIButton = {
        return createButton("获取定位", .red, #selector(getUserLocation), self)
    }()
    
    lazy var locationInfo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .red
        return label
    }()
    
    @objc
    func getUserLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    lazy var manager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.distanceFilter = kCLLocationAccuracyBestForNavigation
        return manager
    }()

}

extension LocationCtrl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.isEmpty {
            return
        }
        
        guard let location = locations.first else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) {[weak self] (placeMark, _) in
            print(placeMark)
        }
    }
}
