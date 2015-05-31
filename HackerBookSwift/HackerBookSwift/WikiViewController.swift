//
//  WikiViewController.swift
//  HackerBookSwift
//
//  Created by Agustín on 29/05/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {

    var model : StarWarsCharacter = StarWarsCharacter()
    var canLoad = false
    
    @IBOutlet weak var wikiWeb: UIWebView?
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    //MARK: - Init
    init(model: StarWarsCharacter){
        super.init(nibName: "WikiViewController", bundle: nil)
        
        self.model = model
        self.canLoad = true
        self.title = "Wikipedia"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(animated: Bool) {
        self.wikiWeb?.delegate = self
        
        var nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "notifyThatCharacterDidChange:", name: "charChange", object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.syncWithModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func syncWithModel(){
        
        self.canLoad = true
        self.activityView.hidden = false
        self.activityView.startAnimating()
        
        self.wikiWeb?.loadRequest(NSURLRequest(URL: self.model.url!))
    }
    
    //MARK: - UIWebViewDelegate
    func webViewDidFinishLoad(webView: UIWebView) {
        self.canLoad = false
        self.activityView.hidden = true
        self.activityView.stopAnimating()
    }
    
    //MARK: - Notification
    func notifyThatCharacterDidChange(notification: NSNotification){
        var char : Dictionary<String,StarWarsCharacter> = notification.userInfo as! Dictionary<String,StarWarsCharacter>
        
        self.model = char["charKey"]!
        self.syncWithModel()
    }

}
