//
//  MovieTrailerViewController.swift
//  Flix
//
//  Created by Rachel Sacdalan on 1/30/22.
//

import UIKit
import WebKit

class MovieTrailerViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var key = ""
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Showing Trailer!")
        
        let myURL = URL(string: "https://www.youtube.com/watch?v=JfVOs4VSpmA")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
