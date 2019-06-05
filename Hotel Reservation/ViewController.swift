//
//  ViewController.swift
//  Hotel Reservation
//
//  Created by Eric Roca on 30/05/2019.
//  Copyright © 2019 Eric Roca. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController, FUIAuthDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            //do something :D
        } else {
            let authUI = FUIAuth.defaultAuthUI()
            authUI?.delegate = self
            let providers: [FUIAuthProvider] = [
                FUIEmailAuth(),
            ]
            
            authUI?.providers = providers
            let authViewController = authUI!.authViewController()
            self.present(authViewController, animated: true, completion: nil)
        }
    }
    
    //MARK: FirebaseUI
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // Handle user returning from authenticating
    }

}

