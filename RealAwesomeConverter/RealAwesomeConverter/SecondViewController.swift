//
//  SecondViewController.swift
//  RealAwesomeConverter
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Group H. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    var weight_units = ["kg", "g", "mg", "lb", "oz", "ton"]
    var unit_from = 0, unit_to: Int = 0
    
    //OBJECTS
    @IBOutlet weak var weight_input: UITextField!
    @IBOutlet weak var weight_pickerview: UIPickerView!
    @IBOutlet weak var weight_output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weight_pickerview.delegate = self
        weight_pickerview.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weight_units[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weight_units.count
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        unit_from = pickerView.selectedRow(inComponent: 0) //get row from the "convert from pickerView"
        unit_to = pickerView.selectedRow(inComponent: 1)//get row from the "convert to pickerView"
    }
    
    @IBAction func weight_convert(_ sender: Any){
        var input_value = Double(weight_input.text!)!
        var temp = input_value
        
     /* --------------- Convert any unit to KM ------------ */
        
        if (unit_from == 1){ //g to kg
            temp = Double(temp/1000)
        }
        if (unit_from == 2){ //mg to kg
            temp = Double(temp/1000000)
        }
        if (unit_from == 3){ //lb to kg
            temp = Double(temp/2.20462)
        }
        if (unit_from == 4){ //oz to kg
            temp = Double(temp/35.274)
        }
        if (unit_from == 5){ //ton to kg
            temp = Double(temp/0.00110231)
        }
    /* --------------- Convert from KM to any unit------------ */
        
        if (unit_to == 0){
            weight_output.text = " \(input_value) \(weight_units[unit_from]) = \(temp) \(weight_units[unit_to]) "
        }
        if (unit_to == 1){
            temp = Double(temp*1000) //kg to g
            weight_output.text = " \(input_value) \(weight_units[unit_from]) = \(temp) \(weight_units[unit_to]) "
        }
        if (unit_to == 2){
            temp = Double(temp*1000000) //kg to mg
            weight_output.text = " \(input_value) \(weight_units[unit_from]) = \(temp) \(weight_units[unit_to]) "
        }
        if (unit_to == 3){
            temp = Double(temp*2.20462) //kg to lb
            weight_output.text = " \(input_value) \(weight_units[unit_from]) = \(temp) \(weight_units[unit_to]) "
        }
        if (unit_to == 4){
            temp = Double(temp*35.274) //kg to oz
            weight_output.text = " \(input_value) \(weight_units[unit_from]) = \(temp) \(weight_units[unit_to]) "
        }
        if (unit_to == 5){
            temp = Double(temp*0.00110231) //kg to ton
            weight_output.text = " \(input_value) \(weight_units[unit_from]) = \(temp) \(weight_units[unit_to]) "
    }
    
}






}
