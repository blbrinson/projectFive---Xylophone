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
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        
//            myFunction(parameter: DataType or argument/value)
        
        playSound(soundName: sender.currentTitle!)
        
    //        This is so that the sound will coorespond to the proper sound file
    //        based off of which button is pressed.
    //        Since it's optional, its saying this might not have a title. By inserting the exclamation point,
    //        youre saying that yeah, I know the risk, but it has a title. Please continue
        
        //Reduces the sender's (The button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
            }
        }
    
    /* instead of "hardwiring" the function to the sound file, we can just use the string interpolation and it will
        register any and all strings that are called with the same extension that we want.*/
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    

}
