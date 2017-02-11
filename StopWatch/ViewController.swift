//
//  ViewController.swift
//  StopWatch
//
//  Created by Shigeo Sakamoto on 2017/02/11.
//  Copyright © 2017年 Shigeo Sakamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let buttonTextStart = "Start"
    let buttonTextStop = "Stop"
    var timer: Timer!
    var min: Int = 0
    var sec: Int = 0
    var misec: Int = 0
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var startButton: UIButton!

    @IBAction func Start(_ sender: Any) {
        switch startButton.titleLabel?.text {
        case .some(buttonTextStart):
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            timer.fire()

            startButton.setTitle(buttonTextStop, for: .normal)
        default: break
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateDisplay()
        startButton.setTitle(buttonTextStart, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)

        timer.invalidate()
    }

    func update() {
        misec += 1

        if misec == 60 {
            sec += 1
            misec = 0
        }
        updateDisplay()
    }

    func updateDisplay() {
        display.text = String(format: "%02d:%02d:%02d", min, sec, misec)
    }
}

