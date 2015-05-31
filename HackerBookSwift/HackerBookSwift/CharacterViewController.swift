//
//  CharacterViewController.swift
//  HackerBookSwift
//
//  Created by Agustín on 29/05/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

import UIKit
import AVFoundation

class CharacterViewController: UIViewController,UISplitViewControllerDelegate,StarWarsUniverseViewControllerDelegate {

    var model : StarWarsCharacter = StarWarsCharacter()
    var player = AVAudioPlayer()
    
    @IBAction func playAction(sender: AnyObject) {
        var error = NSError?()
        self.player = AVAudioPlayer(data: self.model.soundData, error: &error)
        self.player.play()
    }
    
    @IBAction func wikiAction(sender: AnyObject) {
        var wikiVC = WikiViewController(model: self.model)
        
        self.navigationController?.pushViewController(wikiVC, animated: false)
    }
    
    @IBOutlet weak var imagePhoto: UIImageView?
    
    //MARK: - Init
    
    init(model: StarWarsCharacter){
        super.init(nibName: "CharacterViewController", bundle: nil)
        
        self.model = model
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        
        //Sincornizamos el modelo -> vista
        self.syncViewWithModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Sync
    func syncViewWithModel(){
        self.imagePhoto?.image = self.model.photo
    }
    
    
    //MARK: - Delegate
    func starWarsViewController(_swvc: StarWarsUniverseViewController, didSelectCharacter: StarWarsCharacter){
        self.model = didSelectCharacter
        
        self.syncViewWithModel()
    }
    
    //MARK: SplitDelegate
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        
        if displayMode == UISplitViewControllerDisplayMode.AllVisible{
            //the table is hidden
            //Put the buttom for navigation
            self.navigationItem.leftBarButtonItem = nil;
            
        }else{
            //We are in landScape, so all it is visible, and hide the buttom
            self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem();
        }
    }

}
