//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Korey Stanley on 12/15/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var detailTaskModel: TaskModel!
    var mainVC: ViewController!
    
    @IBOutlet weak var taskTxt: UITextField!
    @IBOutlet weak var subTaskTxt: UITextField!
    @IBOutlet weak var taskDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Sent Task was: \(detailTaskModel.task)| SubTask was: \(detailTaskModel.subTask)")
        taskTxt.text = detailTaskModel.task
        subTaskTxt.text = detailTaskModel.subTask
        taskDate.date = detailTaskModel.date
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBtnPressed(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }

  
    @IBAction func doneBtnTapped(sender: UIBarButtonItem) {
        
        var task = TaskModel(task: taskTxt.text, subTask: subTaskTxt.text, date: taskDate.date, completed: false)
        mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }

}
