//
//  Model.swift
//  ClosureApp
//
//  Created by Ngoc on 9/27/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class Model{
    var name: String!
    var bodyType: String!
    var linkImage: String!
    
    init(){
    
    }
    
    init(name:String, bodyType: String, linkImage: String){
        self.name = name
        self.bodyType = bodyType
        self.linkImage = linkImage
    }

}




