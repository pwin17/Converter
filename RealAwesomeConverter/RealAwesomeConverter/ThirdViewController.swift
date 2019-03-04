//
//  ThirdViewController.swift
//  RealAwesomeConverter
//
//  Created by Student on 3/2/19.
//  Copyright © 2019 Group H. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    var myCurrency:[String] = []
    var myValues:[Double] = []
    
    var To:Int = 0
    var From:Int = 0
    
    var ToCurrency:Double = 0
    var FromCurrency:Double = 0
    
    
    //Objects
    @IBOutlet weak var Input: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var output: UILabel!
    
    //CREATING PICKER VIEW
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.myCurrency.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.myCurrency[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //activeCurrency = myValues[row]
        To = pickerView.selectedRow(inComponent: 0)
        From = pickerView.selectedRow(inComponent: 1)
        ToCurrency = self.myValues[To]
        FromCurrency = self.myValues[From]
    }
    
    //Button
    @IBAction func Convert(_ sender: Any)
    {
        if (Input.text != "")
        {
            output.text = String(Double(Input.text!)! * (1/ToCurrency) * FromCurrency)
        }
    }
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //pickerView.delegate = self
        //pickerView.dataSource = self
        
        //Getting Data
        let url = URL(string: "http://www.apilayer.net/api/live?access_key=1b759db15c251757651faf643ca2815b&fbclid=IwAR29w_d3AzVLPsNkvhx6CbZjuy_RKx00eyLOUcsB2x5MrLVYAI11ipDWF6M")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let quotes = myJson["quotes"] as? NSDictionary
                        {
                            for (key, value) in quotes
                            {
                                let k = (key as? String)! // changing key into string
                                let k1 = k.replacingOccurrences(of: "USD", with: "") //removing USD
                                self.myCurrency.append(k1)
                                self.myValues.append((value as? Double)!)
                            }
                            self.myCurrency[23] = "USD" // Since "USDUSD" became an empty string after the loop
                            print (self.myCurrency)
                            print (self.myValues)
                        }
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
            self.pickerView.reloadAllComponents()
        }
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
