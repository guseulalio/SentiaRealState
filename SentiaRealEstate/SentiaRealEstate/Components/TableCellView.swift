//
//  TableCellView.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 25/4/21.
//

import SwiftUI

/// Is a cell of the table showing the list of properties.
struct TableCellView
: View
{
	@Environment(\.formFactor) var formFactor: FormFactor
	var property: Property
	
    var body: some View {
		if formFactor == FormFactor.flat {
			HStack(alignment: .top) {
				ScrollingImageView(imageList: property.propertyImages)
				.frame(maxHeight: 200)
				
				Spacer()
				
				VStack(alignment: .leading) {
					AvatarView(agent: property.agent)
					.padding(.bottom, 20)
					
					LocationInfoView(location: property.location)
					.padding(.bottom, 20)

					RoomAndSpacesView(property: property)
				}
			}
		} else {
			VStack(alignment: HorizontalAlignment.leading) {
				ScrollingImageView(imageList: property.propertyImages)
				
				HStack {
					LocationInfoView(location: property.location)
					
					Spacer()
					
					AvatarView(agent: property.agent)
				}
				
				RoomAndSpacesView(property: property)
			}
		}
    }
}
