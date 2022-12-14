//
//  ErrorMessage.swift
//  MoviesApp
//
//  Created by Kemal Aslan on 29.12.2022.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidData = "The data recieved from the service was invalid. Please try again."
    case invalidResponse = "Invalid response from the service. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidUrl = "Invalid url."
    case unableToParseJson = "Unable to parse json to model."
    case unknown
}
