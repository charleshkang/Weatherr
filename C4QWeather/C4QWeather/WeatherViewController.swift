//
//  WeatherViewController
//  C4QWeather
//
//  Created by Charles Kang on 11/21/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var convertTemperatureButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Private Properties
    fileprivate let weatherRequester = WeatherRequester()
    fileprivate var allWeather = [Weather]()
    fileprivate var beenConverted = false
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshWeather()
    }
    
    // MARK: Action Methods
    fileprivate func refreshWeather() {
        weatherRequester.getWeather { weather in
            switch weather {
            case.success(let weatherObjects):
                main {
                    self.allWeather = weatherObjects
                    self.tableView.reloadData()
                }
            case.failure(let error):
                let alertController = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func convertTemperatureAction(_ sender: AnyObject) {
        if !beenConverted {
            beenConverted = true
            convertTemperatureButton.setTitle("Convert to Farenheit", for: UIControlState())
        } else {
            beenConverted = false
            convertTemperatureButton.setTitle("Convert to Celsius", for: UIControlState())
        }
        tableView.reloadData()
    }
}

//MARK: UITableViewDataSource Functions
extension WeatherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allWeather.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.weatherCellIdentifier, for: indexPath) as! WeatherTableViewCell
        let weather = allWeather[indexPath.row]
        if !beenConverted {
            cell.configureFahrenheit(With: weather)
        } else {
            cell.configureCelsius(With: weather)
        }
        return cell
    }
    
}
