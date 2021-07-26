//
//  TemperatureConverterViewController.swift
//  MetricImperialConverter
//
//  Project #2 : Build a Metric to Imperial Converter
//

import UIKit

class TemperatureConverterViewController: UIViewController { // ViewController for Temperature conversions
    
    var conversionType : String?

    @IBOutlet weak var conversionTypeLabel: UILabel!
    
    @IBOutlet var startingUnits: [UIButton]!
    
    @IBOutlet var endingUnits: [UIButton]!

    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var inputUnits: UITextField!
    
    var startUnit : String? = nil
    var endUnit : String? = nil
    
    var inputValue : Double?
    
    @IBOutlet weak var startOverOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conversionTypeLabel.text = "\(conversionType!) Conversion"

    }
    
    @IBAction func selectStartingUnit(_ sender: UIButton) {
    
        for startingUnit in startingUnits {
            if startingUnit.currentTitle == sender.currentTitle {
                startingUnit.isSelected = true
                outputLabel.text = startingUnit.currentTitle
                startUnit = startingUnit.currentTitle
        
            }else{
                startingUnit.isSelected = false
            }
        }
    }
    
    
    @IBAction func selectEndingUnit(_ sender: UIButton) {
        
        for endingUnit in endingUnits {
            if endingUnit.currentTitle == sender.currentTitle {
                endingUnit.isSelected = true
                outputLabel.text = endingUnit.currentTitle
                endUnit = endingUnit.currentTitle
            }else{
                endingUnit.isSelected = false
            }
        }
    }
    
    @IBAction func convertUnits(_ sender: UIButton) {
        guard let sunit = startUnit, let eunit = endUnit else {
            print("Inputs not selected") // No alerts for validation checks for now
            return
            
        }
        
        if(inputUnits.text == ""){
            print("No input value entered") // No alerts for validation checks for now
            return
        }else{
            inputValue = Double(inputUnits.text!)
        }
        
        startOverOutlet.isHidden = false
        
        if sunit == eunit { // when starting and ending units are the same
            outputLabel.text = " = \(inputValue!) \(endUnit!)"
        }else if sunit == "Farenheit"{
            farenheitToCelciusConverter() // Calling function to convert from Fahrenheit to Celsius
        }else if sunit == "Celcius"{
            celciusToFarenheitConverter() // Calling function to convert from Celsius to Fahrenheit
        }
        
    }
    
    // Function to convert from Fahrenheit to Celsius
    func farenheitToCelciusConverter(){
        
        let fahrenheit = Measurement(value: inputValue!, unit: UnitTemperature.fahrenheit)
        
        switch  endUnit {
            case "Celcius":
                let celcius = fahrenheit.converted(to: UnitTemperature.celsius)
                outputLabel.text = " = \(String(format : "%.2f",celcius.value)) \(celcius.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function to convert from Celsius to Fahrenheit
    func celciusToFarenheitConverter(){
        
        let celcius = Measurement(value: inputValue!, unit: UnitTemperature.celsius)
        
        switch  endUnit {
            case "Farenheit":
                let fahrenheit = celcius.converted(to: UnitTemperature.fahrenheit)
                outputLabel.text = " = \(String(format : "%.2f",fahrenheit.value)) \(fahrenheit.unit.symbol)"
            default:
                print("")
        }
    }
    
}
