//
//  FilterSelectionViewController.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit
import TTRangeSlider
import SimpleCheckbox


class FilterSelectionViewController: SuperViewController {

    /* OUTLETS */
    @IBOutlet weak var priceRangeSlider: TTRangeSlider!
    @IBOutlet weak var txt_nameKeyword: UITextField!
    @IBOutlet weak var btn_apply: UIButton!
    @IBOutlet weak var enableCheckBox: Checkbox!    
    /* END */
    
    var delegate : FilterSelectionDelegate!
    var appliedFilters : HotelFilterDescriptor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareIntrface()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.applyFilters()
    }

    @IBAction func RatingButtonSelected(_ sender: UIButton) {
        
        // Not selected
        if(sender.tag > 0){
            sender.superview?.layer.borderColor = Constants.mainColorLight.cgColor
            sender.superview?.backgroundColor = Constants.mainColorLight
            sender.setTitleColor(UIColor.white, for: .normal)
            
            if let rating = HotelRating.getHotelRating(sender.tag) {
                appliedFilters.hotelStarRatings.append(rating)
            }
        // Is selected
        }else{
            sender.superview?.layer.borderColor = UIColor.darkGray.cgColor
            sender.superview?.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.darkGray, for: .normal)
            
                appliedFilters.hotelStarRatings.removeAll { (rating) -> Bool in
                    if(rating.rawValue == abs(sender.tag)){
                        return true
                    }
                    
                    return false
                }
        }
        
        sender.tag *= -1
        
    }
    
    func applyFilters() {
        
        if(self.txt_nameKeyword.text?.isEmpty ?? true) == false{
            self.appliedFilters.textContained = self.txt_nameKeyword.text
        }else{
            self.appliedFilters.textContained = nil
        }
        
        if(self.enableCheckBox.isChecked == true){
            self.appliedFilters.priceRange = Range.init(uncheckedBounds: (Double(self.priceRangeSlider.selectedMinimum), Double(self.priceRangeSlider.selectedMaximum)))
        }else{
            self.appliedFilters.priceRange = nil
        }
        
        
        self.delegate.didChooseFilterAndWillApply(filters: self.appliedFilters)
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK:- Private Functions
private extension FilterSelectionViewController {
    
    func prepareIntrface(){
       
        self.priceRangeSlider.tintColor = Constants.mainColorLight
        
        self.allLabels.forEach { (lb) in
            lb.font = Constants.appFont(useSize: 16, .regular)
            lb.textColor = Constants.mainColorDark
        }
        
        self.allButton.forEach { (btn) in
            btn.titleLabel?.font = Constants.appFont(useSize: 14, .regular)
        }
        
        self.btn_apply.setTitleColor(Constants.mainColorLight, for: .normal)
        self.enableCheckBox.borderStyle = .square
        self.enableCheckBox.tintColor = Constants.mainColorLight
        self.enableCheckBox.borderWidth = 1
        self.enableCheckBox.checkmarkColor = Constants.mainColorLight
        self.enableCheckBox.checkmarkStyle = .tick
        
        
        self.txt_nameKeyword.text = self.appliedFilters.textContained
        if(self.appliedFilters.priceRange != nil){
            self.enableCheckBox.isChecked = true
            self.priceRangeSlider.selectedMinimum = Float(self.appliedFilters.priceRange!.lowerBound)
            self.priceRangeSlider.selectedMaximum = Float(self.appliedFilters.priceRange!.upperBound)
        }
        
        self.appliedFilters.hotelStarRatings.forEach { (rating) in
            if let btn = self.view.viewWithTag(rating.rawValue) as? UIButton {
                btn.superview?.layer.borderColor = Constants.mainColorLight.cgColor
                btn.superview?.backgroundColor = Constants.mainColorLight
                btn.setTitleColor(UIColor.white, for: .normal)
                btn.tag *= -1
            }
        }
        
        
    }
    
}


protocol FilterSelectionDelegate {
    
    func didChooseFilterAndWillApply(filters : HotelFilterDescriptor)
    
}
