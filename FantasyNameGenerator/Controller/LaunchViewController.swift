//
//  ViewController.swift
//  FantasyNameGenerator
//
//  Created by Field Employee on 3/24/21.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: { [self] in
            setupAnimation()
            animationFade()
        })
    }
    
    func setupAnimation(){
        animationView.animation = Animation.named("loading")
        animationView.frame = view.bounds
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }
    
    func animationFade(){
        var alpha = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute:{
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block:{ [self]_ in
                alpha = alpha-0.1
                animationView.alpha = CGFloat(alpha)
            })//end timer
            DispatchQueue.main.asyncAfter(deadline: .now()+1.25, execute: { [self] in
                performSegue(withIdentifier: segueIdentifier, sender: self)
            })//end segue
        })//end dispatch queue
    }//end animationFade

let animationView = AnimationView()
let segueIdentifier = "toHomeSegue"
}

