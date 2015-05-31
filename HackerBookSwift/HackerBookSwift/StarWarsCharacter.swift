//
//  StarWarsCharacter.swift
//  HackerBookSwift
//
//  Created by Agustín on 29/05/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacter {
    
    var alias : String?
    var name : String?
    var url : NSURL?
    var soundData : NSData?
    var photo : UIImage?
    
    init(){}
    
    init(name : String, alias: String, url: NSURL?, soundData: NSData?, photo: UIImage?){
        
        self.name = name
        self.alias = alias
        self.url = url
        self.soundData = soundData
        self.photo = photo
        
    }
    
    
}

