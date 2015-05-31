//
//  StarWarsUniverse.swift
//  HackerBookSwift
//
//  Created by Agustín on 29/05/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

import Foundation
import UIKit

class StarWarsUniverse {
    
    var rebels : NSArray = []
    var imperials : NSArray = []
    
    // MARK - Properties
    func rebelCount() -> Int{
        return self.rebels.count;
    }
    
    func imperialCount() -> Int{
        return self.imperials.count;
    }
    
    
    // MARK -  Init
    init(){
        
        // creamos los personajes
        // Vader
        let vaderURL : NSURL?  = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader")
        
        let b = NSBundle.mainBundle()
        let urlVaderSound = NSData(contentsOfURL: b.URLForResource("vader", withExtension: "caf")!)
        
        
        let vaderImage : UIImage? = UIImage(named:"darthVader.jpg")
        
        var vader = StarWarsCharacter(name: "Anakin Skywalker", alias: "Darth Vader", url: vaderURL, soundData: urlVaderSound, photo: vaderImage)
            

        // Tarkin
        let tarkinURL : NSURL?  = NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin")
        
        let urlTarkinSound = NSData(contentsOfURL: b.URLForResource("tarkin", withExtension: "caf")!)
        
        let tarkinImage : UIImage? = UIImage(named:"tarkin.jpg")
        
        var tarkin = StarWarsCharacter(name: "Wilhuf Tarkin", alias: "Grand Moff Tarkin", url: tarkinURL, soundData: urlTarkinSound, photo: tarkinImage)
        
        // Palpatine
        
        let palpatineURL : NSURL?  = NSURL(string: "http://en.wikipedia.org/wiki/Palpatine")
        
        let urlPalpatineSound = NSData(contentsOfURL: b.URLForResource("palpatine", withExtension: "caf")!)
        
        let palpatineImage : UIImage? = UIImage(named:"palpatine.jpg")
        
        var palpatine = StarWarsCharacter(name: "Palpatine", alias: "Darth Sidious", url: palpatineURL, soundData: urlPalpatineSound, photo: palpatineImage)
        
        // Chewbacca
        
        let chewieURL : NSURL?  = NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca")
        
        let urlChewieSound = NSData(contentsOfURL: b.URLForResource("chewbacca", withExtension: "caf")!)
        
        let chewieImage : UIImage? = UIImage(named:"chewbacca.jpg")
        
        var chewie = StarWarsCharacter(name: "Chewbacca", alias: "", url: chewieURL, soundData: urlChewieSound, photo: chewieImage)

        // C-3PO
        
        let c3poURL : NSURL?  = NSURL(string: "http://en.wikipedia.org/wiki/C-3PO")
        
        let urlC3poSound = NSData(contentsOfURL: b.URLForResource("c3po", withExtension: "caf")!)
        
        let c3poImage : UIImage? = UIImage(named:"c3po.jpg")
        
        var c3po = StarWarsCharacter(name: "C-3PO", alias: "", url: c3poURL, soundData: urlC3poSound, photo: c3poImage)
        
        // Yoda
        
        let yodaURL : NSURL?  = NSURL(string: "http://en.wikipedia.org/wiki/Yoda")
        
        let urlYodaSound = NSData(contentsOfURL: b.URLForResource("yoda", withExtension: "caf")!)
        
        let yodaImage : UIImage? = UIImage(named:"yoda.jpg")
        
        var yoda = StarWarsCharacter(name: "Minch Yoda", alias: "Master Yoda", url: yodaURL, soundData: urlYodaSound, photo: yodaImage)
        
        // R2-D2
        
        let r2d2URL : NSURL?  = NSURL(string: "http://en.wikipedia.org/wiki/R2-D2")
        
        let urlR2d2Sound = NSData(contentsOfURL: b.URLForResource("r2-d2", withExtension: "caf")!)
        
        let r2d2Image : UIImage? = UIImage(named:"R2-D2.jpg")
        
        var r2d2 = StarWarsCharacter(name: "Minch Yoda", alias: "Master Yoda", url: r2d2URL, soundData: urlR2d2Sound, photo: r2d2Image)

        
        self.imperials = [vader, palpatine, tarkin]
        self.rebels = [chewie, c3po, r2d2, yoda]

        
    }
    

// MARK - Accessors
func rebelAtIndex(index: Int) -> StarWarsCharacter{
    
    return self.rebels[index] as! StarWarsCharacter
}

func imperialsAtIndex(index: Int) -> StarWarsCharacter{
    return self.imperials[index] as! StarWarsCharacter
}

}


