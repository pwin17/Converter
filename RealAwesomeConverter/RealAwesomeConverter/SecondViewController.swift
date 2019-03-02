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
    var placement = 0
    
    /*
     var convertedNum = Double(weight_input.text!)!
     
     var to_g = Double(convertedNum * 1000)
     var to_mg = Double(convertedNum * 1000000)
     var to_lb = Double(convertedNum * 2.20462)
     var to_oz = Double(convertedNum * 35.274)
     var to_ton = Double(convertedNum * 0.00110231)
     */
    
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
        return 1
    }
    
    
    @IBAction func weight_convert(_ sender: Any){
        var convertedNum = Double(weight_input.text!)!
        if (placement == 0){
            weight_output.text = " \(convertedNum) kg"
        }
        if (placement == 1){
            var to_g = Double(convertedNum * 1000)
            weight_output.text = " \(to_g) g"
        }
        if (placement == 2){
            var to_mg = Double(convertedNum * 1000000)
            weight_output.text = " \(to_mg) mg"
        }
        if (placement == 3){
            var to_lb = Double(convertedNum * 2.20462)
            weight_output.text = " \(to_lb) lb"
        }
        if (placement == 4){
            var to_oz = Double(convertedNum * 35.274)
            weight_output.text = " \(to_oz) oz"
        }
        if (placement == 5){
            var to_ton = Double(convertedNum * 0.00110231)
            weight_output.text = " \(to_ton) ton"
        }
}
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placement = row
    }
    
  
    
    
   
    
}






