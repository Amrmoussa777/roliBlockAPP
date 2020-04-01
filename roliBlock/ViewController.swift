//
//  ViewController.swift
//  roliBlock
//
//  Created by Amr Moussa on 3/31/20.
//  Copyright © 2020 Amr Moussa. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer?
    var btnsPlayer: AVAudioPlayer?
    var musicNames = [1:"1st_String_E_64kb.mp3",
                      2:"2nd_String_B__64kb.mp3",
                      3:"5th_String_A_64kb.mp3",
                      4:"65th_String_A_64kb.mp3",
                      5:"B.wav",
                      6:"C.wav",
                      7:"D.wav",
                      8:"E.wav",
                      9:"F.wav",
                      10:"G.wav",
                      11:"A.wav",
                      12:"B.wav",
                      13:"C.wav",
                      14:"D.wav",
                      15:"F.wav",
                      16:"G.wav",
      ]
    @IBOutlet weak var playButton: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
//        arrowright.transform = CGAffineTransform(scaleX: 1, y: -1)
        playSound()
//        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "giphy", withExtension: "gif")!)
//          let advTimeGif = UIImage.gifImageWithData(imageData!)
//          let imageView2 = UIImageView(image: advTimeGif)
//          imageView2.frame = CGRect(x: 20.0, y: 220.0, width:
//          self.view.frame.size.width - 40, height: 150.0)
//          view.addSubview(imageView2)
        // Do any additional setup after loading the view.
        
    }

    @IBAction func gridButtonGrid(_ sender: UIButton) {
        makescale(sender)
//        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//        Thread.sleep(until: )
//        sender.transform = CGAffineTransform(scaleX: 1 , y: 1)
        playbuttonmusic(musicNames[sender.tag]!)

        
        
    }
   
    func makescale(_ uisender:UIButton){
        uisender.transform = CGAffineTransform(scaleX: -1, y: 1)

        UIView.animate(withDuration: 0.5, animations: { () -> Void in

            uisender.transform = CGAffineTransform(scaleX: 1,y: 1)

      })
        
    }
    
    func playbuttonmusic(_ fName:String  ){
        let spliitedName  = fName.split(separator: ".")
        print(spliitedName)
        guard let url = Bundle.main.url(forResource: spliitedName[0].description, withExtension: spliitedName[1].description) else { return }

         do {
             try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
             try AVAudioSession.sharedInstance().setActive(true)

             /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
              btnsPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

             /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

             guard let player = btnsPlayer else { return }
             player.numberOfLoops = 1
             player.play()

         } catch let error {
             print(error.localizedDescription)
         }
        
        
        
        
    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "carbackground", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }
            player.numberOfLoops = -1
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

