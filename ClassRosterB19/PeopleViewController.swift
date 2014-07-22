//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Victor  Adu on 7/21/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var people = Person[]() //Create an empty array in the Person class
                            
    @IBOutlet var tableView: UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
//        self.setupPersonArray()
        people = loadRosterFromPlist()
        self.tableView.reloadData()
    }
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func setupPersonArray(){
//        
//        var brad = Person(fName: "Brad", lName: "Johnson")
//        var vick = Person(fName: "Victor", lName: "Adu")
//        var collin = Person(fName: "Collin", lName: "Atherton")
//        var john = Person(fName: "John", lName: "Clem")
//        var jeff = Person(fName: "Jeff", lName: "Gayle")
//        var dan = Person(fName: "Daniel", lName: "Hoang")
//        var leo = Person(fName: "Leonardo", lName: "Lee")
//        var alex = Person(fName: "Alex", lName: "Rice")
//        var kirby = Person(fName: "Kirby", lName: "Shabaga")
//        var mike = Person(fName: "Michael", lName: "Tirenin")
//        
//        self.people = [brad,vick,collin,john,jeff,dan,leo,alex,kirby, mike]
//    
//    }
    
    func loadRosterFromPlist() -> Person[] {
        
    var people = Person[]() //You can do 'var roster = Array<Person>'
    
    let plistPersonPath = NSBundle.mainBundle().pathForResource("personsList", ofType: "plist")
    let personList = NSArray(contentsOfFile:plistPersonPath) as NSArray
    
        for object : AnyObject in personList {//The 'For in' will loop thru the 'Person' array
        
            if let person = object as? Dictionary<String, String> {
            // this catches any dictionary within the plist and passes in 'firstName' and 'lastName' as the 'for in' loops in the 'Person' array
            
                var firstName = person["firstName"]
                var secondName = person["lastName"]
                let newPerson = Person(fName: firstName!, lName: secondName!)
                let imageName = person["image"]
                
                newPerson.image = UIImage(named: "\(imageName).jpg")
                //newPerson.image = UIImage(named: imageName)
                
                people.append(newPerson)
            
            }
        }
         return people
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
    
        return self.people.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let rowPerson = people[indexPath.row]
        cell.textLabel.text = rowPerson.fullName()
        println("deque reusable cell")
    
    return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    
        if segue.identifier == "showPerson" {
        
            let destination = segue.destinationViewController as DetailViewController
            destination.person = people[tableView!.indexPathForSelectedRow().row]
        } else if segue.identifier == "addNewPerson" {
            let destination = segue.destinationViewController as DetailViewController
            var person = Person (fName: " ", lName: " ")
            people.append(person)
            destination.person = person
            
        }
    }
    
    func tableView(tableView: UITableView!,
        didSelectRowAtIndexPath indexPath: NSIndexPath!) {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
   





