//
//  ContentView.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 23/4/21.
//

import SwiftUI

struct ContentView
: View
{
	@Environment(\.formFactor) var formFactor: FormFactor
	@StateObject var viewModel: ViewModel // The VM in MVVM
	
	init()
	{
		_viewModel = StateObject(wrappedValue: ViewModel())
	}
	
    var body: some View {
		NavigationView {
			VStack {
				List {
					ForEach(viewModel.properties)
					{ property in
						NavigationLink(destination: Text("ID: \(property.id)")) {
							TableCellView(property: property)
						}
					}
				}
			}
			.navigationBarTitle(Text("Sentia Real State"), displayMode: .inline)
		}
		.phoneOnlyStackNavigationView()
    }
}
