//
//  NoneNaviViewController.swift
//  VCTransition
//
//  Created by HWAKSEONG KIM on 2022/07/29.
//

import UIKit

class NoneNaviViewController: UIViewController {
    
    var firstSceneDetector: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationUI()
    }
    
    func configureNavigationUI() {
        title = "최초화면"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(tappedNextButton))
        
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        UserDefaults.standard.set(firstSceneDetector, forKey: "FirstSceneDetector")
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate =  windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Main2", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RealMainViewController") as! RealMainViewController
        
        sceneDelegate?.window?.rootViewController = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.makeKeyAndVisible()
        
    }
    
    
    @objc func tappedNextButton() {
        
        
        print("그냥 달아준거야~")
        
    }

}
