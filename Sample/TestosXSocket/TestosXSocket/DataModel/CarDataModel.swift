//
//  CarDataModel.swift
//  TestosXSocket
//
//  Created by Supapon Pucknavin on 26/10/2562 BE.
//  Copyright © 2562 T2P. All rights reserved.
//

import Cocoa

class CarDataModel {
    
    
    enum Status:NSInteger{
        case stopAtOrigin = 0
        case going
        case emergencyStop
        case arrive
        case outOfService
        case unknown
    }
    
    enum Direction:NSInteger{
        case go = 0
        case back
        
    }
    
    enum CrowdStatus:NSInteger{
        case low = 0
        case mid
        case height
    }
    
    
    
    
    // info data
    var id:String = ""
    var name:String = ""
    
    
    var from:String = ""
    var strDepartTime:String = "" //dd-MM-yyyy HH:mm:ss
    
    var to:String = ""
    var strArriveTime:String = "" //dd-MM-yyyy HH:mm:ss
    
    
    
    
    var startStation:String = ""
    var endStation:String = ""
    
    
    var status:Status = .stopAtOrigin
    var crowdStatus:CrowdStatus = .low
    
    
    var timeTableID:String = ""
    
    var dewellTime:NSInteger = 0
    
    
    var timeStamp:NSInteger = 0
    // control command
    
    var speed:NSInteger = 0
    var direction:Direction = .go
    
    
    convenience init(fields:[String: Any]){
        
        self.init()
        
        
        self.readJson(fields: fields)
    }
    
    
    func readJson(fields:[String: Any]) {
        
        if let id = fields["id"] as? String{
            self.id = id
        }
        
        
        if let name = fields["name"] as? String{
            self.name = name
        }
        
        
        if let from = fields["from"] as? String{
            self.from = from
        }
        
        if let from = fields["from"] as? String{
            self.from = from
        }
        
        
        if let strDepartTime = fields["strDepartTime"] as? String{
            self.strDepartTime = strDepartTime
        }
        
        
        if let to = fields["to"] as? String{
            self.to = to
        }
        
        if let strArriveTime = fields["strArriveTime"] as? String{
            self.strArriveTime = strArriveTime
        }
        
        if let startStation = fields["startStation"] as? String{
            self.startStation = startStation
        }
        
        if let endStation = fields["endStation"] as? String{
            self.endStation = endStation
        }
        
        if let status = fields["status"] as? NSInteger{
            self.status = CarDataModel.Status(rawValue: status) ?? .unknown
        }
        
        if let crowdStatus = fields["crowdStatus"] as? NSInteger{
            self.crowdStatus = CarDataModel.CrowdStatus(rawValue: crowdStatus) ?? .low
        }
        
        
        
        
        
        
        
        if let timeTableID = fields["timeTableID"] as? String{
            self.timeTableID = timeTableID
        }
        
        
        if let timeTableID = fields["timeTableID"] as? String{
            self.timeTableID = timeTableID
        }
        
        
        
        
        
        if let dewellTime = fields["dewellTime"] as? NSInteger{
            self.dewellTime = dewellTime
        }
        
        
        if let speed = fields["speed"] as? NSInteger{
            self.speed = speed
        }
        
        
        
        if let direction = fields["direction"] as? NSInteger{
            self.direction = CarDataModel.Direction(rawValue: direction) ?? .go
        }
        
        
        if let timeStamp = fields["timeStamp"] as? NSInteger{
            self.timeStamp = timeStamp
        }
        
    }
    
    
    func getTimeStamp()->String{
        let dateDormat:DateFormatter = DateFormatter()
        dateDormat.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateDormat.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        let strTime = dateDormat.string(from: Date())
        return strTime
        
    }
    
    func getDictionary()->[String:Any]{
        
        //        let dateDormat:DateFormatter = DateFormatter()
        //        dateDormat.dateFormat = "dd-MM-yyyy HH:mm:ss"
        //        dateDormat.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        
        
        var newDic:[String:Any] = [String:Any]()
        newDic["id"] = self.id
        newDic["name"] = self.name
        newDic["from"] = self.from
        newDic["strDepartTime"] = self.strDepartTime
        newDic["to"] = self.to
        newDic["strArriveTime"] = self.strArriveTime
        newDic["startStation"] = self.startStation
        newDic["endStation"] = self.endStation
        newDic["status"] = self.status.rawValue
        newDic["crowdStatus"] = self.crowdStatus.rawValue
        newDic["timeTableID"] = self.timeTableID
        newDic["dewellTime"] = self.dewellTime
        newDic["speed"] = self.speed
        newDic["direction"] = self.direction.rawValue
        
        newDic["timeStamp"] = self.timeStamp
        
        return newDic
        
    }
    
}
