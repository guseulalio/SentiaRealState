//
//  UnitTests.swift
//  UnitTests
//
//  Created by Gustavo E M Cabral on 26/4/21.
//

import XCTest
@testable import SentiaRealEstate

class UnitTests
: XCTestCase
{
	/// This test is only as reliable as the data source. It was added here
	/// for the sake of demonstrating my ability to do tests. But if the data
	/// returned changes slightly and becomes different from the model, the
	/// test will fail. Ideally, we'd have a test server to provide reliable
	/// data.
    func testSuccessfullyDownloadingAndDecodingDataFromDefaultURL()
	{
		let networkManager = NetworkManager.shared
		networkManager.fetch
		{ (result) in
			switch result
			{
				case .success(_): XCTAssert(true)
				case .failure(_): XCTAssert(false)
			}
		}
    }
	
	/// Like the previous test, this one is equally reliable.
	func testSettingAlternativeURLWithDefaultURLWorksFine()
	{
		let networkManager = NetworkManager.alternative(with: "https://f213b61d-6411-4018-a178-53863ed9f8ec.mock.pstmn.io/properties")
		networkManager.fetch
		{ (result) in
			switch result
			{
				case .success(_): XCTAssert(true)
				case .failure(_): XCTAssert(false)
			}
		}
	}
	
	func testErrorWhenURLIsIncorrect()
	{
		let networkManager = NetworkManager.alternative(with: "https://www.google.com")
		networkManager.fetch
		{ (result) in
			switch result
			{
				case .success(_): XCTAssert(false)
				case .failure(_): XCTAssert(true)
			}
		}
	}
	
	func testErrorWhenURLIsInvalid()
	{
		let networkManager = NetworkManager.alternative(with: "invalid url")
		networkManager.fetch
		{ (result) in
			switch result
			{
				case .success(_): XCTAssert(false)
				case .failure(_): XCTAssert(true)
			}
		}
	}
}
