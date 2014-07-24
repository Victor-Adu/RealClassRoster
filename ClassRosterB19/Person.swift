//
//  Person.swift
//  ClassRosterB19
//
//  Created by Victor  Adu on 7/21/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import Foundation
import UIKit
class Person {
    //Since 'lastName' is already set with a value, we dont have to set it in the 'init.' 
    //We could still reset it in 'init' and set it equal to 'lName' if we want.
    //But we do have to set 'firstName' in 'init' mtd since its not already set on its property
    //An optional value could be omitted in 'init' since it either take a value or nil
    
    var lastName : String
    var firstName:String
    
    var twitterHandler:String?
    var githubHandler: String?
    var image:UIImage?
    
    init(fName:String, lName:String) {
        self.firstName = fName
        self.lastName = lName
        //self.image = UIImage(named: "placeholder.jpg")
        
    }
    
    func fullName() -> (String) {
    
        return self.firstName + " " + self.lastName
    }

}
