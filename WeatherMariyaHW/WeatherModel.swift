//
//  WeatherModel.swift
//  WeatherMariyaHW
//
//  Created by Мария  on 22.11.22.
//

import Foundation
struct WeatherData: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currentWeather: CurrentWeather
    let hourlyUnits: HourlyUnits
    let hourly: Hourly

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case timezone
        case currentWeather = "current_weather"
        case hourlyUnits = "hourly_units"
        case hourly
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let temperature, windspeed: Double
    let time: String
}

// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
    }
}

// MARK: - HourlyUnits
struct HourlyUnits: Codable {
    let time, temperature2M: String
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
    }
}
