//
//  Hotel.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit

class Hotel: SuperModel {
    
    private(set) var name : String
    private(set) var rating : HotelRating
    private(set) var price : Double
    private(set) var image : UIImage?
    
    
    init(_ hotelName : String, ratingValue : Int, priceValue : Double, hotelImage : UIImage? = nil) {
        self.name = hotelName
        self.rating = HotelRating.getHotelRating(ratingValue) ?? .oneStar
        self.price = priceValue
        self.image = hotelImage
    }
    
    
    override var description: String{
        return "<Hotel : \(name), \(rating), \(String(format: "%2.2f", price)), \(image == nil ? "Do not have image" : "Yes it has image")>"
    }
    
}
