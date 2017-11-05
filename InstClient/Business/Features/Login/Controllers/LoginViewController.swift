//
//  LoginViewController.swift
//  InstClient
//
//  Created by Alya Filon on 12.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var loginWebView: UIWebView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard AuthAPI.codeRequest() != nil else { return }
        
        let request = NSURLRequest(url: AuthAPI.codeRequest()!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        loginWebView.loadRequest(request as URLRequest)
    }
}

// MARK: - UIWebViewDelegate

extension LoginViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool  {
        
        guard request.url?.absoluteString != nil else { return false }
        
        let request = (request.url?.absoluteString)!
        var redirectString: [String] = request.components(separatedBy: API.redirectURI)
        
        var code = [String]()
        if redirectString.count > 1 {
            code = redirectString[1].components(separatedBy: "?code=")
        }
        
        if code.count > 1 {
            
            AuthAPI.accessTokenRequest(code: code[1]) { [weak self] auth in
                
                if let auth = auth,
                    let accessToken = auth.accessToken {
                    
                    do {
                        try UserSession.shared.activate(with: accessToken)
                        UserSession.shared.set(auth)
                    }  catch _ {}
                    
                    self?.present(R.storyboard.profile.instantiateInitialViewController()!, animated: true, completion: nil)
                }
            }
            return false
        }
        return true
    }
}
