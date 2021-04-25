//
//  XView.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 25/4/21.
//

import SwiftUI

extension View {
	/// Applies the given transform if the given condition evaluates to `true`.
	/// - Parameters:
	///   - condition: The condition to evaluate.
	///   - apply: The transform to apply to the source `View`.
	/// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
	@ViewBuilder func `if`<Content: View>(_ condition: Bool, apply transform: (Self) -> Content) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
	
	/// Forces `NavigationView` to show correctly in landscape mode on the iPhone.
	/// - Returns: The correct view.
	func phoneOnlyStackNavigationView() -> some View
	{
		if UIDevice.current.userInterfaceIdiom == .phone
		{
			return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
		} else {
			return AnyView(self)
		}
	}
}
