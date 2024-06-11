//
//  TabBarViewController.swift
//  LuckyMap
//
//  Created by SUNG on 5/16/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        setAttribute()
    }
    
    func setTabbar() {
         let appearanceTabbar = UITabBarAppearance()
         appearanceTabbar.configureWithOpaqueBackground()
         appearanceTabbar.backgroundColor = UIColor.white
         tabBar.standardAppearance = appearanceTabbar
         tabBar.tintColor = .black
         tabBar.backgroundColor = .white
     }
     
     // MARK: - Tabbar 화면이동 및 눌렸을때/눌리지 않았을때 이미지 Set
     func setAttribute() {
         viewControllers = [
            createNavController(for: ViewController(), title: "", image: UIImage(systemName: "map")!, selectedImage: UIImage(systemName: "map.fill")!),
           createNavController(for: LottoViewController(), title: "", image: UIImage(systemName: "list.bullet.rectangle")!, selectedImage: UIImage(systemName: "message")!)
         ]
     }
     
     // MARK: - Tabbar 화면이동 및 눌렸을때/눌리지 않았을때 이미지 Set
     fileprivate func createNavController(for rootViewController: UIViewController, title: String?, image: UIImage, selectedImage: UIImage) -> UIViewController {
         
         let navController = UINavigationController(rootViewController:  rootViewController)
         navController.tabBarItem.title = title
         navController.tabBarItem.image = image
         navController.tabBarItem.selectedImage = selectedImage
         navController.interactivePopGestureRecognizer?.delegate = nil // 스와이프 제스처
         return navController
     }
}
