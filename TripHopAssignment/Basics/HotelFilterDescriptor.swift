//
//  HotelFilterDescriptor.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit

class HotelFilterDescriptor {
    
    var textContained : String?
    var priceRange : Range<Double>?
    var hotelStarRatings : [HotelRating] = []
    
    var isEmpty : Bool {
        return self.textContained == nil && self.priceRange == nil && self.hotelStarRatings.isEmpty
    }
    
    var title : String{
        var filters = ""
        
        if(self.textContained != nil){
            filters.append("Name contains \"\(self.textContained!)\"\n")
        }
        
        if(self.priceRange != nil){
            filters.append(String(format: "price from %2.2f $ to %2.2f $\n", self.priceRange!.lowerBound, self.priceRange!.upperBound))
        }
        
        for rating in self.hotelStarRatings {
            filters.append("\(rating.title())")
            if(rating == self.hotelStarRatings.last){
                filters.append("\n")
            }else{
                filters.append(" OR\n")
            }
        }
        
        
        return filters
    }
    
    
    init() {}
}

//MARK:- Public Functions
extension HotelFilterDescriptor{
    
    func clearFilters(){
        self.textContained = nil
        self.priceRange = nil
        self.hotelStarRatings.removeAll()
    }
    
    func filterHotelsList(_ list:[Hotel])->[Hotel]{
        
        let filteredList = list.filter { (hotel) -> Bool in
            //Check for Name Filter
            if(textContained != nil){
                if(hotel.name.lowercased().contains(textContained!.lowercased()) == false){
                    return false
                }
            }
            
            //Check for Price Range
            if(priceRange != nil){
                if(priceRange?.contains(hotel.price) == false){
                    return false
                }
            }
            
            //Check for Stars Filter
            if(hotelStarRatings.isEmpty == false){
                if(self.hotelStarRatings.contains(hotel.rating) == false){
                    return false
                }
            }
            
            return true
        }
        
        return filteredList
    }
}

