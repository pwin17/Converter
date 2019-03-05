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
    

    @IBOutlet weak var tempt_input: UITextField!
    @IBOutlet weak var tempt_picker: UIPickerView!
    @IBOutlet weak var tempt_result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tempt_picker.delegate = self
        //tempt_picker.dataSource = self
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
    
    @IBAction func temptConvert(_ sender: Any) {
        var temp = Double(tempt_input.text!)!
        var input_tempt = temp
        
        //Convert any unit to C
        
        if ((tempt_from == 0) && (tempt_to == 0)){ //C to C
            input_tempt = Double(input_tempt)
        }
        
        if ((tempt_from == 0) && (tempt_to == 1)){ //C to F
            input_tempt = Double((input_tempt * (9/5)) + 32)
        }
        
        if ((tempt_from == 0) && (tempt_to == 2)){ //C to K
            input_tempt = Double(input_tempt + 273.15)
        }
        
        if ((tempt_from == 1) && (tempt_to == 0)){ //F to C
            input_tempt = Double((input_tempt-32) * (5/9))
        }
        
        if ((tempt_from == 1) && (tempt_to == 1)){ //F to F
            input_tempt = Double(input_tempt)
        }
        
        if ((tempt_from == 1) && (tempt_to == 2)){ //F to K
            input_tempt = Double(((input_tempt - 32) * (5/9)) + 273.15)
        }

        if ((tempt_from == 2) && (tempt_to == 0)){ //K to C
            input_tempt = Double(input_tempt - 273.15)
        }
        
        if ((tempt_from == 2) && (tempt_to == 1)){ //K to F
            input_tempt = Double(((input_tempt - 273.15) * (9/5)) + 32)
        }
        
        if ((tempt_from == 2) && (tempt_to == 2)){ //K to C
            input_tempt = Double(input_tempt)
        }
        
        tempt_result.text = " \(temp) \(temperature_units[tempt_from]) = \(input_tempt) \(temperature_units[tempt_to]) "
        
    }
    
    
    
}
