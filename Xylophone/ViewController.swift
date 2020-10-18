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

    @IBAction func cKey(_ sender: Any) {
        playSound("C")
    }
    
    @IBAction func dKey(_ sender: UIButton) {
        playSound("D")
    }
    
    @IBAction func eKey(_ sender: UIButton) {
        playSound("E")
    }
    
    @IBAction func fKey(_ sender: UIButton) {
        playSound("F")
    }
    
    
    @IBAction func gKey(_ sender: UIButton) {
        playSound("G")
    }
    
    @IBAction func aKey(_ sender: UIButton) {
        playSound("A")
    }
    
    @IBAction func bKey(_ sender: UIButton) {
        playSound("B")
    }
    
    func playSound(_ key: String) {
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
