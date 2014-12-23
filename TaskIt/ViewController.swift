//
//  ViewController.swift
//  TaskIt
//
//  Created by Korey Stanley on 12/9/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var baseArray: [[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 = TaskModel(task: "Learn iOS", subTask: "Study Hard", date: Date.from(year: 2014, month: 12, day: 15), completed: false)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: Date.from(year: 2014, month: 12, day: 16), completed: false)
        let task3 = TaskModel(task: "Gym", subTask: "Leg Day", date: Date.from(year: 2013, month: 1, day: 12), completed: false)
        
        let taskArray = [task1, task2, task3]
        var completedArray = [TaskModel(task: "Code Something", subTask: "Create Program", date: Date.from(year: 2014, month: 12, day: 22), completed: false)]
        
        baseArray = [taskArray, completedArray]
        
        tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        baseArray[0] = baseArray[0].sorted {
            (taskOne:TaskModel, taskTwo:TaskModel) -> Bool in
            // comparison logic here
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
            
        }
        else if segue.identifier == "showTaskAdd" {
            let addTaskVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
    }
    
    
    @IBAction func addTaskBtnTapped(sender: UIBarButtonItem) {
        performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    
    
    //UITableviewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask:TaskModel = baseArray[indexPath.section][indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        
        return cell
    }
    
    //UITableviewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)

    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do List:"
        }
        else {
            return "Completed Tasks:"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0 {
            var newTask: TaskModel = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: true)
            baseArray[1].append(newTask)
        }
        else {
            var newTask: TaskModel = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: false)
            baseArray[0].append(newTask)
        }
        
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        tableView.reloadData()
        
    }
    
    
    //helper functions
   
    
    
    
    
    
    
    
    
    
    
    
    
    
}

