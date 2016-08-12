//
//  LoginVC.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 7/27/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, FBSDKLoginButtonDelegate,UITextFieldDelegate {
    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        fbLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
        fbLoginButton.delegate = self
        nameTF.delegate = self // Setting delegate of your UITextField to self
        passwordTF.delegate = self
        emailTF.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                self .returnUserData()
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me?fields=id,name,email,picture,gender", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                self.nameTF.text = userName as String
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                self.emailTF.text = userEmail as String
                print("User Email is: \(userEmail)")
            }
        })
    }
    
    
    @IBAction func nextBtnAction(sender: AnyObject) {
        
          }
 // MARK: - TextFieldDelegate method
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == passwordTF {
            animateViewMoving(true, moveValue: 150)
        }
        else
        {
            animateViewMoving(true, moveValue: 100)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == passwordTF {
            animateViewMoving(false, moveValue: 150)
        }
        else{
            animateViewMoving(false, moveValue: 100)
        }
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        view.endEditing(true)
        return true;
    }
    // Lifting the view up
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
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
// MARK: -  Extension for UIVIEW
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
