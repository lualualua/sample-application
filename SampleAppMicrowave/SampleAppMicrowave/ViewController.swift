//
//  ViewController.swift
//  SampleAppMicrowave
//
//  Created by LylaArakawa on 18/01/21.

//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var oneMinLabel: UIButton!
    @IBOutlet weak var tenSecLabel: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let list1:[String] = ["0", "1", "2", "3", "4", "5","6", "7", "8","9", "10"]
    let list2:[String] = ["00", "10", "20", "30", "40", "50"]
    
    var timer = Timer()
    var count = 0
    var minRemain = 0
    var secRemain = 0
    var stopButtonTapCount = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oneMinLabel.layer.cornerRadius = 25
        tenSecLabel.layer.cornerRadius = 25
        stopButton.layer.borderWidth = 0.5
        stopButton.layer.borderColor = UIColor.red.cgColor
        startButton.layer.borderWidth = 0.5
        startButton.layer.borderColor = UIColor.red.cgColor

        pickerView.delegate = self
        pickerView.dataSource = self
        resetTimer()
    }
    
    //ドラムロールの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //ドラムロールの行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return list1.count
        case 1:
            return list2.count
        default:
            return 0
        }
    }
    
    //ドラムロールの各タイトル
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return list1[row]
        case 1:
            return list2[row]
        default:
            return "error"
        }
    }
    
    //ドラムロール選択
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            minLabel.text = list1[row]
        case 1:
            secLabel.text = list2[row]
        default:
            break
        }
    }
    
    @IBAction func didTapOneMinuteButton(_ sender: UIButton) {
        if timer.isValid == true {
            return
        }
        timer.invalidate()
        setTimer(minSelected: 1, secSelected: 0)

    }
    
    @IBAction func didTapTenSecButton(_ sender: UIButton) {
        if timer.isValid == true {
            return
        }
        timer.invalidate()
        setTimer(minSelected: 0, secSelected: 10)
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        //タイマーがオンだったら無反応
        if timer.isValid == true {
            return
        }
        timer.invalidate()
        let minSelected = Int(list1[pickerView.selectedRow(inComponent: 0)])
        let secSelected = Int(list2[pickerView.selectedRow(inComponent: 1)])
        setTimer(minSelected: minSelected!, secSelected: secSelected!)
        

            }
    
    
    func setTimer(minSelected: Int, secSelected: Int) {
        count = minSelected * 60 + secSelected
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    //タイマーから呼び出されるメソッド
    @objc func countDown() {
        count -= 1
        if(count > 0){
            minRemain = count / 60
            secRemain = count % 60
            minLabel.text = String(minRemain)
            secLabel.text = String(secRemain)
            if secRemain < 10 {
                secLabel.text = String("0\(secRemain)")
            }
        }else{
            minLabel.text = "0"
            secLabel.text = "00"
            timer.invalidate()
        }
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        stopButtonTapCount += 1
        timer.invalidate()
        if stopButtonTapCount == 2 {
            resetTimer()
        }
    }

    
    func resetTimer() {
        count = 0
        stopButtonTapCount = 0
        minLabel.text = "0"
        secLabel.text = "00"
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated: true)
    }
    
    }

