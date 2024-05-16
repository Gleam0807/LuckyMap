//
//  ViewController.swift
//  LuckyMap
//
//  Created by SUNG on 5/16/24.
//

import UIKit
import NMapsMap
import CoreLocation


class ViewController: UIViewController {
    let mapView = MapView()
    var locationManager = CLLocationManager()
    
    override func loadView() {
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLocationData()
        
        startLocationUpdates()
    }
    
    func setLocationData() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            print("위치 서비스가 허용되었습니다.")
            startLocationUpdates()
        case .notDetermined:
            print("위치 권한이 아직 요청되지 않았습니다.")
        case .restricted, .denied:
            print("위치 서비스가 허용되지 않았습니다.")
        @unknown default:
            break
        }
    }
    
    func startLocationUpdates() {
        // 위치 업데이트 시작
        locationManager.startUpdatingLocation()
        if let location = locationManager.location {
            // 현재 위치로 카메라 이동
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude))
            cameraUpdate.animation = .easeIn
            mapView.naverMapView.moveCamera(cameraUpdate)
            
            // 현재 위치에 마커 추가
            let marker = NMFMarker()
            marker.position = NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
            marker.mapView = mapView.naverMapView
        }
    }
}

#Preview {
    ViewController()
}


