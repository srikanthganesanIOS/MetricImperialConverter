//
//  LengthConverterViewController.swift
//  MetricImperialConverter
//
//  Project #2 : Build a Metric to Imperial Converter
//

import UIKit

class LengthConverterViewController: UIViewController { // ViewController for Length Conversions
    
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
            print("No input value entered") // No alerts for validtion checks for now
            return
        }else{
            inputValue = Double(inputUnits.text!)
        }
        
        startOverOutlet.isHidden = false
        
        if sunit == eunit { // when selected starting and ending units are same
            outputLabel.text = " = \(inputValue!) \(endUnit!)"
        }else if sunit == "Inches"{
            inchesToOthersConverter() // Calling function to convert from inches to Other units
        }else if sunit == "Feet"{
            feetToOthersConverter() // Calling function to convert from feet to other units
        }else if sunit == "Yard"{
            yardToOthersConverter() // calling function to convert from yard to other units
        }else if sunit == "Miles"{
            milesToOthersConverter() // calling function to convert from miles to other units
        }else if sunit == "Millimeters"{
            millimetersToOthersConverter() // Calling function to convert from millimeters to other units
        }else if sunit == "Centimeters"{
            centimetersToOthersConverter() // Calling function to convert from centimeters to other units
        }else if sunit == "Meters"{
            metersToOthersConverter() // Calling function to convert from meters to other units
        }else if sunit == "Kilometers"{
            kilometersToOthersConverter() // Calling function to convert from kilometers to other units
        }
        
    }
    
    // Function to convert from inches to other units
    func inchesToOthersConverter(){
        
        let inches = Measurement(value: inputValue!, unit: UnitLength.inches)
        
        switch  endUnit {
            case "Feet":
                let feet = inches.converted(to: UnitLength.feet)
                outputLabel.text = " = \(String(format : "%.3f",feet.value)) \(feet.unit.symbol)"
            case "Yard":
                let yards = inches.converted(to: UnitLength.yards)
                outputLabel.text = " = \(String(format : "%.3f",yards.value)) \(yards.unit.symbol)"
            case "Miles":
                let miles = inches.converted(to: UnitLength.miles)
                outputLabel.text = " = \(String(format : "%.6f",miles.value)) \(miles.unit.symbol)"
            case "Millimeters" :
                let millimeters = inches.converted(to: UnitLength.millimeters)
                outputLabel.text = " = \(String(format : "%.3f",millimeters.value)) \(millimeters.unit.symbol)"
            case "Centimeters" :
                let centimeters = inches.converted(to: UnitLength.centimeters)
                outputLabel.text = " = \(String(format : "%.3f",centimeters.value)) \(centimeters.unit.symbol)"
            case "Meters" :
                let meters = inches.converted(to: UnitLength.meters)
                outputLabel.text = " = \(String(format : "%.3f",meters.value)) \(meters.unit.symbol)"
            case "Kilometers" :
                let kilometers = inches.converted(to: UnitLength.kilometers)
                outputLabel.text = " = \(String(format : "%.6f",kilometers.value)) \(kilometers.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function to convert from feet to other units
    func feetToOthersConverter(){
        
        let feet = Measurement(value: inputValue!, unit: UnitLength.feet)
        
        switch  endUnit {
            case "Inches":
                let inches = feet.converted(to: UnitLength.inches)
                outputLabel.text = " = \(String(format : "%.3f",inches.value)) \(inches.unit.symbol)"
            case "Yard":
                let yard = feet.converted(to: UnitLength.yards)
                outputLabel.text = " = \(String(format : "%.3f",yard.value)) \(yard.unit.symbol)"
            case "Miles":
                let miles = feet.converted(to: UnitLength.miles)
                outputLabel.text = " = \(String(format : "%.6f",miles.value)) \(miles.unit.symbol)"
            case "Millimeters" :
                let millimeters = feet.converted(to: UnitLength.millimeters)
                outputLabel.text = " = \(String(format : "%.3f",millimeters.value)) \(millimeters.unit.symbol)"
            case "Centimeters" :
                let centimeters = feet.converted(to: UnitLength.centimeters)
                outputLabel.text = " = \(String(format : "%.3f",centimeters.value)) \(centimeters.unit.symbol)"
            case "Meters" :
                let meters = feet.converted(to: UnitLength.meters)
                outputLabel.text = " = \(String(format : "%.3f",meters.value)) \(meters.unit.symbol)"
            case "Kilometers" :
                let kilometers = feet.converted(to: UnitLength.kilometers)
                outputLabel.text = " = \(String(format : "%.6f",kilometers.value)) \(kilometers.unit.symbol)"
            default:
                print("")
        }
        
    }
    
    // function to convert from yard to other units
    func yardToOthersConverter(){
        
        let yard = Measurement(value: inputValue!, unit: UnitLength.yards)
        
        switch  endUnit {
            case "Inches":
                let inches = yard.converted(to: UnitLength.inches)
                outputLabel.text = " = \(String(format : "%.3f",inches.value)) \(inches.unit.symbol)"
            case "Feet":
                let feet = yard.converted(to: UnitLength.feet)
                outputLabel.text = " = \(String(format : "%.3f",feet.value)) \(feet.unit.symbol)"
            case "Miles":
                let miles = yard.converted(to: UnitLength.miles)
                outputLabel.text = " = \(String(format : "%.6f",miles.value)) \(miles.unit.symbol)"
            case "Millimeters" :
                let millimeters = yard.converted(to: UnitLength.millimeters)
                outputLabel.text = " = \(String(format : "%.3f",millimeters.value)) \(millimeters.unit.symbol)"
            case "Centimeters" :
                let centimeters = yard.converted(to: UnitLength.centimeters)
                outputLabel.text = " = \(String(format : "%.3f",centimeters.value)) \(centimeters.unit.symbol)"
            case "Meters" :
                let meters = yard.converted(to: UnitLength.meters)
                outputLabel.text = " = \(String(format : "%.3f",meters.value)) \(meters.unit.symbol)"
            case "Kilometers" :
                let kilometers = yard.converted(to: UnitLength.kilometers)
                outputLabel.text = " = \(String(format : "%.3f",kilometers.value)) \(kilometers.unit.symbol)"
            default:
                print("")
        }
    }
    
    // function to convert from miles to other units
    func milesToOthersConverter(){
        
        let miles = Measurement(value: inputValue!, unit: UnitLength.miles)
        
        switch  endUnit {
            case "Inches":
                let inches = miles.converted(to: UnitLength.inches)
                outputLabel.text = " = \(String(format : "%.3f",inches.value)) \(inches.unit.symbol)"
            case "Feet":
                let feet = miles.converted(to: UnitLength.feet)
                outputLabel.text = " = \(String(format : "%.3f",feet.value)) \(feet.unit.symbol)"
            case "Yard":
                let yard = miles.converted(to: UnitLength.yards)
                outputLabel.text = " = \(String(format : "%.3f",yard.value)) \(yard.unit.symbol)"
            case "Millimeters" :
                let millimeters = miles.converted(to: UnitLength.millimeters)
                outputLabel.text = " = \(String(format : "%.3f",millimeters.value)) \(millimeters.unit.symbol)"
            case "Centimeters" :
                let centimeters = miles.converted(to: UnitLength.centimeters)
                outputLabel.text = " = \(String(format : "%.3f",centimeters.value)) \(centimeters.unit.symbol)"
            case "Meters" :
                let meters = miles.converted(to: UnitLength.meters)
                outputLabel.text = " = \(String(format : "%.3f",meters.value)) \(meters.unit.symbol)"
            case "Kilometers":
                let kilometers = miles.converted(to: UnitLength.kilometers)
                outputLabel.text = " = \(String(format : "%.3f",kilometers.value)) \(kilometers.unit.symbol)"
            default:
                print("")
        }
        
    }
    
    // function to convert from millimeters to other units
    func millimetersToOthersConverter(){
        
        let millimeters = Measurement(value: inputValue!, unit: UnitLength.millimeters)
        
        switch  endUnit {
            case "Inches":
                let inches = millimeters.converted(to: UnitLength.inches)
                outputLabel.text = " = \(String(format : "%.3f",inches.value)) \(inches.unit.symbol)"
            case "Feet":
                let feet = millimeters.converted(to: UnitLength.feet)
                outputLabel.text = " = \(String(format : "%.3f",feet.value)) \(feet.unit.symbol)"
            case "Yard":
                let yard = millimeters.converted(to: UnitLength.yards)
                outputLabel.text = " = \(String(format : "%.3f",yard.value)) \(yard.unit.symbol)"
            case "Miles" :
                let miles = millimeters.converted(to: UnitLength.miles)
                outputLabel.text = " = \(String(format : "%.8f",miles.value)) \(miles.unit.symbol)"
            case "Centimeters" :
                let centimeters = millimeters.converted(to: UnitLength.centimeters)
                outputLabel.text = " = \(String(format : "%.3f",centimeters.value)) \(centimeters.unit.symbol)"
            case "Meters" :
                let meters = millimeters.converted(to: UnitLength.meters)
                outputLabel.text = " = \(String(format : "%.3f",meters.value)) \(meters.unit.symbol)"
            case "Kilometers":
                let kilometers = millimeters.converted(to: UnitLength.kilometers)
                outputLabel.text = " = \(String(format : "%.8f",kilometers.value)) \(kilometers.unit.symbol)"
            default:
                print("")
        }
    }
    
    // function to convert from centimeters to other units
    func centimetersToOthersConverter(){
        
        let centimeters = Measurement(value: inputValue!, unit: UnitLength.centimeters)
        
        switch  endUnit {
            case "Inches":
                let inches = centimeters.converted(to: UnitLength.inches)
                outputLabel.text = " = \(String(format : "%.3f",inches.value)) \(inches.unit.symbol)"
            case "Feet":
                let feet = centimeters.converted(to: UnitLength.feet)
                outputLabel.text = " = \(String(format : "%.3f",feet.value)) \(feet.unit.symbol)"
            case "Yard":
                let yard = centimeters.converted(to: UnitLength.yards)
                outputLabel.text = " = \(String(format : "%.3f",yard.value)) \(yard.unit.symbol)"
            case "Miles" :
                let miles = centimeters.converted(to: UnitLength.miles)
                outputLabel.text = " = \(String(format : "%.8f",miles.value)) \(miles.unit.symbol)"
            case "Millimeters" :
                let millimeters = centimeters.converted(to: UnitLength.millimeters)
                outputLabel.text = " = \(String(format : "%.3f",millimeters.value)) \(millimeters.unit.symbol)"
            case "Meters" :
                let meters = centimeters.converted(to: UnitLength.meters)
                outputLabel.text = " = \(String(format : "%.3f",meters.value)) \(meters.unit.symbol)"
            case "Kilometers" :
                let kilometers = centimeters.converted(to: UnitLength.kilometers)
                outputLabel.text = " = \(String(format : "%.8f",kilometers.value)) \(kilometers.unit.symbol)"
            default:
                print("")
        }
    }
    
    // function to convert from meters to other units
    func metersToOthersConverter(){
        
        let meters = Measurement(value: inputValue!, unit: UnitLength.meters)
        
        switch  endUnit {
            case "Inches":
                let inches = meters.converted(to: UnitLength.inches)
                outputLabel.text = " = \(String(format : "%.3f",inches.value)) \(inches.unit.symbol)"
            case "Feet":
                let feet = meters.converted(to: UnitLength.feet)
                outputLabel.text = " = \(String(format : "%.3f",feet.value)) \(feet.unit.symbol)"
            case "Yard":
                let yard = meters.converted(to: UnitLength.yards)
                outputLabel.text = " = \(String(format : "%.3f",yard.value)) \(yard.unit.symbol)"
            case "Miles" :
                let miles = meters.converted(to: UnitLength.miles)
                outputLabel.text = " = \(String(format : "%.8f",miles.value)) \(miles.unit.symbol)"
            case "Millimeters" :
                let millimeters = meters.converted(to: UnitLength.millimeters)
                outputLabel.text = " = \(String(format : "%.3f",millimeters.value)) \(millimeters.unit.symbol)"
            case "Centimeters" :
                let centimeters = meters.converted(to: UnitLength.centimeters)
                outputLabel.text = " = \(String(format : "%.3f",centimeters.value)) \(centimeters.unit.symbol)"
            case "Kilometers" :
                let kilometers = meters.converted(to: UnitLength.kilometers)
                outputLabel.text = " = \(String(format : "%.8f",kilometers.value)) \(kilometers.unit.symbol)"
            default:
                print("")
        }
    }
    
    // function to convert from kilometers to other units
    func kilometersToOthersConverter(){
        
        let kilometers = Measurement(value: inputValue!, unit: UnitLength.kilometers)
        
        switch  endUnit {
            case "Inches":
                let inches = kilometers.converted(to: UnitLength.inches)
                outputLabel.text = " = \(String(format : "%.3f",inches.value)) \(inches.unit.symbol)"
            case "Feet":
                let feet = kilometers.converted(to: UnitLength.feet)
                outputLabel.text = " = \(String(format : "%.3f",feet.value)) \(feet.unit.symbol)"
            case "Yard":
                let yard = kilometers.converted(to: UnitLength.yards)
                outputLabel.text = " = \(String(format : "%.3f",yard.value)) \(yard.unit.symbol)"
            case "Miles" :
                let miles = kilometers.converted(to: UnitLength.miles)
                outputLabel.text = " = \(String(format : "%.3f",miles.value)) \(miles.unit.symbol)"
            case "Millimeters" :
                let millimeters = kilometers.converted(to: UnitLength.millimeters)
                outputLabel.text = " = \(String(format : "%.3f",millimeters.value)) \(millimeters.unit.symbol)"
            case "Centimeters" :
                let centimeters = kilometers.converted(to: UnitLength.centimeters)
                outputLabel.text = " = \(String(format : "%.3f",centimeters.value)) \(centimeters.unit.symbol)"
            case "Meters" :
                let meters = kilometers.converted(to: UnitLength.meters)
                outputLabel.text = " = \(String(format : "%.3f",meters.value)) \(meters.unit.symbol)"
            default:
                print("")
        }
    }
}
