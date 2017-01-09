//
//  ViewController.swift
//  Countdown App
//
//  Created by Lesslie Garcia on 12/9/16.
//  Copyright © 2016 Lesslie Garcia. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleCountdownLabel: UILabel!
    @IBOutlet weak var CountdownLabel: UILabel!
    @IBOutlet weak var stopCountdownButton: UIButton!
    var counter = 60
    var timer = Timer()
    var autonomous = true
    
    override func viewDidLoad(){
        super.viewDidLoad()
        displayCounter()
    }
    
    @IBAction func startCountdownButton(_ sender: Any) {
        timer.invalidate()
        counter = 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
    }
    
    func reset() {
        counter = 60
        displayCounter()
    }
    
    func displayCounter() {
        let minutes = counter / 60
        let seconds = counter % 60
        CountdownLabel.text = String(format: "%1d%:%02d%",minutes, seconds)
    }
    
    func updateCounter() {
        displayCounter()
        counter -= 1
        if counter < 0 {
            reset()
            
        }
        
    }
    
    @IBAction func stopCountdownButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func resetCountdownButton(_ sender: Any) {
        reset()
    }
    
    
}
