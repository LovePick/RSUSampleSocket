//
//  StationDataModel.swift
//  TestosXSocket
//
//  Created by Supapon Pucknavin on 26/10/2562 BE.
//  Copyright © 2562 T2P. All rights reserved.
//

import Cocoa

class StationDataModel {

   
    enum Line:NSInteger{
        case blue = 0
        case pink
    }
    
    enum Status:NSInteger{
        case open = 0
        case close
        case overcrowd
    }
    
    var id:String = ""
    var name:String = ""
    
    var line:Line = .pink
    
    
    
    // realtime data
    var carId:String = ""
    
    var strArriveTime:String = "" //dd-MM-yyyy HH:mm:ss
    var arriveDate:Date? = nil
    
    var strDepartTime:String = "" //dd-MM-yyyy HH:mm:ss
    var departDate:Date? = nil
    
    
    
    
    
    var status:Status = .close
    
    
    
    var arCarSchedule:[CarSchedule] = [CarSchedule]()
    
    
    convenience init(fields:[String: Any]){
        
        self.init()
        
        
        self.readJson(fields: fields)
    }
    
    
    func readJson(fields:[String: Any]) {
       
        
        
    }
    
    
    
    
    func getDictionary()->[String:Any]{
        
        let dateDormat:DateFormatter = DateFormatter()
        dateDormat.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateDormat.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        
        
        
        
        var newDic:[String:Any] = [String:Any]()
        newDic["id"] = self.id
        newDic["name"] = self.name
        newDic["carId"] = self.carId
        newDic["arrive"] = self.strArriveTime
        newDic["depart"] = self.strDepartTime
        newDic["status"] = self.status.rawValue
        
        
        
        return newDic

    }
    
}
