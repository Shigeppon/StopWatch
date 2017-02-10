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

    override func viewDidLoad() {
        super.viewDidLoad()

        display.text = "00:00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

