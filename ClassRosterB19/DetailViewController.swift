//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Victor  Adu on 7/22/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var person : Person!

    @IBOutlet var firstNameTextField: UITextField
    @IBOutlet var lastNameTextField: UITextField
    @IBOutlet var imageView: UIImageView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !person.image {
            imageView.image = UIImage(named: "placeholder.jpg")
        }
        else {
        // Do any additional setup after loading the view.
            imageView.image = person.image }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        person.firstName = firstNameTextField.text
        person.lastName = lastNameTextField.text
    
    }
}
    

