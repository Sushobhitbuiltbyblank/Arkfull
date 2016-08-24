//
//  AddProductVC.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 8/12/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit
import WebKit

class AddProductVC: UIViewController,UIWebViewDelegate, WKNavigationDelegate,UITextFieldDelegate {

    var webView: WKWebView =  WKWebView()
    @IBOutlet weak var webV: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    var myTimer : NSTimer = NSTimer()
    var theBool:Bool = false
    
    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var close: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.urlTF.delegate = self
        hideKeyboardWhenTappedAround()
       self.webView = WKWebView(frame: CGRectMake(0, 0, CGRectGetWidth(self.webV.bounds), CGRectGetHeight(self.webV.bounds)))
        self.webView.navigationDelegate = self
        
        self.webV.addSubview(webView)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        webView.addObserver(self, forKeyPath: "loading", options: .New, context: nil)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
    }
    override func viewWillDisappear(animated: Bool) {
        webView.removeObserver(self, forKeyPath: "loading", context: nil)
        webView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
    }
    override func viewDidLayoutSubviews()
    {
        self.webView.frame = CGRectMake(0, 0, self.webV.frame.width, self.webV.frame.height)
        
    }
    required init(coder aDecoder: NSCoder) {
        self.webView = WKWebView(frame: CGRectZero)
        super.init(coder: aDecoder)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - timer for progress Bar
    func timerCallback() {
        if theBool {
            if (progressView.progress >= 1) {
                progressView.hidden = true;
                myTimer.invalidate()
            }
            else {
                progressView.progress += 0.1;
            }
        }
        else {
            progressView.progress += 0.05;
            if (progressView.progress >= 0.95) {
                progressView.progress = 0.95;
            }
        }
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<()>) {
        if (keyPath == "loading") {
//            backBtn.enabled = webView1.canGoBack
//            forwardBtn.enabled = webView1.canGoForward
        }
        if (keyPath == "estimatedProgress") {
            progressView.hidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        //        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
        //        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        //        presentViewController(alert, animated: true, completion: nil)
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
    }
    @IBAction func closeBtnAction(sender: AnyObject) {
        self.urlTF.text = ""
        self.webView.stopLoading()
    }
    @IBAction func urlEditingDidEnd(sender: AnyObject) {
       
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var urlString:String!
        (urlTF.text == nil)||(urlTF.text == "") ? (urlString = "https://google.com") : (urlString = urlTF.text)
        
        let url = NSURL(string:urlString)
        if !verifyUrl(urlString)
        {
            let alert = UIAlertController(title: "", message: "Please enter a store URL", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        let request = NSURLRequest(URL:url!)
        webView.loadRequest(request)
        view.endEditing(true)
        return true;
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.sharedApplication().canOpenURL(url)
            }
        }
        return false
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
