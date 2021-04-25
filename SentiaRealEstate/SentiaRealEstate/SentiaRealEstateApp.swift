//
//  SentiaRealEstateApp.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 23/4/21.
//

import SwiftUI

@main
struct SentiaRealEstateApp
: App
{
	@State private var formFactor: FormFactor = .other
	
    var body: some Scene {
        WindowGroup {
            ContentView()
			.formFactor(formFactor)
        }
    }
}
