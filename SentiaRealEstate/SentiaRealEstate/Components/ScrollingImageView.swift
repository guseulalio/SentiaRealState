//
//  ScrollingImageView.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 25/4/21.
//

import SwiftUI

/// A scrollable list of images.
struct ScrollingImageView
: View
{
	@Environment(\.formFactor) var formFactor: FormFactor
	var imageList: [PropertyImage]
	
    var body: some View {
		if formFactor == FormFactor.flat {
			ScrollView(Axis.Set.vertical) {
				VStack { imageGroup }
			}
			.clipShape(RoundedRectangle(cornerRadius: 20))
			.gradientBorder()
		} else {
			ScrollView(Axis.Set.horizontal) {
				HStack { imageGroup }
			}
			.clipShape(RoundedRectangle(cornerRadius: 20))
			.gradientBorder()
		}
    }
	
	var imageGroup: some View {
		Group {
			ForEach(imageList)
			{ propertyImage in
				RemoteImage(url: propertyImage.attachment.thumb.url, side: 200)
				.padding(5)
			}
		}
	}
}
