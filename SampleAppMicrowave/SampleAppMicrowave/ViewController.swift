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
    @IBOutlet weak var pickerView: UIPickerView!
    let list1:[String] = ["0", "1", "2", "3", "4", "5","6", "7", "8","9", "10", "11", "12", "13", "14", "15"]
    let list2:[String] = ["00", "10", "20", "30", "40", "50"]
    
    var timer = Timer()
    var count = 0
    var minRemain = 0
    var secRemain = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
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

    @IBAction func startButton(_ sender: UIButton) {
        timer.invalidate()
        let minSelected = Int(list1[pickerView.selectedRow(inComponent: 0)])
        let secSelected = Int(list2[pickerView.selectedRow(inComponent: 1)])
        count = minSelected! * 60 + secSelected!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }

    

    @IBAction func stopButton(_ sender: UIButton) {
        timer.invalidate()
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
            minLabel.text = "00"
            secLabel.text = "00"
            timer.invalidate()
        }
    }
    

    

    
    }

