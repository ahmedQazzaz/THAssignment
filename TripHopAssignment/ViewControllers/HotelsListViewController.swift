//
//  ViewController.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit

class HotelsListViewController: SuperViewController {
    
    
    /* OUTLETS */
    
    @IBOutlet weak var hotelsTableView : UITableView!
    @IBOutlet weak var appliedSortAndFiltersView: UIView!        
    @IBOutlet weak var lb_sortTitle: UILabel!
    @IBOutlet weak var lb_filterTitle: UILabel!
    
    /* END */
    
    //This var should be filled from an API, or external source
    private var dataSource      : [Hotel] = []
    
    private var appliedSort     : HotelSortDescriptor = HotelSortDescriptor.noSorting()
    private var appliedFilter   : HotelFilterDescriptor = HotelFilterDescriptor.init()
    
    //This is the actual data to be presented in the TableView
    private var presentHotels   : [Hotel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Data should be fetched from external source
        self.dataSource = Manager.shared.modelsManager.buildDummyDataModel(size: 20)
        
        let noDataFound : UINib = UINib.init(nibName: "NoDataFoundTableViewCell", bundle: Bundle.main)
        self.hotelsTableView.register(noDataFound, forCellReuseIdentifier: "NoDataFoundTableViewCell")
        
        self.allLabels.forEach { (lb) in
            lb.font = Constants.appFont(useSize: 16, lb.tag == 1 ? .bold : .regular)
            lb.textColor = Constants.mainColorLight
        }
        
        
        self.UpdatePresenetData()
        self.prepareInterface()
    }
    
    
    @IBAction func sortButtonClicked(_ sender: UIBarButtonItem) {
        
        let actionSheet = UIAlertController.init(title: "Sort", message: "Select sorting type", preferredStyle: .actionSheet)
        
        let sortTypes = HotelSortDescriptor.getPossibleSortOptions()
        for sortDescriptor in sortTypes {
            actionSheet.addAction(UIAlertAction.init(title: sortDescriptor.title, style: .default, handler: { (action) in
                self.appliedSort = sortDescriptor
                self.UpdatePresenetData()
                self.prepareInterface()
            }))
        }
        
        actionSheet.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    @IBAction func FilterButtonClicked(_ sender: UIBarButtonItem) {
        let filterViewController = self.storyboard?.instantiateViewController(withIdentifier: "FilterSelectionViewController") as! FilterSelectionViewController
        filterViewController.delegate = self
        filterViewController.appliedFilters = self.appliedFilter
        self.navigationController?.pushViewController(filterViewController, animated: true)
        
    }
    
        
}



// Public functions
extension HotelsListViewController{
    
}


// Private Functions
private extension HotelsListViewController {
    
    func prepareInterface(){
        if(self.appliedFilter.isEmpty && self.appliedSort.type == .none){
            self.appliedSortAndFiltersView.isHidden = true
        }else{
            self.appliedSortAndFiltersView.isHidden = false
            
            if(self.appliedSort.type == .none){
                self.lb_sortTitle.superview?.isHidden = true
            }else{
                self.lb_sortTitle.superview?.isHidden = false
                self.lb_sortTitle.text = self.appliedSort.title
            }
            
            if(self.appliedFilter.isEmpty){
                self.lb_filterTitle.superview?.isHidden = true
            }else{
                self.lb_filterTitle.superview?.isHidden = false                                
                self.lb_filterTitle.text = self.appliedFilter.title
            }
            
        }
    }
    
    
    ///Check the Applied Filter, and Applied Sort and apply both to the data source array
    func UpdatePresenetData(){
        
        self.presentHotels = self.dataSource
        
        if(appliedFilter.isEmpty == false){
            self.presentHotels = self.appliedFilter.filterHotelsList(self.presentHotels)
        }
        self.presentHotels = self.appliedSort.sortHotelsList(self.presentHotels)
        
        self.hotelsTableView.reloadData()
        
    }
    
    func applySortOnDataSource()->[Hotel]{                
        return appliedSort.sortHotelsList(self.dataSource)
    }
    
    func applyFilterOnDataSource()->[Hotel]{
        return self.appliedFilter.filterHotelsList(self.dataSource)
    }
    
}


extension HotelsListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(self.presentHotels.count == 0){
            return 1;
        }
        
        return self.presentHotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(self.presentHotels.count == 0){
             return tableView.dequeueReusableCell(withIdentifier: "NoDataFoundTableViewCell")!
        }
        
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "HotelTableViewCell") as! HotelTableViewCell
        
        cell.fillHotelInfo(self.presentHotels[indexPath.row])
        
        return cell
        
    }
    
}


extension HotelsListViewController : FilterSelectionDelegate {
    
    func didChooseFilterAndWillApply(filters: HotelFilterDescriptor) {
        self.appliedFilter = filters
        self.UpdatePresenetData()
        self.prepareInterface()
    }
    
}
