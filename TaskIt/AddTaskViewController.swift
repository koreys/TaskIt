//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Korey Stanley on 12/16/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    
    var mainVC: ViewController!
    
    @IBOutlet weak var taskTxtField: UITextField!
    @IBOutlet weak var subTaskTxtField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true , completion: nil)
    }

    @IBAction func addTaskBtnTapped(sender: UIButton) {
        var task: TaskModel = TaskModel(task: taskTxtField.text, subTask: subTaskTxtField.text, date: datePicker.date, completed: false)
        mainVC.baseArray[0].append(task)
        self.dismissViewControllerAnimated(true, completion: nil)
    
        
    }

}
