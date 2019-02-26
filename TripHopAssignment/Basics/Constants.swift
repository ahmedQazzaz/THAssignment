//
//  Constants.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit


class Constants{
    
    //App URLs, and links
    
    
    //App Colors
    static let mainColorDark : UIColor = #colorLiteral(red: 0.01568627451, green: 0.05882352941, blue: 0.2235294118, alpha: 1)
    static let mainColorLight : UIColor = #colorLiteral(red: 0.1058823529, green: 0.5490196078, blue: 0.8, alpha: 1)
    static let secondaryColor : UIColor = #colorLiteral(red: 0.937254902, green: 0.8039215686, blue: 0.06666666667, alpha: 1)
    
    
    //App Fonts
    static func appFont(useSize size: CGFloat,_ style: FontStyle)->UIFont{
        var fontName = "Roboto-Regular"
        if(style == .bold){
            fontName = "Roboto-Bold"
        }else if (style == .medium){
            fontName = "Roboto-Medium"
        }
        
        return UIFont.init(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    
}
