//
//  NetworkManager.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 2.04.2024.
//

//
//  NetworkManager.swift
//  UsingClassModel
//
//  Created by ilhan serhan ipek on 30.12.2023.
//

import Foundation

protocol NetworkManagerProtocol {
  func request<T: Codable>(_ endpoint: Endpoint) async throws -> T
}

enum NetworkError : String,Error {
  case unableToCompleteError
  case failedResponse
  case invalidData
  case authError
  case unknown
}

final class NetworkManager: NetworkManagerProtocol {
  static let shared = NetworkManager()
  let mainVM = MainViewModel.shared
  let session = URLSession.shared
  let decoder = JSONDecoder()
  
  private init() {}

  func request<T: Codable>(_ endpoint: Endpoint) async throws -> T {
    let urlRequest = endpoint.request()

    let (data,response) = try await session.data(for: urlRequest)

    guard let httpResponse = response as? HTTPURLResponse else {
      mainVM.isProgressing = false
      print("DEBUG: Failed from response")
      throw NetworkError.failedResponse
    }
    
    switch httpResponse.statusCode {
    case 200...299:
      do {
        let result = try self.decoder.decode(T.self, from: data)
        return result
      }catch {
        print("DEBUG: Failed to decode")
        throw NetworkError.unableToCompleteError
      }
    case 401:
      print("DEBUG: Auth error")
      throw NetworkError.authError

    default:
      print("DEBUG: Unknown")
      throw NetworkError.unknown
    }
  }
}

class DataNetworkManager {

  static let shared = DataNetworkManager()
  let mainVM = MainViewModel.shared
  let session = URLSession.shared
  let decoder = JSONDecoder()

  func request<T: Codable>(_ endpoint: Endpoint) async throws -> T {
    let urlRequest = endpoint.request()
    let (data, response) = try await session.data(for: urlRequest)

    guard let httpResponse = response as? HTTPURLResponse else {
      mainVM.isProgressing = false
      print("DEBUG: Failed from response")
      throw NetworkError.failedResponse
    }

    switch httpResponse.statusCode {
    case 200...299:
      do {
        let datas = try decoder.decode(T.self, from: data)
        print(datas)
        return datas
      } catch {
        print("DEBUG: Failed to decode")
        throw NetworkError.unableToCompleteError
      }
    case 401:
      print("DEBUG: Auth error")
      throw NetworkError.authError

    default:
      print("DEBUG: \(httpResponse.statusCode)")
      throw NetworkError.unknown
    }
  }
}

