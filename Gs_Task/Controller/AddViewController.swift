//
//  AddViewController.swift
//  Gs_Task
//
//  Created by 浜谷 光吉 on 2017/09/23.
//  Copyright © 2017年 luckyblaze. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    let taskCollection = TaskCollection.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        //画面をタップすると、キーボードが閉じる動作
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    //画面をタップすると、キーボードが閉じる動作
    @objc func tapGesture(sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    //リターンをタップすると、キーボードが閉じる動作
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveButtonDidTouch(_ sender: Any) {
        var task = Task()
        task.title = textField.text!
        print(task.title)
        self.taskCollection.addTaskCollection(task)
        print(self.taskCollection.realmTasks)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
