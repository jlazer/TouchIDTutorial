//
//  ViewController.swift
//  touchIDTutorial
//
//  Created by Justin Lazarski on 4/16/18.
//  Copyright © 2018 Justin Lazarski. All rights reserved.
//
// TESTING

import UIKit
import LocalAuthentication


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showlertController(_Message: String) {
        let alertController = UIAlertController(title: nil, message: _Message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func authWithTouchID(_sender: Any) {
        //1
        let context = LAContext()
        var error: NSError?
        //2
        // Check if Touch ID is available
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            //3
            let reason = "Authenticate with Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                {(success, error) in
                    //4
                    if success {
                        self.showlertController(_Message: "Touch ID Authentication Succeded")
                    } else {
                        self.showlertController(_Message: "Touch ID Authentication Failed")
                    }
            })
        }
            //5
        else {
            showlertController(_Message: "Touch ID Not Available")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

