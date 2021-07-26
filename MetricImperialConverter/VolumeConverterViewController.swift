//
//  VolumeConverterViewController.swift
//  MetricImperialConverter
//
//  Project #2 : Build a Metric to Imperial Converter
//

import UIKit

class VolumeConverterViewController: UIViewController { // ViewController for Volume Conversions
    
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
        
        if sunit == eunit { // when starting and ending units are same
            outputLabel.text = " = \(inputValue!) \(endUnit!)"
        }else if sunit == "Teaspoon"{
            teaspoonToOthersConverter() // Calling function to convert from imperial teaspoon to other units
        }else if sunit == "Tablespoon"{
            tablespoonToOthersConverter() // Calling function to convert from imperial tablespoon to other units
        }else if sunit == "Cups"{
            cupsToOthersConverter() // Calling function to convert from US Legal cups to other units
        }else if sunit == "Quarts"{
            quartsToOthersConverter() // Calling function to convert from imperial quarts to other units
        }else if sunit == "Gallons"{
            gallonsToOthersConverter() // Calling function to convert from imperial gallons to other units
        }else if sunit == "Milliliters"{
            millilitersToOthersConverter() // Calling function to convert from metric milliliters to other units
        }else if sunit == "Deciliters"{
            decilitersToOthersConverter() // Calling function to convert from metric deciliters to other units
        }else if sunit == "Liters"{
            litersToOthersConverter() // Calling function to convert from metric liters to other units
        }
        
    }
    
    // Function to convert from Imperial teaspoon to other units
    func teaspoonToOthersConverter(){
        
        let teaspoon = Measurement(value: inputValue!, unit: UnitVolume.imperialTeaspoons)
        
        switch  endUnit {
            case "Tablespoon":
                let tablespoon = teaspoon.converted(to: UnitVolume.imperialTablespoons)
                outputLabel.text = " = \(String(format : "%.3f",tablespoon.value)) \(tablespoon.unit.symbol)"
            case "Cups": // US Legal cup unit
                let cups = teaspoon.converted(to: UnitVolume.cups) //US Legal Cup
                outputLabel.text = " = \(String(format : "%.6f",cups.value)) \(cups.unit.symbol)"
            case "Quarts":
                let quarts = teaspoon.converted(to: UnitVolume.imperialQuarts)
                outputLabel.text = " = \(String(format : "%.6f",quarts.value)) \(quarts.unit.symbol)"
            case "Gallons" :
                let gallons = teaspoon.converted(to: UnitVolume.imperialGallons)
                outputLabel.text = " = \(String(format : "%.6f",gallons.value)) \(gallons.unit.symbol)"
            case "Milliliters" :
                let milliliters = teaspoon.converted(to: UnitVolume.milliliters)
                outputLabel.text = " = \(String(format : "%.3f",milliliters.value)) \(milliliters.unit.symbol)"
            case "Deciliters" :
                let deciliters = teaspoon.converted(to: UnitVolume.deciliters)
                outputLabel.text = " = \(String(format : "%.6f",deciliters.value)) \(deciliters.unit.symbol)"
            case "Liters" :
                let liters = teaspoon.converted(to: UnitVolume.liters)
                outputLabel.text = " = \(String(format : "%.6f",liters.value)) \(liters.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function to convert from Imperial tablespoon to other units
    func tablespoonToOthersConverter(){
        
        let tablespoon = Measurement(value: inputValue!, unit: UnitVolume.imperialTablespoons)
        
        switch  endUnit {
            case "Teaspoon":
                let teaspoon = tablespoon.converted(to: UnitVolume.imperialTeaspoons)
                outputLabel.text = " = \(String(format : "%.3f",teaspoon.value)) \(teaspoon.unit.symbol)"
            case "Cups":
                let cups = tablespoon.converted(to: UnitVolume.cups)
                outputLabel.text = " = \(String(format : "%.6f",cups.value)) \(cups.unit.symbol)"
            case "Quarts":
                let quarts = tablespoon.converted(to: UnitVolume.imperialQuarts)
                outputLabel.text = " = \(String(format : "%.6f",quarts.value)) \(quarts.unit.symbol)"
            case "Gallons" :
                let gallons = tablespoon.converted(to: UnitVolume.imperialGallons)
                outputLabel.text = " = \(String(format : "%.6f",gallons.value)) \(gallons.unit.symbol)"
            case "Milliliters" :
                let milliliters = tablespoon.converted(to: UnitVolume.milliliters)
                outputLabel.text = " = \(String(format : "%.3f",milliliters.value)) \(milliliters.unit.symbol)"
            case "Deciliters" :
                let deciliters = tablespoon.converted(to: UnitVolume.deciliters)
                outputLabel.text = " = \(String(format : "%.3f",deciliters.value)) \(deciliters.unit.symbol)"
            case "Liters" :
                let liters = tablespoon.converted(to: UnitVolume.liters)
                outputLabel.text = " = \(String(format : "%.6f",liters.value)) \(liters.unit.symbol)"
            default:
                print("")
        }
        
    }
    
    // Function to convert from US Legal cups to other units
    func cupsToOthersConverter(){
        
        let cups = Measurement(value: inputValue!, unit: UnitVolume.cups)
        
        switch  endUnit {
            case "Teaspoon":
                let teaspoon = cups.converted(to: UnitVolume.imperialTeaspoons)
                outputLabel.text = " = \(String(format : "%.3f",teaspoon.value)) \(teaspoon.unit.symbol)"
            case "Tablespoon":
                let tablespoon = cups.converted(to: UnitVolume.imperialTablespoons)
                    outputLabel.text = " = \(String(format : "%.3f",tablespoon.value)) \(tablespoon.unit.symbol)"
            case "Quarts":
                let quarts = cups.converted(to: UnitVolume.imperialQuarts)
                outputLabel.text = " = \(String(format : "%.6f",quarts.value)) \(quarts.unit.symbol)"
            case "Gallons" :
                let gallons = cups.converted(to: UnitVolume.imperialGallons)
                outputLabel.text = " = \(String(format : "%.6f",gallons.value)) \(gallons.unit.symbol)"
            case "Milliliters" :
                let milliliters = cups.converted(to: UnitVolume.milliliters)
                outputLabel.text = " = \(String(format : "%.3f",milliliters.value)) \(milliliters.unit.symbol)"
            case "Deciliters" :
                let deciliters = cups.converted(to: UnitVolume.deciliters)
                outputLabel.text = " = \(String(format : "%.3f",deciliters.value)) \(deciliters.unit.symbol)"
            case "Liters" :
                let liters = cups.converted(to: UnitVolume.liters)
                outputLabel.text = " = \(String(format : "%.3f",liters.value)) \(liters.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function to convert from Imperial quarts to other units
    func quartsToOthersConverter(){
        
        let quarts = Measurement(value: inputValue!, unit: UnitVolume.imperialQuarts)
        
        switch  endUnit {
            case "Teaspoon":
                let teaspoon = quarts.converted(to: UnitVolume.imperialTeaspoons)
                outputLabel.text = " = \(String(format : "%.3f",teaspoon.value)) \(teaspoon.unit.symbol)"
            case "Tablespoon":
                let tablespoon = quarts.converted(to: UnitVolume.imperialTablespoons)
                outputLabel.text = " = \(String(format : "%.3f",tablespoon.value)) \(tablespoon.unit.symbol)"
            case "Cups":
                let cups = quarts.converted(to: UnitVolume.cups)
                outputLabel.text = " = \(String(format : "%.3f",cups.value)) \(cups.unit.symbol)"
            case "Gallons" :
                let gallons = quarts.converted(to: UnitVolume.imperialGallons)
                outputLabel.text = " = \(String(format : "%.3f",gallons.value)) \(gallons.unit.symbol)"
            case "Milliliters" :
                let milliliters = quarts.converted(to: UnitVolume.milliliters)
                outputLabel.text = " = \(String(format : "%.3f",milliliters.value)) \(milliliters.unit.symbol)"
            case "Deciliters" :
                let deciliters = quarts.converted(to: UnitVolume.deciliters)
                outputLabel.text = " = \(String(format : "%.3f",deciliters.value)) \(deciliters.unit.symbol)"
            case "Liters":
                let liters = quarts.converted(to: UnitVolume.liters)
                outputLabel.text = " = \(String(format : "%.3f",liters.value)) \(liters.unit.symbol)"
            default:
                print("")
        }
        
    }
    
    // Function to convert from Imperial Gallons to other units
    func gallonsToOthersConverter(){
        
        let gallons = Measurement(value: inputValue!, unit: UnitVolume.imperialGallons)
        
        switch  endUnit {
            case "Teaspoon":
                let teaspoon = gallons.converted(to: UnitVolume.imperialTeaspoons)
                outputLabel.text = " = \(String(format : "%.3f",teaspoon.value)) \(teaspoon.unit.symbol)"
            case "Tablespoon":
                let tablespoon = gallons.converted(to: UnitVolume.imperialTablespoons)
                outputLabel.text = " = \(String(format : "%.3f",tablespoon.value)) \(tablespoon.unit.symbol)"
            case "Cups":
                let cups = gallons.converted(to: UnitVolume.cups)
                outputLabel.text = " = \(String(format : "%.3f",cups.value)) \(cups.unit.symbol)"
            case "Quarts" :
                let quarts = gallons.converted(to: UnitVolume.imperialQuarts)
                outputLabel.text = " = \(String(format : "%.3f",quarts.value)) \(quarts.unit.symbol)"
            case "Milliliters" :
                let milliliters = gallons.converted(to: UnitVolume.milliliters)
                outputLabel.text = " = \(String(format : "%.3f",milliliters.value)) \(milliliters.unit.symbol)"
            case "Deciliters" :
                let deciliters = gallons.converted(to: UnitVolume.deciliters)
                outputLabel.text = " = \(String(format : "%.3f",deciliters.value)) \(deciliters.unit.symbol)"
            case "Liters":
                let liters = gallons.converted(to: UnitVolume.liters)
                outputLabel.text = " = \(String(format : "%.3f",liters.value)) \(liters.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function to convert from Metric millimeters to other units
    func millilitersToOthersConverter(){
        
        let milliliters = Measurement(value: inputValue!, unit: UnitVolume.milliliters)
        
        switch  endUnit {
            case "Teaspoon":
                let teaspoon = milliliters.converted(to: UnitVolume.imperialTeaspoons)
                outputLabel.text = " = \(String(format : "%.6f",teaspoon.value)) \(teaspoon.unit.symbol)"
            case "Tablespoon":
                let tablespoon = milliliters.converted(to: UnitVolume.imperialTablespoons)
                outputLabel.text = " = \(String(format : "%.6f",tablespoon.value)) \(tablespoon.unit.symbol)"
            case "Cups":
                let cups = milliliters.converted(to: UnitVolume.cups)
                outputLabel.text = " = \(String(format : "%.6f",cups.value)) \(cups.unit.symbol)"
            case "Quarts" :
                let quarts = milliliters.converted(to: UnitVolume.imperialQuarts)
                outputLabel.text = " = \(String(format : "%.8f",quarts.value)) \(quarts.unit.symbol)"
            case "Gallons" :
                let gallons = milliliters.converted(to: UnitVolume.imperialGallons)
                outputLabel.text = " = \(String(format : "%.8f",gallons.value)) \(gallons.unit.symbol)"
            case "Deciliters" :
                let deciliters = milliliters.converted(to: UnitVolume.deciliters)
                outputLabel.text = " = \(String(format : "%.3f",deciliters.value)) \(deciliters.unit.symbol)"
            case "Liters" :
                let liters = milliliters.converted(to: UnitVolume.liters)
                outputLabel.text = " = \(String(format : "%.3f",liters.value)) \(liters.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function to convert from Metric deciliters to other units
    func decilitersToOthersConverter(){
        
        let deciliters = Measurement(value: inputValue!, unit: UnitVolume.deciliters)
        
        switch  endUnit {
            case "Teaspoon":
                let teaspoon = deciliters.converted(to: UnitVolume.imperialTeaspoons)
                outputLabel.text = " = \(String(format : "%.3f",teaspoon.value)) \(teaspoon.unit.symbol)"
            case "Tablespoon":
                let tablespoon = deciliters.converted(to: UnitVolume.imperialTablespoons)
                outputLabel.text = " = \(String(format : "%.3f",tablespoon.value)) \(tablespoon.unit.symbol)"
            case "Cups":
                let cups = deciliters.converted(to: UnitVolume.cups)
                outputLabel.text = " = \(String(format : "%.6f",cups.value)) \(cups.unit.symbol)"
            case "Quarts" :
                let quarts = deciliters.converted(to: UnitVolume.imperialQuarts)
                outputLabel.text = " = \(String(format : "%.8f",quarts.value)) \(quarts.unit.symbol)"
            case "Gallons" :
                let gallons = deciliters.converted(to: UnitVolume.imperialGallons)
                outputLabel.text = " = \(String(format : "%.6f",gallons.value)) \(gallons.unit.symbol)"
            case "Milliliters" :
                let milliliters = deciliters.converted(to: UnitVolume.milliliters)
                outputLabel.text = " = \(String(format : "%.3f",milliliters.value)) \(milliliters.unit.symbol)"
            case "Liters" :
                let liters = deciliters.converted(to: UnitVolume.liters)
                outputLabel.text = " = \(String(format : "%.3f",liters.value)) \(liters.unit.symbol)"
            default:
                print("")
        }
    }
    
    // Function to convert from liters to other units
    func litersToOthersConverter(){
        
        let liters = Measurement(value: inputValue!, unit: UnitVolume.liters)
        
        switch  endUnit {
            case "Teaspoon":
                let teaspoon = liters.converted(to: UnitVolume.imperialTeaspoons)
                outputLabel.text = " = \(String(format : "%.3f",teaspoon.value)) \(teaspoon.unit.symbol)"
            case "Tablespoon":
                let tablespoon = liters.converted(to: UnitVolume.imperialTablespoons)
                outputLabel.text = " = \(String(format : "%.3f",tablespoon.value)) \(tablespoon.unit.symbol)"
            case "Cups":
                let cups = liters.converted(to: UnitVolume.cups)
                outputLabel.text = " = \(String(format : "%.6f",cups.value)) \(cups.unit.symbol)"
            case "Quarts" :
                let quarts = liters.converted(to: UnitVolume.imperialQuarts)
                outputLabel.text = " = \(String(format : "%.8f",quarts.value)) \(quarts.unit.symbol)"
            case "Gallons" :
                let gallons = liters.converted(to: UnitVolume.imperialGallons)
                outputLabel.text = " = \(String(format : "%.6f",gallons.value)) \(gallons.unit.symbol)"
            case "Milliliters" :
                let milliliters = liters.converted(to: UnitVolume.milliliters)
                outputLabel.text = " = \(String(format : "%.3f",milliliters.value)) \(milliliters.unit.symbol)"
            case "Deciliters" :
                let deciliters = liters.converted(to: UnitVolume.deciliters)
                outputLabel.text = " = \(String(format : "%.3f",deciliters.value)) \(deciliters.unit.symbol)"
            default:
                print("")
        }
    }
    
}
