//
//  StarWarsUniverseViewController.swift
//  HackerBookSwift
//
//  Created by Agustín on 29/05/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

let IMPERIAL_SECTION = 0
let REBEL_SECTION = 1

import UIKit

protocol StarWarsUniverseViewControllerDelegate{
    func starWarsViewController(_swvc: StarWarsUniverseViewController, didSelectCharacter: StarWarsCharacter)
}


class StarWarsUniverseViewController: UITableViewController, StarWarsUniverseViewControllerDelegate{
    
    var model : StarWarsUniverse = StarWarsUniverse()
    var delegate : StarWarsUniverseViewControllerDelegate?
    
    init(model: StarWarsUniverse){
        super.init(nibName: nil, bundle: nil)
        
        self.model = model
        
        self.title = "StarWars Universe"
    }

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == IMPERIAL_SECTION) {
            return self.model.imperialCount();
        }else{
            return self.model.rebelCount();
        }

    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        
        let cellId = "StarWarsCell"
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        
        var char : StarWarsCharacter
        
        if (indexPath.section == IMPERIAL_SECTION) {
            char = self.model.imperialsAtIndex(indexPath.row)
        }else{
            char = self.model.rebelAtIndex(indexPath.row)
        }
        
        cell.textLabel?.text = char.name
        cell.imageView?.image = char.photo
        cell.detailTextLabel?.text = char.alias
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == IMPERIAL_SECTION) {
            return "Imperials";
        }else{
            return "Rebels";
        }
    }
    
    // MARK: - Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var char  : StarWarsCharacter
        
        if (indexPath.section == IMPERIAL_SECTION) {
            char = self.model.imperialsAtIndex(indexPath.row)
        }else{
            char = self.model.rebelAtIndex(indexPath.row)
        }
        
        self.delegate?.starWarsViewController(self, didSelectCharacter: char)
        
        //Creamos la notificacion
        var nc = NSNotificationCenter.defaultCenter()
        var dict = ["charKey" : char]
        var n = NSNotification(name: "charChange", object:self, userInfo: dict)
        
        nc.postNotification(n)
        
        
        // Guardamos las coordenadas del último personaje
        var ns = NSUserDefaults.standardUserDefaults()
        
        ns.setObject(indexPath.section, forKey: "section")
        ns.setObject(indexPath.row, forKey: "row")
        ns.synchronize()
    }
    
    func starWarsViewController(_swvc: StarWarsUniverseViewController, didSelectCharacter: StarWarsCharacter){
        var vcChar = CharacterViewController(model: didSelectCharacter)
        
        self.navigationController?.pushViewController(vcChar, animated: true)
    }
    
}
