//
//  RemoteImage.swift
//  SentiaRealEstate
//
//  Created by Gustavo E M Cabral on 25/4/21.
//

import SwiftUI

struct RemoteImage
: View
{
	private enum LoadState { case loading, success, failure }
	
	/// Class that loads image in the background and keeps tabs on the state
	/// of the loading process.
	private class Loader
	: ObservableObject
	{
		var data = Data()
		var state = LoadState.loading // Images are considered not loaded at first
		
		/// Initializer
		/// - Parameter url: URL from which the image will be fetched.
		init(url: String)
		{
			guard let parsedURL = URL(string: url)
			else { fatalError("Invalid URL: \(url)") }
			
			DispatchQueue.global().async
			{
				URLSession.shared.dataTask(with: parsedURL)
				{ data, response, error in
					DispatchQueue.main.async
					{
						if let data = data, data.count > 0
						{
							self.data = data
							self.state = .success
						} else {
							self.state = .failure
						}
						
						self.objectWillChange.send()
					}
				}.resume()
			}
		}
	}
	
	/// Stores the images already loaded.
	static private let cache = NSCache<NSString, UIImage>()
	
	@StateObject private var loader: Loader
	var loading: Image // Image representing an image not yet loaded
	var failure: Image // Image representing a failed loading.
	var side: CGFloat // Side of the square containing the image.
	var imageKey: String // Key to recover loaded images from the cache.
	
	init(url: String,
		 loading: Image = Image(systemName: "photo"),
		 failure: Image = Image(systemName: "multiply.circle"),
		 side: CGFloat = 80)
	{
		_loader = StateObject(wrappedValue: Loader(url: url))
		self.loading = loading
		self.failure = failure
		self.side = side
		self.imageKey = url
	}
	
	/// Returns an image based on the loading and caching state.
	/// - Returns: The appropriate image, depending on state.
	private func selectImage() -> Image
	{
		if let cachedImage = RemoteImage.cache.object(forKey: imageKey as NSString)
		{
			loader.state = .success
			return Image(uiImage: cachedImage)
		} else {
			switch loader.state
			{
			case .loading:
				return loading
			case .failure:
				return failure
			default:
				if let uiImage = UIImage(data: loader.data) {
					RemoteImage.cache.setObject(uiImage, forKey: imageKey as NSString)
					return Image(uiImage: uiImage)
				} else {
					return failure
				}
			}
		}
	}
	
	var body: some View
	{
		selectImage()
		.resizable()
		.scaledToFill()
		.background(Color(UIColor.tertiarySystemBackground))
		.foregroundColor(Color(UIColor.secondarySystemBackground))
		.frame(width: side, height: side)
		.clipShape(Rectangle())
		.if(loader.state == .loading) // Progress indicator in case the image is still loading.
		{ img in
			img
			.overlay(
				ProgressView()
				.progressViewStyle(CircularProgressViewStyle())
			)
		}
	}
}
