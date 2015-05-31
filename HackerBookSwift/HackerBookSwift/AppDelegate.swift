//
//  AppDelegate.swift
//  HackerBookSwift
//
//  Created by Agustín on 26/05/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let model = StarWarsUniverse()
        
        if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad){
            self.configureForPadWithModel(model)
        }else{
            self.configureForPhoneWithModel(model)
        }
        
        
        
        
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: - Configure
    func configureForPadWithModel(model: StarWarsUniverse){
        
        var vcUni : StarWarsUniverseViewController = StarWarsUniverseViewController(model: model)
        var navUni : UINavigationController = UINavigationController(rootViewController: vcUni)
        
        var vcCha : CharacterViewController = CharacterViewController(model: self.lastSelectedcharacter(model))
        var navCha : UINavigationController = UINavigationController(rootViewController: vcCha)
        
        var split = UISplitViewController()
        split.viewControllers = [navUni,navCha]
        
        split.delegate = vcCha
        vcUni.delegate = vcCha
        
        self.window?.rootViewController = split
        
    }
    
    func configureForPhoneWithModel(model: StarWarsUniverse){
        
        var vcUni : StarWarsUniverseViewController = StarWarsUniverseViewController(model: model)
        var navUni : UINavigationController = UINavigationController(rootViewController: vcUni)
        
        
        vcUni.delegate = vcUni
        
        self.window?.rootViewController = navUni
    }

    //MARK: - Last character
    func lastSelectedcharacter(char: StarWarsUniverse)->StarWarsCharacter{
        
        var nc : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var section : Int?
        var row : Int?
        
        var character : StarWarsCharacter
        
        if let value = nc.objectForKey("section") as? Int{
            
            section = nc.objectForKey("section") as? Int
            row = nc.objectForKey("row") as? Int
            
            if section == IMPERIAL_SECTION {
                character = char.imperialsAtIndex(row!)
            }else{
                character = char.rebelAtIndex(row!)
            }
        }else{
            character = char.rebelAtIndex(0)
        }
        
        return character
    }

}

