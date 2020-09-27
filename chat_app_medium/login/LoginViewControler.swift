//
//  LoginViewControler.swift
//  chat_app_medium
//
//  Created by Qenawi on 9/26/20.
//  Copyright © 2020 goplus. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class LoginViewControler: ViewController ,GIDSignInDelegate {
    
    @IBOutlet weak var action: UIButton!
    
    @IBAction func onclick(_ sender: UIButton)
    {
        GIDSignIn.sharedInstance().signIn()
    }
    
    override func viewDidLoad()
    {
    super.viewDidLoad()
    GIDSignIn.sharedInstance()?.presentingViewController = self
    GIDSignIn.sharedInstance().delegate = self
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    
        
        if let error = error {
        print(error.localizedDescription)
        return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (authResult, error) in
        if let error = error {
        print(error.localizedDescription)
        } else {
        print("Login Successful.")
        let cc = ChatViewController()
        cc.modalPresentationStyle = .fullScreen
        self.present(cc, animated: true, completion: {})
        }
        
        }
        
    }
    
    
}
    
