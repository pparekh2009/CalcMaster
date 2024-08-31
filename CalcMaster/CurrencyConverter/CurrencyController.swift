//
//  CurrencyController.swift
//  Calculator
//
//  Created by Priyansh Parekh on 8/6/24.
//

import UIKit

class CurrencyController: UIViewController, SelectCountryDelegate {
    
    // MARK: - TODO: - Add Unit Converter and shift this there
    // MARK: - TODO: - Add Refresh Button and last refesh time
    // MARK: - TODO: - Add list of converted currency countries
    
    @IBOutlet weak var countryOneTF: UITextField!
    @IBOutlet weak var countryTwoTF: UITextField!
    
    @IBOutlet weak var countryOneBtn: UIButton!
    @IBOutlet weak var countryTwoBtn: UIButton!
    
    var buttonPressed = 0
    
    var countryOne: Country = Country(name: "United Arab Emirates", code: "AED")
    var countryTwo: Country = Country(name: "Zimbabwe", code: "ZWL")
    
    var countryResponse: CountryResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryOneTF.text = "1"
        
        countryOneBtn.setTitle(countryOne.name, for: .normal)
        countryTwoBtn.setTitle(countryTwo.name, for: .normal)
        
        countryOneTF.addTarget(self, action: #selector(tfEditingBegin(_:)), for: .editingDidBegin)
        countryOneTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        Task {
            await updatePrice()
        }
    }
    
    @objc func tfEditingBegin(_ textField: UITextField) {
        print("editing began")
        
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text
        
        if text == nil {
            return
        }
        
        if text!.isEmpty {
            return
        }
        
        let baseValue: Float = Float(text!) ?? 1
        print("Base Value: \(baseValue)")
        
        let targetValue = countryResponse!.data.mid * baseValue
        print("Target Value: \(targetValue)")
        countryTwoTF.text = "\(targetValue)"
    }
    
    @IBAction func countryOneTapped(_ sender: UIButton) {
        print("Button One Pressed")
        let controller = CountryController()
        controller.delegate = self
        controller.modalPresentationStyle = .fullScreen
        
        buttonPressed = 1
        
        countryOneBtn.endEditing(true)
        
        self.present(UINavigationController(rootViewController: controller), animated: true)
    }
    
    @IBAction func countryTwoTapped(_ sender: UIButton) {
        print("ButtonTwo Pressed")
        
        let controller = CountryController()
        controller.delegate = self
        controller.modalPresentationStyle = .overFullScreen
        
        buttonPressed = 2
        
        countryOneBtn.endEditing(true)
        
        self.present(UINavigationController(rootViewController: controller), animated: true)
    }
    
    @IBAction func swapTapped(_ sender: UIButton) {
        let tempCountry = countryOne
        countryOne = countryTwo
        countryTwo = tempCountry
        
        countryOneBtn.setTitle(countryOne.name, for: .normal)
        countryTwoBtn.setTitle(countryTwo.name, for: .normal)
        
        Task {
            await updatePrice()
        }
        
        
    }
    
    private func getPrice(baseCountry: Country, targetCountry: Country) async throws -> CountryResponse {
//        let endpoint = "https://hexarate.paikama.co/api/rates/latest/USD?target=GBP"
        let endpoint = "https://hexarate.paikama.co/api/rates/latest/\(baseCountry.code)?target=\(targetCountry.code)"
        
        guard let url = URL(string: endpoint) else {
            throw CountryError.InvalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CountryError.InvalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(CountryResponse.self, from: data)
        } catch {
            throw CountryError.InvalidData
        }
    }
    
    @IBAction func unwindToCurrenyController(_ sender: UIStoryboardSegue) {
        
    }
    
    func selectCountry(country: Country) {
        if buttonPressed == 1 {
            countryOne = country
            print(countryOne.name)
            countryOneBtn.setTitle(countryOne.name, for: .normal)
        } else if buttonPressed == 2 {
            countryTwo = country
            print(countryTwo.name)
            countryTwoBtn.setTitle(countryTwo.name, for: .normal)
        } else {
            print("Wrong button pressed")
        }
        
        buttonPressed = 0
        
        Task {
            await updatePrice()
        }
    }

    private func updatePrice() async {
        do {
            countryResponse = try await getPrice(baseCountry: countryOne, targetCountry: countryTwo)
            print("Base: \(countryResponse?.data.base ?? "")")
            print("Target: \(countryResponse?.data.target ?? "")")
            print("Mid: \(countryResponse?.data.mid ?? -1)")
            print("Unit: \(countryResponse?.data.unit ?? -1)")
        } catch CountryError.InvalidUrl {
            print("Invalid Url")
        } catch CountryError.InvalidResponse {
            print("Invalid Response")
        } catch CountryError.InvalidData {
            print("Invalid Data")
        } catch {
            print("I don't know what happened")
        }
    
    }
}

struct CountryResponse : Codable {
    var statusCode: Int
    var data: CountryData
}

struct CountryData: Codable {
    var base: String
    var target: String
    var mid: Float
    var unit: Int
}

enum CountryError: Error {
    case InvalidUrl
    case InvalidResponse
    case InvalidData
}
