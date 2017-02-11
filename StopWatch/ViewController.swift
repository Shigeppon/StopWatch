//
//  ViewController.swift
//  StopWatch
//
//  Created by Shigeo Sakamoto on 2017/02/11.
//  Copyright © 2017年 Shigeo Sakamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let buttonTextStart = "Start"
    let buttonTextStop = "Stop"
    var timer: Timer!
    var min: Int = 0
    var sec: Int = 0
    var misec: Int = 0
    var resultList = [String]()
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func start(_ sender: Any) {
        switch startButton.titleLabel?.text {
        case .some(buttonTextStart):
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            timer.fire()

            startButton.setTitle(buttonTextStop, for: .normal)
        case .some(buttonTextStop):
            timer.invalidate()

            resultList.insert(display.text!, at: 0)
            tableView.reloadData()

            startButton.setTitle(buttonTextStart, for: .normal)
        default: break
        }
    }


    @IBAction func reset(_ sender: Any) {
        min = 0
        sec = 0
        misec = 0

        updateDisplay()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateDisplay()
        startButton.setTitle(buttonTextStart, for: .normal)
        display.font = UIFont.monospacedDigitSystemFont(ofSize: 20, weight: 0.1)

        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update() {
        misec += 1

        if misec == 100 {
            sec += 1
            misec = 0
        }

        if sec == 60 {
            min += 1
            sec = 0
        }

        if min == 60 {
            min = 0
        }

        updateDisplay()
    }

    func updateDisplay() {
        display.text = String(format: "%02d:%02d:%02d", min, sec, misec)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultList.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "結果"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)

        cell.textLabel!.text = resultList[indexPath.row]
        cell.textLabel!.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: 0.1)
        
        return cell

    }
}

