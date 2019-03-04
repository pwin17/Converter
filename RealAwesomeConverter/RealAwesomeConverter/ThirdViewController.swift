//
//  ThirdViewController.swift
//  RealAwesomeConverter
//
//  Created by Student on 3/2/19.
//  Copyright © 2019 Group H. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController
{
    var myCurrency:[String] = []
    var myValues:[Double] = []
    
    var ToCurrency:Int = 0
    var FromCurrency:Int = 0
    
    //Objects
    
    
    //CREATING PICKER VIEW
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myCurrency.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myCurrency[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //activeCurrency = myValues[row]
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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
                                self.myCurrency.append((key as? String)!)
                                self.myValues.append((value as? Double)!)
                            }
                            //print (self.myCurrency)
                            //print (self.myValues)
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
            //self.pickerView.reloadAllComponents()
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
