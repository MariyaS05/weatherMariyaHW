//
//  Weather.swift
//  WeatherMariyaHW
//
//  Created by Мария  on 22.11.22.
//

import Foundation

struct Weather {
    let timezone: String
    let temperature : Double
    let temperatureMax : Double
    let temperatureMin : Double
    let windspeed : Double
    let temperature2MUnit : String
    
    init?(weatherDate : WeatherData) {
        timezone = weatherDate.timezone
        temperature = weatherDate.currentWeather.temperature
        temperatureMax = weatherDate.hourly.temperature2M.max()!
        temperatureMin = weatherDate.hourly.temperature2M.min()!
        windspeed = weatherDate.currentWeather.windspeed
        temperature2MUnit = weatherDate.hourlyUnits.temperature2M
    }
    
}
