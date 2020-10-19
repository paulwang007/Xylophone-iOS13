//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onPress(_ sender: UIButton) {
        sender.isOpaque = false
        sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(0.5)
    }
    
    @IBAction func cKey(_ sender: UIButton) {
        playSound(sender.currentTitle)
        
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(1)
        }
    }
    
    func playSound(_ key: String?) {
        guard let url = Bundle.main.url(forResource: key, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
