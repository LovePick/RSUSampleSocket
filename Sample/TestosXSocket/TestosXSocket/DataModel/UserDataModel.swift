//
//  UserDataModel.swift
//  TestosXSocket
//
//  Created by Supapon Pucknavin on 26/10/2562 BE.
//  Copyright © 2562 T2P. All rights reserved.
//

import Cocoa

class UserDataModel: NSObject {

    enum Rule:NSInteger{
        case user
        case admin
    }
    
    var userId:String = ""
    var password:String = ""
    
    
    
    var name:String = ""
    var rule:Rule = .user
    
    
    
    
}
