//
//  NetworkManager.swift
//  ServianWeather
//
//  Created by Gustavo E M Cabral on 24/2/21.
//

import UIKit

enum ErrorWithMessage: Error
{ case error(String) }


class NetworkManager
{
	static let shared = NetworkManager()
	private var baseURL = "https://f213b61d-6411-4018-a178-53863ed9f8ec.mock.pstmn.io/properties"
	
	private init() {}
	
	/// Provides a different `NetworkManager` that uses an alternate URL.
	/// This was added for testing purposes.
	///
	/// - Parameter url: Alternate URL
	/// - Returns: A new `NetworkManager`.
	static func alternative(with url: String) -> NetworkManager
	{
		let nm = NetworkManager()
		nm.baseURL = url
		return nm
	}
	
	func fetch(onCompletion sendBack: @escaping (Result<AllProperties, ErrorWithMessage>) -> Void)
	{
		var propertyList: AllProperties
		
		if let url = URL(string: baseURL)
		{
			if let data = try? Data(contentsOf: url)
			{
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				decoder.dateDecodingStrategy = .iso8601
				do {
					propertyList = try decoder.decode(AllProperties.self, from: data)
					sendBack(.success(propertyList))
					return
				} catch {
					print("Error decoding data: \(error.localizedDescription)")
					sendBack(.failure(.error("Error decoding data: \(error.localizedDescription)")))
				}
			} else {
				print("Unable to fetch data.")
				sendBack(.failure(.error("Unable to fetch data.")))
			}
		} else {
			print("Error generating URL from string.")
			sendBack(.failure(.error("Error generating URL from string.")))
		}
	}
}
