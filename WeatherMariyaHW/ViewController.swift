//
//  ViewController.swift
//  WeatherMariyaHW
//
//  Created by Мария  on 22.11.22.
//

import UIKit

class ViewController: UIViewController {
   
    var weather = [Weather]()
//    let group = DispatchGroup()

    @IBOutlet weak var backgraundImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    lazy var session :  URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    
        loadData()
     

       
        
    }
    
    func loadData(){
//        group.enter()
        let urlString  = "https://api.open-meteo.com/v1/dwd-icon?latitude=53.90&longitude=27.57&hourly=temperature_2m&current_weather=true&timezone=auto&start_date=2022-11-21&end_date=2022-11-22"
        guard let url = URL(string: urlString) else {return}
        var urlRequest =  URLRequest(url: url,cachePolicy: .reloadRevalidatingCacheData,timeoutInterval: 120)
        urlRequest.httpMethod = "GET"
        session.dataTask(with: urlRequest) { data, response, error in
            guard let data =  data else {print(error!);return}
            if let weather1 = self.parceJson(withData: data) {
//                print(weather1)
                DispatchQueue.main.async {
                    self.weather = Array(arrayLiteral: weather1)
//                    print(self.weather)
                    for weather in self.weather {
                        self.cityLabel.text = weather.timezone
                        self.maxTemp.text = String(weather.temperatureMax)
                        self.minTemp.text = String(weather.temperatureMin)
                        self.temperatureLabel.text = String(weather.temperature)
                        self.windSpeed.text = String(weather.windspeed)
                        self.celsiusLabel.text = weather.temperature2MUnit
                    }
                }
            }
        }.resume()
//        group.leave()
//        group.notify(queue: DispatchQueue.main) {
//            for weather in self.weather {
//                self.cityLabel.text = weather.timezone
//                self.maxTemp.text = String(weather.temperatureMax)
//                self.minTemp.text = String(weather.temperatureMin)
//                self.temperatureLabel.text = String(weather.temperature)
//                self.windSpeed.text = String(weather.windspeed)
//                self.celsiusLabel.text = weather.temperature2MUnit
//            }
//        }
 }
    func parceJson(withData data: Data)->Weather?{
        do {
            let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherDate: weatherData) else {
                return nil
            }
            return weather
           
        } catch {
            print(error)
        }
       return nil
    }
}

