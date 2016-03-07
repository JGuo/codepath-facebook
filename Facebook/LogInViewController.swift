//
//  LogInViewController.swift
//  Facebook
//
//  Created by Jisi Guo on 2/10/16.
//  Copyright © 2016 Jisi Guo. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var signUpLabel: UILabel!
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    var initialYFieldParentView: CGFloat!
    var offsetFieldParentView: CGFloat!
    var initialYLabelParentView: CGFloat!
    var offsetLabelParentView: CGFloat!
    var initialYLogoView: CGFloat!
    var offsetLogoView: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidden = true
        
        initialYFieldParentView = fieldParentView.frame.origin.y
        offsetFieldParentView = 50
        
        initialYLabelParentView = labelParentView.frame.origin.y
        offsetLabelParentView = 210
        
        initialYLogoView = logoView.frame.origin.y
        offsetLogoView = 15

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    //login button
    @IBAction func onTap(sender: UIButton) {
        
        let alertController = UIAlertController(title: "Yo", message: "Wrong shit", preferredStyle: .Alert)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)

        
        self.activityIndicator.hidden = false
        self.activityIndicator.startAnimating()
        self.loginButton.selected = true
        print("tapped 2 secs ago")
        //self.checkPassword()
        
        if self.emailField.text == "mark@gmail.com" && self.passwordField.text == "password" {
            delay(2, closure: { () -> () in
                print("wooo ooooooooohoooooo")
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.loginButton.selected = false
                
                self.performSegueWithIdentifier("logInSegue", sender: nil)
            })
        } else {
            delay(2, closure: { () -> () in
                print("wrong mang")
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.loginButton.selected = false
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            })
            
        }
        
        
    }
    @IBAction func editingChanged(sender: UITextField) {
        // create a conditional statement: if the username OR password fields are empty than...
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            // set the button state to disabled
            loginButton.enabled = false
            // otherwise
        } else {
            // set the button state to enabled
            loginButton.enabled = true
        }
    }

    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialYFieldParentView - offsetFieldParentView
        
        labelParentView.frame.origin.y = initialYLabelParentView - offsetLabelParentView
        
        logoView.frame.origin.y = initialYLogoView - offsetLogoView
        
        signUpLabel.hidden = true
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialYFieldParentView
        
        labelParentView.frame.origin.y = initialYLabelParentView
        
        logoView.frame.origin.y = initialYLogoView
        
        signUpLabel.hidden = false
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
