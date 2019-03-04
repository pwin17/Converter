//
//  FourthViewController.swift
//  RealAwesomeConverter
//
//  Created by Student on 3/3/19.
//  Copyright © 2019 Group H. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var temperature_units:[String] = ["C", "F", "K"]
    var tempt_from = 0, tempt_to: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperature_units.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return temperature_units[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tempt_from = pickerView.selectedRow(inComponent: 0)
        tempt_to = pickerView.selectedRow(inComponent: 1
        )
    }
    
    
    
    
}
