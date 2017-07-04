//
//  ViewController.swift
//  MyApp22
//
//  Created by iii-user on 2017/7/4.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {

    var player:AVAudioPlayer?
    var isPrepar = false
    var counter:Float = 0
    var len:Float = 100
    
    @IBAction func test1(_ sender: Any) {
        if isPrepar{
            player?.play()
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {(timer)in
               
                DispatchQueue.main.async {
                    self.hslider.value = Float(self.player!.currentTime)

                }
                
                
            
            })
        }
        
    }
    
    
    
    @IBAction func test3(_ sender: Any) {
        
        if isPrepar && player!.isPlaying{
            player?.pause()
        }
        
    }
    
    
    
    @IBAction func test2(_ sender: Any) {
        
        if isPrepar && player!.isPlaying{
            player?.stop()
        }
        
        
    }
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func test4(_ sender: Any) {
        
        progressView.progress = 0 // min:float(0) ~ max:float(1)
        var mytimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {(timer)in
            self.counter += 5
            self.showProgress()
        })
        
        
    }
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        print("ok")
    }
    
    
    private func showProgress(){
        DispatchQueue.main.async {
            self.progressView.progress = self.counter / self.len
        }
    }
    
    
    @IBOutlet weak var hslider: UISlider!
    
    
    @IBAction func getMediaList(_ sender: Any) {
        
        let picker = MPMediaPickerController(mediaTypes: .music)
        
        picker.allowsPickingMultipleItems = true
        picker.delegate = self
            show(picker, sender: self)
        
        
        
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "bensound-energy", withExtension: "mp3")
        do{
           try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try player = AVAudioPlayer(contentsOf: url!)
            if (player?.prepareToPlay())!{
                
                
                
                isPrepar = true
                hslider.minimumValue = 0
                hslider.maximumValue = Float(player!.duration)
                hslider.value = 0
            }
        }catch{
            print(error)
        }
        
//        var myProgressview = UIProgressView(progressViewStyle: .default)
//        myProgressview.tintColor = UIColor.brown
//        myProgressview.trackTintColor = UIColor.cyan
//        myProgressview.frame = CGRect(x: 0, y: 0, width: 100, height: 15)
//        view.addSubview(myProgressview)
    
    
    }

    

}

