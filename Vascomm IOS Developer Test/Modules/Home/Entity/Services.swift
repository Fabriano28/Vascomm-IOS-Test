//
//  Services.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import Foundation

struct Service {
    let serviceName: String
    let serviceImage: String
    let servicePrice: Int
    let serviceLocationName: String
    let serviceLocationAddress: String
}

struct ServicesMockData {
    static let services: [Service] = [
        Service(serviceName: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja", serviceImage: "service", servicePrice: 1400000, serviceLocationName: "Lenmarc Surabaya", serviceLocationAddress: "Dukuh Pakis, Surabaya"),
        Service(serviceName: "Service 2", serviceImage: "service", servicePrice: 1400000, serviceLocationName: "Lenmarc Surabaya", serviceLocationAddress: "Dukuh Pakis, Surabaya"),
        Service(serviceName: "Service 3", serviceImage: "service", servicePrice: 1400000, serviceLocationName: "Lenmarc Surabaya", serviceLocationAddress: "Dukuh Pakis, Surabaya"),
    ]
}

enum ServicesError: Error {
    case invalidResponse
    case invalidData
    case unknownError
}
