//
//  RoomAndSpacesView.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 25/4/21.
//

import SwiftUI

/// Shows information like the number of bedrooms, bathrooms and car spaces available.
struct RoomAndSpacesView
: View
{
	var property: Property
	
    var body: some View {
		HStack {
			Label("\(property.bedrooms)", image: "bedroom")
			Label("\(property.bathrooms)", image: "bathroom")
			Label("\(property.carspaces)", image: "carspace")
		}
		.padding(2)
    }
}
