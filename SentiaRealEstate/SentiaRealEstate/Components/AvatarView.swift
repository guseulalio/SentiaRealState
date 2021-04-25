//
//  AvatarView.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 25/4/21.
//

import SwiftUI

/// Shows the picture and name of the agent.
struct AvatarView
: View
{
	var agent: Agent
	
    var body: some View {
		VStack {
			RemoteImage(url: agent.avatar.small.url, side: 64)
			.clipShape(Circle())
			.overlay(
				Circle()
				.strokeBorder(lineWidth: 3, antialiased: true)
				.foregroundColor(Color.primary)
			)
			
			Text("\(agent.firstName) \(agent.lastName)")
				.font(.caption)
				.foregroundColor(Color(.secondaryLabel))
		}
    }
}
