//
//  HotelTableViewCell.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit
import HCSStarRatingView

class HotelTableViewCell: UITableViewCell {

    
    private(set) var hotelInto : Hotel!
    
    @IBOutlet weak var imgv_hotelImage: UIImageView!
    @IBOutlet weak var lb_hotelName: UILabel!
    @IBOutlet weak var lb_hotelPrice: UILabel!
    @IBOutlet weak var starsRating: HCSStarRatingView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lb_hotelName.font = Constants.appFont(useSize: 14, .regular)
        self.lb_hotelPrice.font = Constants.appFont(useSize: 10, .bold)
        self.starsRating.tintColor = Constants.secondaryColor
        self.starsRating.starBorderColor = Constants.secondaryColor
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillHotelInfo(_ hotel : Hotel){
        self.hotelInto = hotel
        
        self.imgv_hotelImage.image = hotel.image == nil ? UIImage.init(named: "ic_noImageFound") : hotel.image
        self.lb_hotelName.text = hotel.name
        self.lb_hotelPrice.text = String(format: "%2.2f $ / Night", hotel.price)
        self.starsRating.value = CGFloat(hotel.rating.rawValue)
    }

}
