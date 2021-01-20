//
//  ViewController.swift
//  SampleAppMicrowave
//
//  Created by 荒川らいら on 18/01/21.

//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    
    var timer = Timer()
    var time: [Int] = [0,0]
    var inputtedNumber = String()
    var minSelection: Int = 0
    var secSelection: Int = 0
    var duration: Double = 0
    var maxValue: Double = 0
    var displayedTimeFormat: TimeFormat = .min
    
    enum TimeFormat {
        case min
        case sec
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        minLabel.text = String(format: "%02d", time[0])
//        secLabel.text =  String(format: "%02d", time[1])
    }
    
    
    @IBAction func numbers(_ sender: UIButton) {
        inputtedNumber += String(sender.tag-1)
        switch inputtedNumber.count {
        case 1:
            secLabel.text = String(format: "%02d", sender.tag-1)
        case 2:
            secLabel.text = inputtedNumber
        default:
            break
        }
    }
    
    
//    //タイマーに時間をセットする
//    func setTimer() {
//        duration = Double(minSelection * 60 + secSelection)
//        maxValue = duration
//
//        if duration < 60 {
//
//        }
//    }
    
//    func startTimer(_ sender: Any) {
//        <#function body#>
//    }
    
    
//    func displayTimer() {
//        let min = Int(duration) % 3600 / 60
//        let sec = Int(duration) % 3600 % 60
//
//        timerLabel.text = String(format: "%02d:%02d", min, sec)
//        }
    }

