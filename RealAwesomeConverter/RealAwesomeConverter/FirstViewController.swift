//
//  FirstViewController.swift
//  RealAwesomeConverter
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Group H. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var length_units = ["km", "m", "mile", "yard", "ft", "in"]
    var unit_from = 0, unit_to: Int = 0
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var pv_from: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pv_from.delegate = self
        pv_from.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return length_units[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return length_units.count
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        unit_from = pickerView.selectedRow(inComponent: 0) //get row from the "convert from pickerView"
        unit_to = pickerView.selectedRow(inComponent: 1)//get row from the "convert to pickerView"
    }
    
    @IBAction func length_convert(_ sender: Any) {
        var input_value = Double(input.text!)!
        var temp = input_value
        
        /* --------------- Convert any unit to KM ------------ */
        
        if (unit_from == 1){ //m to km
            temp = Double(temp/1000)
        }
        if (unit_from == 2){ //mile to km
            temp = Double(temp*1.60934)
        }
        if (unit_from == 3){ //yard to km
            temp = Double(temp*0.0009144)
        }
        if (unit_from == 4){ //ft to m
            temp = Double(temp*0.0003048)
        }
        if (unit_from == 5){ //in to m
            temp = Double(temp*2.54e-5)
        }
        
        /* --------------- Convert from KM to any unit------------ */
        
        if (unit_to == 0){
            output.text = " \(input_value) \(length_units[unit_from]) = \(temp) \(length_units[unit_to]) "
        }
        if (unit_to == 1){
            temp = Double(temp*1000) //km to m
            output.text = " \(input_value) \(length_units[unit_from]) = \(temp) \(length_units[unit_to]) "
        }
        if (unit_to == 2){
            temp = Double(temp*0.621371) //km to mile
            output.text = " \(input_value) \(length_units[unit_from]) = \(temp) \(length_units[unit_to]) "
        }
        if (unit_to == 3){
            temp = Double(temp*1093.61) //km to yard
            output.text = " \(input_value) \(length_units[unit_from]) = \(temp) \(length_units[unit_to]) "
        }
        if (unit_to == 4){
            temp = Double(temp*3280.84) //km to ft
            output.text = " \(input_value) \(length_units[unit_from]) = \(temp) \(length_units[unit_to]) "
        }
        if (unit_to == 5){
            temp = Double(temp*39370.1) //km to in
            output.text = " \(input_value) \(length_units[unit_from]) = \(temp) \(length_units[unit_to]) "
        }
        
        
    }
 
    
}//end of class

