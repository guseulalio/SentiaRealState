//
//  ContentViewModel.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 25/4/21.
//

import Foundation

// The VM in MVVM
extension ContentView
{
	class ViewModel
	: ObservableObject
	{
		@Published var properties: [Property]
		
		init()
		{
			var propertyList = [Property]()
			NetworkManager.shared.fetch
			{ (result) in
				switch result
				{
					case .success(let allProperties): propertyList = allProperties.data
					case .failure(let error): print("Error: \(error.localizedDescription)")
				}
			}
			self.properties = propertyList
		}
	}
}
