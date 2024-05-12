//
//  LaunchViewController.swift
//  GitMate
//
//  Created by Yomna Othman on 01/05/2024.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {

    @IBOutlet weak var launchAnimationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view")
        showLaunchAnimation()
        // Do any additional setup after loading the view.
    }
    
    func showLaunchAnimation(){
        print("animate")
        launchAnimationView.animationSpeed = 1.75
        launchAnimationView.contentMode = .scaleAspectFit
        launchAnimationView.loopMode = .loop
        launchAnimationView.play()
    }   

}
