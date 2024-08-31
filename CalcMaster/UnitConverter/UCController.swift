//
//  UCController.swift
//  Calculator
//
//  Created by Priyansh Parekh on 8/27/24.
//

import UIKit

class UCController: UIViewController {
    
    var sender: String? = nil
    
    let lengthUnits = ["Millimeters (mm)", "Centimeters (cm)", "Meters (m)", "Kilometers (km)", "Inches (in)", "Feet (ft)", "Yards (yd)", "Miles (mi)", "Nautical Miles", "Micrometers (µm)", "Nanometers (nm)", "Light Years"]
    let massUnits = ["Milligrams (mg)", "Grams (g)", "Kilograms (kg)", "Metric Ton (t)", "Ounces (oz)", "Pounds (lb)", "Stones", "Micrograms (µg)", "Carats", "Tons"]
    let volumeUnits = ["Milliliters (mL)", "Centiliters (cL)", "Liters (L)", "Cubic Centimeters (cm³)", "Cubic Meters (m³)", "Teaspoons (tsp)", "Tablespoons (tbsp)", "Fluid Ounces (fl oz)", "Cups", "Pints (pt)", "Quarts (qt)", "Gallons (gal)", "Cubic Inches (in³)", "Cubic Feet (ft³)", "Cubic Yards (yd³)"]
    let tempUnits = ["Celsius (°C)", "Fahrenheit (°F)", "Kelvin (K)"]
    let areaUnits = ["Square Millimeters (mm²)", "Square Centimeters (cm²)", "Square Meters (m²)", "Square Kilometers (km²)", "Square Inches (in²)", "Square Feet (ft²)", "Square Yards (yd²)", "Acres", "Hectares"]
    let speedUnits = ["Meters per Second (m/s)", "Kilometers per Hour (km/h)", "Miles per Hour (mph)", "Feet per Second (ft/s)", "Knots"]
    let timeUnits = ["Seconds (s)", "Minutes (min)", "Hours (h)", "Days", "Weeks", "Months", "Years", "Milliseconds (ms)", "Microseconds (µs)", "Nanoseconds (ns)"]
    let pressureUnits = ["Pascals (Pa)", "Kilopascals (kPa)", "Bars", "Millibars (mbar)", "Atmospheres (atm)", "Pounds per Square Inch (psi)", "Torr", "Inches of Mercury (inHg)"]
    let energyUnits = ["Joules (J)", "Kilojoules (kJ)", "Calories (cal)", "Kilocalories (kcal)", "Watt-Hours (Wh)", "Kilowatt-Hours (kWh)", "British Thermal Units (BTU)", "Electronvolts (eV)"]
    let powerUnits = ["Watts (W)", "Kilowatts (kW)", "Horsepower (hp)", "BTUs per Hour"]
    let fuelUnits = ["Liters per 100 Kilometers (L/100km)", "Miles per Gallon (mpg US)", "Miles per Gallon (mpg UK)", "Kilometers per Liter (km/L)"]
    let dataUnits = ["Bits (b)", "Kilobits (Kb)", "Megabits (Mb)", "Gigabits (Gb)", "Terabits (Tb)", "Bytes (B)", "Kilobytes (KB)", "Megabytes (MB)", "Gigabytes (GB)", "Terabytes (TB)", "Petabytes (PB)"]
    let freqUnits = ["Hertz (Hz)", "Kilohertz (kHz)", "Megahertz (MHz)", "Gigahertz (GHz)"]
    let forceUnits = ["Newtons (N)", "Kilonewtons (kN)", "Pound-Force (lbf)", "Dynes"]
    let angleUnits = ["Degrees (°)", "Radians (rad)", "Gradians (gon)", "Minutes of Arc", "Seconds of Arc"]
    let accelerationUnits = ["Meters per Second Squared (m/s²)", "Feet per Second Squared (ft/s²)", "G-Force (g)"]
    let densityUnits = ["Kilograms per Cubic Meter (kg/m³)", "Grams per Cubic Centimeter (g/cm³)", "Pounds per Cubic Foot (lb/ft³)"]
    let torqueUnits = ["Newton Meters (Nm)", "Foot-Pounds (ft·lbf)", "Inch-Pounds (in·lbf)"]
    let flowRateUnits = ["Liters per Second (L/s)", "Cubic Meters per Hour (m³/h)", "Gallons per Minute (GPM)"]
    
    @IBOutlet weak var unitBtn: UIButton!
    @IBOutlet weak var convertedUnitsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionClosure = { (action: UIAction) in
            print("Hello: \(action.title)")
        }
        
        var menuChildren: [UIMenuElement] = []
        
        var units = lengthUnits
        
        var km = Units.data.bit
 
        if sender == "Length" {
            units = lengthUnits
        } else if sender == "Mass" {
            units = massUnits
        } else if sender == "Volume" {
            units = volumeUnits
        } else if sender == "Temperature" {
            units = tempUnits
        } else if sender == "Area" {
            units = areaUnits
        } else if sender == "Speed" {
            units = speedUnits
        } else if sender == "Time" {
            units = timeUnits
        } else if sender == "Pressure" {
            units = pressureUnits
        } else if sender == "Energy" {
            units = energyUnits
        } else if sender == "Power" {
            units = powerUnits
        } else if sender == "Fuel Consuption" {
            units = fuelUnits
        } else if sender == "Data Storage" {
            units = dataUnits
        } else if sender == "Frequency" {
            units = freqUnits
        } else if sender == "Force" {
            units = forceUnits
        } else if sender == "Angle" {
            units = angleUnits
        } else if sender == "Acceleration" {
            units = accelerationUnits
        } else if sender == "Density" {
            units = densityUnits
        } else if sender == "Torque" {
            units = torqueUnits
        } else if sender == "Flow Rate" {
            units = flowRateUnits
        }
        
        for unit in units {
            menuChildren.append(UIAction(title: unit, handler: actionClosure))
        }
        
        unitBtn.menu = UIMenu(options: .displayInline, children: menuChildren)
        
        unitBtn.showsMenuAsPrimaryAction = true
        unitBtn.changesSelectionAsPrimaryAction = true
    }

}
