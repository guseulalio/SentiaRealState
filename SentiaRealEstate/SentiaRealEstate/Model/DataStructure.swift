//
//  DataStructure.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 23/4/21.
//

import Foundation

struct AllProperties
: Codable
{
	var data: [Property]
}

struct Property
: Codable, Identifiable
{
	var id:				String
	var auctionDate: 	Date
	var availableFrom:	Date
	var bedrooms:		Int
	var bathrooms:		Int
	var carspaces:		Int
	var dateFirstListed:Date
	var dateUpdated:	Date
	var description:	String
	var displayPrice:	String
	var currency:		String
	var location:		Location
	var owner:			Owner
	var propertyImages:	[PropertyImage]
	var agent:			Agent
	var propertyType:	String
	var saleType:		String
}

struct Location
: Codable
{
	var address:	String
	var state:		String
	var suburb:		String
	var postcode:	String?
	var latitude:	Double
	var longitude:	Double
}

struct Owner
: Codable
{
	var firstName:	String
	var lastName:	String
	var dob:		Date
	var avatar:		Avatar
}

struct Avatar
: Codable
{
	var small:	WebLink
	var medium:	WebLink
	var large:	WebLink
}

struct WebLink
: Codable
{
	var url: String
}

struct PropertyImage
: Codable, Identifiable
{
	let id:			Int
	var attachment: Attachment
}

struct Attachment
: Codable
{
	var url:	String
	var thumb:	WebLink
	var medium:	WebLink
	var large:	WebLink
}

struct Agent
: Codable
{
	var firstName:		String
	var lastName:		String
	var companyName:	String
	var avatar:			Avatar
}
