//
//  ViewController.swift
//  linepasscode
//
//  Created by Yang Nina on 2021/4/7.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pwImageView: [UIImageView]!
    @IBOutlet var numBtn: [UIButton]!
    
    @IBOutlet weak var pwLabel: UILabel!
    var passcode = "3458"
    var enter = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
    }
    func imageshow(){
        switch enter.count {
        case 1:
            pwImageView[0].isHidden = false
            for i in 1...3{
                pwImageView[i].isHidden = true
            }
        case 2:
            for i in 0...3{
                if i > 1{
                    pwImageView[i].isHidden = true
                }
                else{
                    pwImageView[i].isHidden = false
                }
            }
        case 3:
            for i in 0...2{
                pwImageView[i].isHidden = false
            }
            pwImageView[3].isHidden = true
        case 4:
            for i in 0...3{
                pwImageView[i].isHidden = false
            }
            checkpw()
        default:
            reset()
        }
    }
    func checkpw(){
        if enter == passcode{
            let controller = UIAlertController(title: "Corret", message: "Welcome Back!", preferredStyle: .alert)
            pwLabel.text = "密碼正確。"
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            
        }
        else if enter != passcode{
            let controller = UIAlertController(title: "Wrong", message: "Please Try Again!", preferredStyle: .alert)
            pwLabel.text = "密碼錯誤。"
            let action = UIAlertAction(title: "OK", style: .default){ (_) in
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        }
        
    }
    @IBAction func enterpw(_ sender: UIButton) {
        //密碼長度不等於4
        if enter.count != 4 {
            if let inputNumber = sender.currentTitle {
                //字串相加
                enter.append(inputNumber)
            }
        }
        imageshow()
    }
    @IBAction func deletenum(_ sender: UIButton) {
        if enter.count != 0 {
            enter.removeLast()
        }
        imageshow()
    }
    func reset(){
        for i in 0...3{
            pwImageView[i].isHidden = true
        }
        enter = ""
        pwLabel.text = "請輸入密碼。"
    }
}

