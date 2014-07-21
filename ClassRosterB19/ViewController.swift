//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Victor  Adu on 7/21/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var personArray = Person[]() //Create an empty array in the Person class
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupPersonArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupPersonArray(){
        
        var brad = Person(fName: "Brad", lName: "Johnson")
        var vick = Person(fName: "Victor", lName: "Adu")
        var collin = Person(fName: "Collin", lName: "Atherton")
        var john = Person(fName: "John", lName: "Clem")
        var jeff = Person(fName: "Jeff", lName: "Gayle")
        var dan = Person(fName: "Daniel", lName: "Hoang")
        var leo = Person(fName: "Leonardo", lName: "Lee")
        var alex = Person(fName: "Alex", lName: "Rice")
        var kirby = Person(fName: "Kirby", lName: "Shabaga")
        var mike = Person(fName: "Michael", lName: "Tirenin")
        
        self.personArray = [brad,vick,collin,john,jeff,dan,leo,alex,kirby, mike]
    
    }


}

