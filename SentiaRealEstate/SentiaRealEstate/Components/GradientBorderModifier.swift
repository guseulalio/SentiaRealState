//
//  GradientBorderModifier.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 26/4/21.
//

import SwiftUI

struct GradientBorderModifier
: ViewModifier
{
	func body(content: Content) -> some View
	{
		content
		.overlay(
			LinearGradient(gradient: Gradient(colors: [Color(UIColor.secondarySystemBackground),
													   Color(UIColor.tertiarySystemBackground)]),
						   startPoint: .topLeading,
						   endPoint: .bottomTrailing
			)
			.clipShape(
				RoundedRectangle(cornerRadius: 20)
					.stroke(lineWidth: 10)
			)
		)
	}
}

extension View
{
	func gradientBorder() -> some View
	{
		self.modifier(GradientBorderModifier())
	}
}
