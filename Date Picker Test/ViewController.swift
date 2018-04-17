//
//  ViewController.swift
//  Date Picker Test
//
//  Created by 김종현 on 2018. 4. 10..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
        })
        
    }
    
    func updateTime(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        
        if currentTimeLabel.text == timeLabel.text {
            view.backgroundColor = UIColor.red
            
            let myAlret =  UIAlertController(title: "알림", message: "설정된 시간이 되었습니다!", preferredStyle: .actionSheet)
            //후행클로저
            let okAction = UIAlertAction(title: "확인", style: .default) {(myaction: UIAlertAction) -> Void in
                  self.view.backgroundColor = UIColor.red
            }
            
            let cancelAction = UIAlertAction(title: "취소", style : .cancel, handler : {(myaction: UIAlertAction) -> Void in
                  self.view.backgroundColor = UIColor.white
            })
            
            let testAction = UIAlertAction(title: "삭제", style: .destructive, handler: {(myaction: UIAlertAction) -> Void in
                  self.view.backgroundColor = UIColor.green
            })
            
            
            myAlret.addAction(okAction)
            myAlret.addAction(cancelAction)
            myAlret.addAction(testAction)
            
            present(myAlret, animated: true, completion: nil)
            
        }
    }
    @IBAction func stop(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    @IBAction func changeDatePicker(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
    }
}

