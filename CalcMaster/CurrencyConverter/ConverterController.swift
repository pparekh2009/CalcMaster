//
//  ConverterController.swift
//  Calculator
//
//  Created by Priyansh Parekh on 8/11/24.
//

import UIKit

class ConverterController: UIViewController, UITableViewDelegate, UITableViewDataSource, SelectCountryDelegate {
    
    var countries = [Country]()
    
    var baseCountry = Country(name: "India", code: "INR")
    
    @IBOutlet weak var baseCountryBtn: UIButton!
    @IBOutlet weak var baseCountryPriceTF: UITextField!
    @IBOutlet weak var convertedCurrencyTableView: UITableView!
    
    var addBtnPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseCountryBtn.setTitle(baseCountry.name, for: .normal)
        
        let countryArray = getCountries()
        print(countryArray)
        for country in countryArray {
            countries.append(country)
        }
        
        convertedCurrencyTableView.delegate = self
        convertedCurrencyTableView.dataSource = self
        
        convertedCurrencyTableView.register(CountryPriceCell.nib(), forCellReuseIdentifier: CountryPriceCell.identifier)
        
        baseCountryPriceTF.addTarget(self, action: #selector(reloadTable), for: .editingChanged)
        
    }
    
    @objc func reloadTable() {
        convertedCurrencyTableView.reloadData()
    }
    
    // MARK: - Button tap listener
    
    @IBAction func baseCurrencyCountryBtnTapped(_ sender: UIButton) {
        addBtnPressed = false
        
        let controller = CountryController()
        controller.delegate = self
        controller.modalPresentationStyle = .fullScreen
        
        self.present(UINavigationController(rootViewController: controller), animated: true)
    }
    
    @IBAction func addBtnTapped(_ sender: UIButton) {  
        addBtnPressed = true
        
        let controller = CountryController()
        controller.delegate = self
        controller.modalPresentationStyle = .fullScreen
        
        self.present(UINavigationController(rootViewController: controller), animated: true)
    }
    
    
    // MARK: - Table view functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryPriceCell.identifier, for: indexPath) as! CountryPriceCell
        
        let country = countries[indexPath.row]
        
        let basePrice = Float(getPrice(key: country.name))!
        let tfPrice = Float(baseCountryPriceTF.text!) ?? 1
        let convertedPrice = String(basePrice * tfPrice)
        cell.configure(name: country.name, code: country.code, price: convertedPrice)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            _, _, completionHandler in
            
            let index = indexPath.row
            print("Index: \(index)")
            self.removeCountry(country: self.countries[index])
            self.countries.remove(at: index)
            tableView.reloadData()
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    
    // MARK: - User Default functions
    
    func setPrice(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getPrice(key: String) -> String {
        return UserDefaults.standard.string(forKey: key)!
    }
    
    func addCountries(value: Country) {
        var countryArray = UserDefaults.standard.stringArray(forKey: Constants.Keys.Countries.rawValue)
        
        if countryArray == nil {
            countryArray = [String]()
        }
        
        countryArray!.append(value.toString())
        UserDefaults.standard.set(countryArray, forKey: Constants.Keys.Countries.rawValue)
    }
    
    func getCountries() -> [Country] {
        let stringArray = UserDefaults.standard.stringArray(forKey: Constants.Keys.Countries.rawValue)
        print("string array: \(stringArray)")
        
        var countryArray = [Country]()
        if stringArray != nil {
            for string in stringArray! {
                countryArray.append(string.toCountry())
            }
        }
        return countryArray
    }
    
    func removeCountry(country: Country) {
        var countryArray = UserDefaults.standard.stringArray(forKey: Constants.Keys.Countries.rawValue)
//        if let index = countryArray.firstIndex(of: country) {
//            countryArray.remove(at: index)
//        }
        countryArray = countryArray?.filter { ($0.toCountry()).name != country.name }
        UserDefaults.standard.set(countryArray, forKey: Constants.Keys.Countries.rawValue)
    }
    
    
    // MARK: - API Functions
    
    func getPriceFromAPI(targetCountry: Country) async throws -> CountryResponse {
        let endpoint = "https://hexarate.paikama.co/api/rates/latest/\(baseCountry.code)?target=\(targetCountry.code)"
        print("Endpoint: \(endpoint)")
        
        guard let url = URL(string: endpoint) else {
            throw APIError.InvaildURL
        }
    
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.InvaildResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(CountryResponse.self, from: data)
        } catch {
            throw APIError.InvaildData
        }
    }
    
    
    // MARK: - Other functions
    
    func selectCountry(country: Country) {
        if addBtnPressed {
            // Country Added
            
            Task {
                do {
                    let countryResponse = try await getPriceFromAPI(targetCountry: country)
                    setPrice(key: country.name, value: String(countryResponse.data.mid))
                    
                    countries.append(country)
                    convertedCurrencyTableView.reloadData()
                    
                    addCountries(value: country)
                } catch APIError.InvaildURL {
                    print("Invalid URL")
                } catch APIError.InvaildResponse {
                    print("Invalid Response")
                } catch APIError.InvaildData {
                    print("Invalid Data")
                } catch {
                    print("Other Error")
                }
            }
        } else  {
            // Base Country Changed
            
            baseCountry = country
            baseCountryBtn.setTitle(country.name, for: .normal)
            
            for country in countries {
                Task {
                    do {
                        let countryResponse = try await getPriceFromAPI(targetCountry: country)
                        setPrice(key: country.name, value: String(countryResponse.data.mid))
                        
                        reloadTable()
                    } catch APIError.InvaildURL {
                        print("Invalid URL")
                    } catch APIError.InvaildResponse {
                        print("Invalid Response")
                    } catch APIError.InvaildData {
                        print("Invalid Data")
                    } catch {
                        print("Other Error")
                    }
                }
            }
        }
        print(country.name)
    }
}

// MARK: - Error Enum
enum APIError: Error {
    case InvaildURL
    case InvaildResponse
    case InvaildData
}


//struct CountryResponse : Codable {
//    var statusCode: Int
//    var data: CountryData
//}
//
//struct CountryData: Codable {
//    var base: String
//    var target: String
//    var mid: Float
//    var unit: Int
//}
extension String {
    func toCountry() -> Country {
        let countryStr = self.components(separatedBy: ";")
        return Country(name: countryStr[0], code: countryStr[1])
    }
}
