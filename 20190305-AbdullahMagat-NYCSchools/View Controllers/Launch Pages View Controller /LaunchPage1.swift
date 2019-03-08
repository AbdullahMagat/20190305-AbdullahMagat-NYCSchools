//
//  LaunchPage1.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit
import AVFoundation
import Lottie

class LaunchPage1: UIViewController {
    
    @IBOutlet weak var assistanImage: UIImageView!
    @IBOutlet weak var findAnimationView: LOTAnimationView!
    
    //MARK: Text to speech for assistant
    let synthesizer = AVSpeechSynthesizer()
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        assistanImage.wiggle()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        assistanImage.wiggle()
        startAnimation()
        
        let utterance = AVSpeechUtterance(string: "Hello sir! I will assist you to find the schools in New York area. When you finish the launch pages all the schools list will be displayed in your screen. You can search for a school in the list or you can see them on the map. Once you click the annotaiton or tableviewcell I will show you the details for selected school. Please swipe to the right")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
    override func viewWillDisappear(_ animated: Bool) {
        synthesizer.stopSpeaking(at: AVSpeechBoundary(rawValue: 0)!)
    }
    func startAnimation(){
        
        findAnimationView.setAnimation(named: "2642-search")
        findAnimationView.loopAnimation = true
        findAnimationView.play()
        
        
        
    }
}
