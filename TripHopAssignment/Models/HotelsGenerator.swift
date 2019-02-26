//
//  HotelsGenerator.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit

class HotelsGenerator: SuperModel {
    
    private let tempHotesNames : [String] = ["Hotel Newton",
                                             "Paramount Times Square",
                                             "The Manhattan at Times Square Hotel",
                                             "Chelsea Inn",
                                             "Row Nyc",
                                             "Astor on the Park",
                                             "Night Hotel Times Square",
                                             "The Skyline Hotel",
                                             "Hotel Wolcott",
                                             "The Ridge Hotel",
                                             "Carnegie Hotel",
                                             "The Hotel 91",
                                             "Wellington Hotel",
                                             "Life Hotel NoMad",
                                             "Salisbury Hotel",
                                             "The Marcel at Gramercy",
                                             "Hotel Mela Times Square",
                                             "Nyma The New York Manhattan Hotel",
                                             "Amsterdam Court Hotel",
                                             "The New Yorker, A Wyndham Hotel",
                                             "Madison LES Hotel"]
    
    ///Generate a dummy hotel info for testing purposes only
    func getDummyHotel()->Hotel{
        let name = self.tempHotesNames[(0..<self.tempHotesNames.count).randomValue]
        let image = UIImage.init(named: "hotel_\((1...9).randomValue)")
        
        return Hotel.init(name, ratingValue: (1...5).randomValue, priceValue: Double.random(in: 50 ..< 500.0),hotelImage: image)
    }
    
    ///Generate a dummy list of hotels for testing purposes only
    func buildDummyDataModel(size : Int = 10)->[Hotel] {
        var resultList : [Hotel] = []
        
        for _ in 0..<size {
            resultList.append(self.getDummyHotel())
        }
        
        return resultList
    }
}
