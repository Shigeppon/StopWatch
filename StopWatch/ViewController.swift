//
//  ViewController.swift
//  StopWatch
//
//  Created by Shigeo Sakamoto on 2017/02/11.
//  Copyright © 2017年 Shigeo Sakamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var timer: Timer!
    var second: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        display.text = "00:00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)

        timer.invalidate()
    }

    func update() {
        second += 1
        display.text = "00:00:" + String(second)
    }
}

