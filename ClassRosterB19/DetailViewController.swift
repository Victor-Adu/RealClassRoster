//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Victor  Adu on 7/22/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit
import QuartzCore
import MobileCoreServices

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    var person : Person!

    @IBOutlet var firstNameTextField: UITextField?
    @IBOutlet var lastNameTextField: UITextField?
    @IBOutlet var imageView: UIImageView?
    
    @IBOutlet var githubHandle: UITextField?
    @IBOutlet var twitterHandle: UITextField?
    
    
    
    let textFieldPadding = 100
    
   // override func traitCollectionDidChange(previousTraitCollection: UITraitCollection!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !person.image {
            imageView!.image = UIImage(named: "placeholder.jpg")
        }
        else {
        // Do any additional setup after loading the view.
            imageView!.image = person.image }
    }
    
    //Set cornerRadius of our Image
    override func viewWillAppear(animated: Bool) {
        self.imageView!.layer.cornerRadius = self.imageView!.frame.width * 0.25
        self.imageView!.layer.borderColor = UIColor.redColor().CGColor
        self.imageView!.layer.borderWidth = 10
        self.imageView!.layer.masksToBounds = true
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        firstNameTextField!.text = person.firstName
        lastNameTextField!.text = person.lastName
        
        githubHandle!.text = person.githubHandler
        twitterHandle!.text = person.twitterHandler
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        person.firstName = firstNameTextField!.text
        person.lastName = lastNameTextField!.text
    
        person.githubHandler = githubHandle!.text
        person.twitterHandler = twitterHandle!.text
    }
    

    func textFieldDidBeginEditing(textField: UITextField!) {
        println("began editing")
        
        let curWidth = self.view.bounds.width
        let curHeight = self.view.bounds.height
        let newY = 0.0 + textField.frame.origin.y - self.textFieldPadding
        let currentX = self.view.bounds.origin.x
        
        UIView.animateWithDuration(0.3, animations:{ () -> Void
            in
            
                       self.view.bounds = CGRect(x: currentX, y: newY, width: curWidth, height:curHeight)
            //self.view.transform = CGAffineTransformTranslate(self.view.transform, 0.0, -120.0)
            
            })
    }
    
    
    func textFieldDidEndEditing(textField: UITextField!) {
        println("did end editing")
        
        let currentWidth = self.view.bounds.width
        let currentHeight = self.view.bounds.height
        //        UIView.animateWithDuration(0.3, animations:{ () -> Void
        //            in
        //
        //            self.view.bounds = CGRect(x: 0, y: 0, width: curWidth, height:curHeight)
        //
        //            }) 
        
        // AnimateWithDuration same as below
        
        UIView.animateWithDuration(0.3) {
            self.view.bounds = CGRect(x: 0, y: 0, width: currentWidth, height:currentHeight)
            //self.view.transform = CGAffineTransformTranslate(self.view.transform, 0.0, 120.0)
        }
        
    }

    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Forces Keyboard to disappear when user clicks outside the Textfield
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        //        for control in self.view.subviews {
        //            if let theControl = control as? UITextField {
        //                theControl.resignFirstResponder()
        //            }
        //You can do the above or do force keyboard to disappear with below statement
        self.view.endEditing(true)
    }
}
    

