//
//  CountryController.swift
//  Calculator
//
//  Created by Priyansh Parekh on 8/7/24.
//

import UIKit

protocol SelectCountryDelegate {
    func selectCountry(country: Country)
}

class CountryController: UITableViewController {
    
    var delegate: SelectCountryDelegate?
    
    let codes = ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL", "BSD", "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHF", "CLP", "CNY", "COP", "CRC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "FOK", "GBP", "GEL", "GGP", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KID", "KMF", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRU", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLE", "SOS", "SRD", "SSP", "STN", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TVD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VES", "VND", "VUV", "WST", "XAF", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR", "ZMW", "ZWL",
    ]

    
    let countryNames = ["United Arab Emirates", "Afghanistan", "Albania", "Armenia", "Netherlands Antilles", "Angola", "Argentina", "Australia", "Aruba", "Azerbaijan", "Bosnia and Herzegovina", "Barbados", "Bangladesh", "Bulgaria", "Bahrain", "Burundi", "Bermuda", "Brunei", "Bolivia", "Brazil", "Bahamas", "Bhutan", "Botswana", "Belarus", "Belize", "Canada", "Democratic Republic of the Congo", "Switzerland", "Chile", "China", "Colombia", "Costa Rica", "Cuba", "Cape Verde", "Czech Republic", "Djibouti", "Denmark", "Dominican Republic", "Algeria", "Egypt", "Eritrea", "Ethiopia", "European Union", "Fiji", "Falkland Islands", "Faroe Islands", "United Kingdom", "Georgia", "Guernsey", "Ghana", "Gibraltar", "The Gambia", "Guinea", "Guatemala", "Guyana", "Hong Kong", "Honduras", "Croatia", "Haiti", "Hungary", "Indonesia", "Israel", "Isle of Man", "India", "Iraq", "Iran", "Iceland", "Jersey", "Jamaica", "Jordan", "Japan", "Kenya", "Kyrgyzstan", "Cambodia", "Kiribati", "Comoros", "South Korea", "Kuwait", "Cayman Islands", "Kazakhstan", "Laos", "Lebanon", "Sri Lanka", "Liberia", "Lesotho", "Libya", "Morocco", "Moldova", "Madagascar", "North Macedonia", "Myanmar", "Mongolia", "Macau", "Mauritania", "Mauritius", "Maldives", "Malawi", "Mexico", "Malaysia", "Mozambique", "Namibia", "Nigeria", "Nicaragua", "Norway", "Nepal", "New Zealand", "Oman", "Panama", "Peru", "Papua New Guinea", "Philippines", "Pakistan", "Poland", "Paraguay", "Qatar", "Romania", "Serbia", "Russia", "Rwanda", "Saudi Arabia", "Solomon Islands", "Seychelles", "Sudan", "Sweden", "Singapore", "Saint Helena", "Sierra Leone", "Somalia", "Suriname", "South Sudan", "São Tomé and Príncipe", "Syria", "Eswatini", "Thailand", "Tajikistan", "Turkmenistan", "Tunisia", "Tonga", "Turkey", "Trinidad and Tobago", "Tuvalu", "Taiwan", "Tanzania", "Ukraine", "Uganda", "United States", "Uruguay", "Uzbekistan", "Venezuela", "Vietnam", "Vanuatu", "Samoa", "CEMAC", "Organisation of Eastern Caribbean States", "International Monetary Fund", "CFA", "Collectivités d'Outre-Mer", "Yemen", "South Africa", "Zambia", "Zimbabwe"]
    
//    let countries = ["India", "USA", "Sweden", "China"]
    var countries = [Country]()

    @IBOutlet weak var countryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        countryTableView.dataSource = self
//        countryTableView.delegate = self
        
        for i in 0...codes.count - 1 {
            let country = Country(name: countryNames[i], code: codes[i])
            countries.append(country)
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "countryCell")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissModalSheet))
    }
    
    @objc func dismissModalSheet() {
        dismiss(animated: true)
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        cell.textLabel?.text = countries[indexPath.row].name
        cell.textLabel?.font = cell.textLabel?.font.withSize(20)
        
        return cell
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.selectCountry(country: countries[indexPath.row])
        dismiss(animated: true)
        
//        print("\(countries[indexPath.row].name)")
    }
}
