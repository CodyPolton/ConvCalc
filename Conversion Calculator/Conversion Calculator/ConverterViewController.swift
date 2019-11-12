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
    
    var index = 0
    
    var dotpressed = false
    
    var converters = [Converters(label: "fahrenheit to celcius", inputUnit: " °F",  outputUnit: " °C"),
                      Converters(label: "celcius to fahrenheit", inputUnit: " °C",  outputUnit: " °F"),
        Converters(label: "miles to kilometers", inputUnit: " mi",  outputUnit: " km"),
         Converters(label: "kilometers to miles", inputUnit: " km",  outputUnit: " mi")
    ]
    
    @IBAction func convert(_ sender: Any) {
        let input = self.inputDisplay.text?.dropLast(3)
        let alert = UIAlertController(title: "Converter", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertAction.Style.default, handler: {(alertAction) -> Void in
                let conv = self.converters[0]
                self.index = 0
            if(input!.count > 0){
                var num = Double(String(input!))
                num = (num! - 32) * 5/9
                self.outputDisplay.text = String(format:"%.2f", num!) + conv.outputUnit
            }else{
                self.outputDisplay.text = conv.outputUnit
            }
            self.inputDisplay.text = input! + conv.inputUnit
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenhiet", style: UIAlertAction.Style.default, handler: {(alertAction) -> Void in
                let conv = self.converters[1]
                self.index = 1
            if(input!.count > 0){
                var num = Double(String(input!))
                num = (num! * 9/5) + 32
                self.outputDisplay.text = String(format:"%.2f", num!) + conv.outputUnit
            }else{
                self.outputDisplay.text = conv.outputUnit
            }
            self.inputDisplay.text = input! + conv.inputUnit
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertAction.Style.default, handler: {(alertAction) -> Void in
                let conv = self.converters[2]
                self.index = 2
                if(input!.count > 0){
                    var num = Double(String(input!))
                    num = (num! * 1.60934)
                    self.outputDisplay.text = String(format:"%.2f", num!) + conv.outputUnit
                }else{
                    self.outputDisplay.text = conv.outputUnit
                }
                self.inputDisplay.text = input! + conv.inputUnit
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertAction.Style.default, handler: {(alertAction) -> Void in
                let conv = self.converters[3]
                self.index = 3
                if(input!.count > 0){
                    var num = Double(String(input!))
                    num = (num! / 1.60934)
                    self.outputDisplay.text = String(format:"%.2f", num!) + conv.outputUnit
                }else{
                    self.outputDisplay.text = conv.outputUnit
                }
                self.inputDisplay.text = input! + conv.inputUnit
        }))
        self.present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func clear(_ sender: Any) {
        if(self.index == 3){
            let conv = self.converters[3]
            self.outputDisplay.text = conv.outputUnit
            self.inputDisplay.text = conv.inputUnit
        }
        if(self.index == 2){
            let conv = self.converters[2]
            self.outputDisplay.text = conv.outputUnit
            self.inputDisplay.text = conv.inputUnit
        }
        if(self.index == 1){
            let conv = self.converters[1]
            self.outputDisplay.text = conv.outputUnit
            self.inputDisplay.text = conv.inputUnit
        }
        if(self.index == 0){
            let conv = self.converters[0]
            self.outputDisplay.text = conv.outputUnit
            self.inputDisplay.text = conv.inputUnit
        }
        dotpressed = false
        
    }
    @IBAction func signbutton(_ sender: Any) {
        
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        if(inputtext.count != 0){
        if(inputtext.contains("-")){
            let input = inputtext.dropFirst()
            print(input)
            self.inputDisplay.text = String(input)
            conversion(String(input))
        }else{
            let convert = "-" + inputtext
            self.inputDisplay.text = convert
            conversion(convert)
        }
        }
    }
    @IBAction func buttondot(_ sender: Any) {
        let inputtext = self.inputDisplay.text ?? " "
        if(!dotpressed){
        if(inputtext.count < 4){
            
        }else{
            let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
            let convert =  inputtext + "."
            conversion(convert)
            dotpressed = true
        }
            
        }
    }
    
    @IBAction func buttonzero(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "0"
        conversion(convert)
    }
    @IBAction func buttonthree(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "3"
        conversion(convert)
    }
    @IBAction func buttontwo(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "2"
        conversion(convert)
    }
    @IBAction func buttonone(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "1"
        conversion(convert)
    }
    @IBAction func buttonsix(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "6"
        conversion(convert)
    }
    @IBAction func buttonfive(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "5"
        conversion(convert)
    }
    @IBAction func buttonfour(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "4"
        conversion(convert)
    }
    @IBAction func buttonnine(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "9"
        conversion(convert)
    }
    @IBAction func buttoneight(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "8"
        conversion(convert)
    }
    @IBAction func buttonseven(_ sender: Any) {
        let inputtext = String((self.inputDisplay.text?.dropLast(3))!)
        let convert =  inputtext + "7"
        conversion(convert)
    }
    override func viewDidLoad(){
        let conv = converters[0]
        outputDisplay.text = conv.outputUnit
        inputDisplay.text = conv.inputUnit
    }
    
    func conversion(_ convert: String){
        if(self.index == 0){
            self.inputDisplay.text = convert + " °F"
            var num = Double(convert)
            num = (num! - 32) * 5/9
            self.outputDisplay.text = String(format:"%.2f", num!) + " °C"
        }else if(self.index == 1){
            self.inputDisplay.text = convert + " °C"
            var num = Double(convert)
            num = (num! * 9/5) + 32
            self.outputDisplay.text = String(format:"%.2f", num!) + " °F"
        }else if(self.index == 2){
            self.inputDisplay.text = convert + " mi"
            var num = Double(convert)
            num = (num! * 1.60934)
            self.outputDisplay.text = String(format:"%.2f", num!) + " km"
            
        }else if(self.index == 3){
            self.inputDisplay.text = convert + " km"
            var num = Double(convert)
            num = (num! / 1.60934)
            self.outputDisplay.text = String(format:"%.2f", num!) + " mi"
            
        }
    }
    
    
   
}
struct Converters{
    let label: String
    let inputUnit: String
    let outputUnit: String
}
