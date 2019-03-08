//
//  LaunchPage2.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit
import AVFoundation
import Lottie

class LaunchPage2: UIViewController {
    
    @IBOutlet weak var assistantView: UIImageView!
    @IBOutlet weak var getContactAnimationView: LOTAnimationView!
    @IBOutlet weak var getDirectionAnimationView: LOTAnimationView!
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        assistantView.wiggle()
    }
    
    @IBAction func gotItOnClick(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as UIViewController
        let navController = UINavigationController(rootViewController: vc)
        
        self.present(navController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        assistantView.wiggle()
        startAnimation()
        let utterance = AVSpeechUtterance(string: " If you want to get contact with school you may click on get contact button and if you want to go there just click get direction and see how i can show you the route. Thank you for having me." )
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        synthesizer.stopSpeaking(at: AVSpeechBoundary(rawValue: 0)!)
    }
    func startAnimation(){
        getDirectionAnimationView.setAnimation(named: "1788-d")
        getDirectionAnimationView.loopAnimation = true
        getDirectionAnimationView.play()
        getContactAnimationView.setAnimation(named: "4198-new-message-notification (1)")
        getContactAnimationView.loopAnimation = true
        getContactAnimationView.play()
        
        
        
    }
    
}
