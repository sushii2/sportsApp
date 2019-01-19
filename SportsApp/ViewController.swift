//
//  ViewController.swift
//  SportsApp
//
//  Created by Saksham Saraswat on 1/19/19.
//  Copyright © 2019 Saksham. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI


class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    @IBAction func loginPressed(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            return
        }
        
        authUI?.delegate = self
        
        let authViewController = authUI!.authViewController()
        
        present(authViewController, animated: true, completion: nil)
    }
    
}

extension ViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?){
        guard error == nil else {
            return
        }
        
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}
