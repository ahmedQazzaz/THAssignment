//
//  Enumerations.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import Foundation

//MARK:- Hotels Options Enums
enum HotelRating : Int {
    case oneStar = 1
    case twoStars = 2
    case threeStars = 3
    case fourStars = 4
    case fiveStars = 5
    
    
    ///Get HotelRating Enum from integer value, value should be limited to the closed range from 1 to 5
    ///- Parameter value: It is an integer value should be limited to closed range from 1 to 5
    static func getHotelRating(_ value : Int)->HotelRating?{
        switch value {
        case 1:
            return .oneStar
        case 2:
            return .twoStars
        case 3:
            return .threeStars
        case 4:
            return .fourStars
        case 5:
            return .fiveStars
        default:
            return nil
        }
    }
    
    func title()->String{
        switch self {
        case .oneStar:
            return "One Star"
       
        case .twoStars:
            return "Two Stars"
        case .threeStars:
            return "Three Stars"
        case .fourStars:
            return "Four Stars"
        case .fiveStars:
            return "Five Stars"
        }
    }
    
}


//MARK:- Hotels Sort Enums
enum SortType : String{
    case price = "Price"
    case stars = "Stars"
    case none = "No Sorting"
}

enum SortScale : String{
    case highToLow = "high to low"
    case lowToHigh = "low to high"
}


//MARK:- App Configuration Enums
enum FontStyle{
    case bold
    case medium
    case regular
}
