//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Cody Polton on 27/10/2019.
//  Copyright © 2019 Cody Polton. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    
    var converters = [Converters(label: "fahrenheit to celcius", inputUnit: "°F",  outputUnit: "°C"),
                      Converters(label: "celcius to fahrenheit", inputUnit: "°C",  outputUnit: "°F"),
        Converters(label: "miles to kilometers", inputUnit: "mi",  outputUnit: "km"),
         Converters(label: "kilometers to miles", inputUnit: "km",  outputUnit: "mi")
    ]
    
    @IBAction func convert(_ sender: Any) {
        let alert = UIAlertController(title: "Converter", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertAction.Style.default, handler: {(alertAction) -> Void in
                let conv = self.converters[0]
                self.outputDisplay.text = conv.outputUnit
                self.inputDisplay.text = conv.inputUnit
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenhiet", style: UIAlertAction.Style.default, handler: {(alertAction) -> Void in
                let conv = self.converters[1]
                self.outputDisplay.text = conv.outputUnit
                self.inputDisplay.text = conv.inputUnit
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertAction.Style.default, handler: {(alertAction) -> Void in
                let conv = self.converters[2]
                self.outputDisplay.text = conv.outputUnit
                self.inputDisplay.text = conv.inputUnit
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertAction.Style.default, handler: {(alertAction) -> Void in
                let conv = self.converters[3]
                self.outputDisplay.text = conv.outputUnit
                self.inputDisplay.text = conv.inputUnit
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad(){
        let conv = converters[0]
        outputDisplay.text = conv.outputUnit
        inputDisplay.text = conv.inputUnit
    }
    
    
   
}
struct Converters{
    let label: String
    let inputUnit: String
    let outputUnit: String
}
