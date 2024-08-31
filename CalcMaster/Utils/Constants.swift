//
//  Constants.swift
//  Calculator
//
//  Created by Priyansh Parekh on 8/15/24.
//

import Foundation

class Constants {
    
    enum Keys: String {
        case Countries = "countries"
    }
    
}

struct Unit {
    var name: String
    var symbol: String
    var value: Double
    
    init(name: String, symbol: String, value: Double) {
        self.name = name
        self.symbol = symbol
        self.value = value
    }
}


let lengthUnits = ["Millimeters (mm)", "Centimeters (cm)", "Meters (m)", "Kilometers (km)", "Inches (in)", "Feet (ft)", "Yards (yd)", "Miles (mi)", "Nautical Miles", "Micrometers (µm)", "Nanometers (nm)", "Light Years"]
enum Length {
    static let millimeter = Unit(name: "Millimeter", symbol: "mm", value: 1000)
    static let centimeter = Unit(name: "Centimeter", symbol: "cm", value: 1000)
    static let meter = Unit(name: "Meter", symbol: "m", value: 1000)
    static let kilometer = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let inch = Unit(name: "Inch", symbol: "in", value: 1000)
    static let foot = Unit(name: "Foot", symbol: "ft", value: 1000)
    static let yard = Unit(name: "Yard", symbol: "yd", value: 1000)
    static let mile = Unit(name: "Mile", symbol: "mi", value: 1000)
    static let nauticalMile = Unit(name: "Nautical Mile", symbol: "", value: 1000)
    static let micrometer = Unit(name: "Micrometer", symbol: "µm", value: 1000)
    static let nanometer = Unit(name: "Nanometer", symbol: "nm", value: 1000)
    static let lightYear = Unit(name: "Light Year", symbol: "", value: 1000)
}

let massUnits = ["Milligrams (mg)", "Grams (g)", "Kilograms (kg)", "Metric Ton (t)", "Ounces (oz)", "Pounds (lb)", "Stones", "Micrograms (µg)", "Carats", "Tons"]
enum Mass {
    static let milligram = Unit(name: "Milligram", symbol: "mg", value: 1000)
    static let gram = Unit(name: "Gram", symbol: "gm", value: 1000)
    static let kilogram = Unit(name: "Kilogram", symbol: "kg", value: 1000)
    static let metricTon = Unit(name: "Metric Ton", symbol: "t", value: 1000)
    static let ounce = Unit(name: "Ounce", symbol: "oz", value: 1000)
    static let pound = Unit(name: "Pound", symbol: "lb", value: 1000)
    static let stone = Unit(name: "Stone", symbol: "", value: 1000)
    static let microgram = Unit(name: "Microgram", symbol: "µg", value: 1000)
    static let carat = Unit(name: "Carat", symbol: "", value: 1000)
    static let ton = Unit(name: "Ton", symbol: "", value: 1000)
}

let volumeUnits = ["Milliliters (mL)", "Centiliters (cL)", "Liters (L)", "Cubic Centimeters (cm³)", "Cubic Meters (m³)", "Teaspoons (tsp)", "Tablespoons (tbsp)", "Fluid Ounces (fl oz)", "Cups", "Pints (pt)", "Quarts (qt)", "Gallons (gal)", "Cubic Inches (in³)", "Cubic Feet (ft³)", "Cubic Yards (yd³)"]
enum Volume {
    static let milliliter = Unit(name: "Milliliter", symbol: "ml", value: 1000)
    static let centiliter = Unit(name: "Centiliter", symbol: "cl", value: 1000)
    static let liter = Unit(name: "Liter", symbol: "l", value: 1000)
    static let cubicCentimeter = Unit(name: "Cubic Centimeter", symbol: "cm³", value: 1000)
    static let cubicMeter = Unit(name: "Cubic Meter", symbol: "m³", value: 1000)
    static let teaspoon = Unit(name: "Teaspoon", symbol: "tsp", value: 1000)
    static let tablespoon = Unit(name: "Tablespoon", symbol: "tbsp", value: 1000)
    static let fiuldOunce = Unit(name: "Fluid Ounce", symbol: "fl. oz", value: 1000)
    static let cup = Unit(name: "Cup", symbol: "", value: 1000)
    static let pint = Unit(name: "Pint", symbol: "pt", value: 1000)
    static let quart = Unit(name: "Quart", symbol: "qt", value: 1000)
    static let gallon = Unit(name: "Gallon", symbol: "gal", value: 1000)
    static let cubicInch = Unit(name: "Cubic Inch", symbol: "in³", value: 1000)
    static let cubicFeet = Unit(name: "Cubic Feet", symbol: "ft³", value: 1000)
    static let cubicYard = Unit(name: "Cubic Yard", symbol: "yd³", value: 1000)
}

let tempUnits = ["Celsius (°C)", "Fahrenheit (°F)", "Kelvin (K)"]
enum Temperature {
    static let celsius = Unit(name: "Celsius", symbol: "°C", value: 1000)
    static let fahrenheit = Unit(name: "Fahrenheit", symbol: "°F", value: 1000)
    static let kelvin = Unit(name: "Kelvin", symbol: "K", value: 1000)
}

let areaUnits = ["Square Millimeters (mm²)", "Square Centimeters (cm²)", "Square Meters (m²)", "Square Kilometers (km²)", "Square Inches (in²)", "Square Feet (ft²)", "Square Yards (yd²)", "Acres", "Hectares"]
enum Area {
    static let squareMillimeter = Unit(name: "Square Millimeter", symbol: "mm²", value: 1000)
    static let squareCentimeter = Unit(name: "Square Centimeter", symbol: "cm²", value: 1000)
    static let squareMeter = Unit(name: "Square Meter", symbol: "m²", value: 1000)
    static let squareKilometer = Unit(name: "Square Kilometer", symbol: "km²", value: 1000)
    static let squareInch = Unit(name: "Square Inch", symbol: "in²", value: 1000)
    static let squareFeet = Unit(name: "Square Feet", symbol: "ft²", value: 1000)
    static let squareYard = Unit(name: "Square Yard", symbol: "yd²", value: 1000)
    static let acre = Unit(name: "Acre", symbol: "", value: 1000)
    static let hectar = Unit(name: "Hecter", symbol: "", value: 1000)
}

let speedUnits = ["Meters per Second (m/s)", "Kilometers per Hour (km/h)", "Miles per Hour (mph)", "Feet per Second (ft/s)", "Knots"]
enum Speed {
    static let metersPerSec = Unit(name: "Meters Per Second", symbol: "m/s", value: 1000)
    static let kilometersPerHour = Unit(name: "Kilometers Per Hour", symbol: "km/h", value: 1000)
    static let milesPerHour = Unit(name: "Miles Per Hour", symbol: "mph", value: 1000)
    static let feetPerSecond = Unit(name: "Feet Per Second", symbol: "ft/s", value: 1000)
    static let knot = Unit(name: "Knots", symbol: "", value: 1000)
}

let timeUnits = ["Seconds (s)", "Minutes (min)", "Hours (h)", "Days", "Weeks", "Months", "Years", "Milliseconds (ms)", "Microseconds (µs)", "Nanoseconds (ns)"]
enum Time {
    static let second = Unit(name: "Seconds", symbol: "sec", value: 1000)
    static let minute = Unit(name: "Minute", symbol: "min", value: 1000)
    static let hour = Unit(name: "Hour", symbol: "hr", value: 1000)
    static let day = Unit(name: "Days", symbol: "", value: 1000)
    static let week = Unit(name: "Weeks", symbol: "", value: 1000)
    static let month = Unit(name: "Months", symbol: "", value: 1000)
    static let year = Unit(name: "Years", symbol: "", value: 1000)
    static let millisecond = Unit(name: "Millisecond", symbol: "ms", value: 1000)
    static let microsecond = Unit(name: "Microsecond", symbol: "µs", value: 1000)
    static let nanosecond = Unit(name: "Nanosecond", symbol: "ns", value: 1000)
}

let pressureUnits = ["Pascals (Pa)", "Kilopascals (kPa)", "Bars", "Millibars (mbar)", "Atmospheres (atm)", "Pounds per Square Inch (psi)", "Torr", "Inches of Mercury (inHg)"]
enum Pressure {
    static let pascal = Unit(name: "Pascal", symbol: "Pa", value: 1000)
    static let kilopascal = Unit(name: "Kilopascal", symbol: "kPa", value: 1000)
    static let bar = Unit(name: "Bars", symbol: "bar", value: 1000)
    static let millibar = Unit(name: "Millibars", symbol: "mbar", value: 1000)
    static let atmosphere = Unit(name: "Atmosphere", symbol: "atm", value: 1000)
    static let poundsPerSqaureInch = Unit(name: "Pounds per Square Inch", symbol: "psi", value: 1000)
    static let torr = Unit(name: "Torr", symbol: "", value: 1000)
    static let inchesOfMercury = Unit(name: "Inches of Mercury", symbol: "inHg", value: 1000)
}

let energyUnits = ["Joules (J)", "Kilojoules (kJ)", "Calories (cal)", "Kilocalories (kcal)", "Watt-Hours (Wh)", "Kilowatt-Hours (kWh)", "British Thermal Units (BTU)", "Electronvolts (eV)"]
enum Energy {
    static let joule = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let kilojoule = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let calories = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let kilocalories = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let wattHour = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let kilowattHour = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let britishThermalUnits = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let electronVolts = Unit(name: "Kilometer", symbol: "km", value: 1000)
}

let powerUnits = ["Watts (W)", "Kilowatts (kW)", "Horsepower (hp)", "BTUs per Hour"]
enum Power {
    static let watt = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let kilowatt = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let horsepower = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let btusPerHour = Unit(name: "Kilometer", symbol: "km", value: 1000)
}

let dataUnits = ["Bits (b)", "Kilobits (Kb)", "Megabits (Mb)", "Gigabits (Gb)", "Terabits (Tb)", "Bytes (B)", "Kilobytes (KB)", "Megabytes (MB)", "Gigabytes (GB)", "Terabytes (TB)", "Petabytes (PB)"]
enum Data {
    static let bit = Unit(name: "Bit", symbol: "b", value: 1)
    static let kilobit = Unit(name: "Bit", symbol: "b", value: 1)
    static let megabit = Unit(name: "Bit", symbol: "b", value: 1)
    static let gigabit = Unit(name: "Bit", symbol: "b", value: 1)
    static let terabit = Unit(name: "Bit", symbol: "b", value: 1)
    static let byte = Unit(name: "Bit", symbol: "b", value: 1)
    static let kilobyte = Unit(name: "Bit", symbol: "b", value: 1)
    static let megabyte = Unit(name: "Bit", symbol: "b", value: 1)
    static let gigabyte = Unit(name: "Bit", symbol: "b", value: 1)
    static let terabyte = Unit(name: "Bit", symbol: "b", value: 1)
    static let petabyte = Unit(name: "Bit", symbol: "b", value: 1)
}

let freqUnits = ["Hertz (Hz)", "Kilohertz (kHz)", "Megahertz (MHz)", "Gigahertz (GHz)"]
enum Frequency {
    static let hertz = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let kilohertz = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let megahertz = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let gigahertz = Unit(name: "Kilometer", symbol: "km", value: 1000)
}

let forceUnits = ["Newtons (N)", "Kilonewtons (kN)", "Pound-Force (lbf)", "Dynes"]
enum Force {
    static let newton = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let kilonewtons = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let poundForce = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let dynes = Unit(name: "Kilometer", symbol: "km", value: 1000)
}

let angleUnits = ["Degrees (°)", "Radians (rad)", "Gradians (gon)", "Minutes of Arc", "Seconds of Arc"]
enum Angle {
    static let degree = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let radian = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let gradian = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let minutesOfArc = Unit(name: "Kilometer", symbol: "km", value: 1000)
    static let secondsOfArc = Unit(name: "Kilometer", symbol: "km", value: 1000)
}

enum Units {
    static let length = Length.self
    static let mass = Mass.self
    static let volume = Volume.self
    static let temperature = Temperature.self
    static let area = Area.self
    static let speed = Speed.self
    static let time = Time.self
    static let pressure = Pressure.self
    static let energy = Energy.self
    static let power = Power.self
    static let data = Data.self
    static let frequency = Frequency.self
    static let force = Force.self
    static let angle = Angle.self
}
