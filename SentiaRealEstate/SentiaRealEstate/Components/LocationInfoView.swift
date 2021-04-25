//
//  LocationInfoView.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 25/4/21.
//

import SwiftUI

/// Shows the address of the property.
struct LocationInfoView
: View
{
	var location: Location
	
    var body: some View {
		VStack(alignment: HorizontalAlignment.leading) {
			Text("Within Network")
				.font(Font.largeTitle)
			
			Text(location.address)
				.font(.headline)
				.foregroundColor(Color(UIColor.tertiaryLabel))
			
			Text("\(location.suburb) \(location.postcode == nil ? "" : ", \(location.suburb)")")
				.font(Font.headline)
				.foregroundColor(Color(UIColor.tertiaryLabel))
		}
    }
}
