//
//  HotelSort.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit

class HotelSortDescriptor {

    private(set) var type : SortType
    private(set) var scale : SortScale
    
    var title : String{
        if(type == .none){
            return type.rawValue
        }else{
            return "\(type.rawValue) from \(scale.rawValue)"
        }
    }

    private  init(_ type: SortType,_ scale: SortScale = .lowToHigh) {
        self.type = type
        self.scale = scale
    }
    
}


//MARK:- Public Functions
extension HotelSortDescriptor{
    func sortHotelsList(_ list : [Hotel])->[Hotel]{
        
        if(self.type == .none){
            return list
        }
        
        let sortedDataSource = list.sorted { (firstHotel, secondHotel) -> Bool in
            
            if(self.type == .price){
                if(self.scale == .highToLow){
                    if(firstHotel.price > secondHotel.price){
                        return true
                    }
                }else{
                    if(firstHotel.price < secondHotel.price){
                        return true
                    }
                }
            }else{
                
                if(self.scale == .highToLow){
                    if(firstHotel.rating.rawValue > secondHotel.rating.rawValue){
                        return true
                    }
                }else{
                    if(firstHotel.rating.rawValue < secondHotel.rating.rawValue){
                        return true
                    }
                }
            }
            
            return false
        }
        
        return sortedDataSource
    }
}

//MARK:- Static Functions
extension HotelSortDescriptor {
    
    static func getPossibleSortOptions()->[HotelSortDescriptor]{
        return [noSorting(),
                lowToHighPrice(),
                highToLowPrice(),
                lowToHighStars(),
                highToLowStars()]
    }
    
    
    static func noSorting()->HotelSortDescriptor{
        return HotelSortDescriptor.init(.none)
    }
    
    static func highToLowPrice()->HotelSortDescriptor{
        return HotelSortDescriptor.init(.price, .highToLow)
    }
    
    static func highToLowStars()->HotelSortDescriptor{
        return HotelSortDescriptor.init(.stars, .highToLow)
    }
    
    static func lowToHighPrice()->HotelSortDescriptor{
        return HotelSortDescriptor.init(.price, .lowToHigh)
    }
    
    static func lowToHighStars()->HotelSortDescriptor{
        return HotelSortDescriptor.init(.stars, .lowToHigh)
    }
    
}
