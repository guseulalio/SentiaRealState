//
//  FormFactor.swift
//  WindowShape
//
//  Created by Gustavo E M Cabral on 7/3/21.
//

import SwiftUI

/// Roughly represents different form factors of the screen.
enum FormFactor
{
	case tall	// 􀟜, 􀟟 split screen (compact)
	case flat	// 􀴏
	case fat	// 􀟟 (portrait or landscape, full screen)
	case other
}

extension EnvironmentValues
{
	/// Analyses different variables to fit the representation into the FormFactor enum.
	var formFactor: FormFactor
	{
		get {
			let idiom = UIDevice.current.userInterfaceIdiom
			
			switch idiom {
				case .phone:
					if horizontalSizeClass == . compact
					{ return .tall }
					else
					{ return .flat }
				case .pad:
					if horizontalSizeClass == . compact
					{ return .tall }
					else
					{ return .fat }
				default:
					return .other
			}
		}
		set { }
	}
}

extension View
{
	
	/// Adds the FormFactor variable to the environment of the view.
	/// - Parameter formFactor: Device's form factor
	/// - Returns: A view with the environment value.
	func formFactor(_ formFactor: FormFactor) -> some View
	{
		self.environment(\.formFactor, formFactor)
	}
}
