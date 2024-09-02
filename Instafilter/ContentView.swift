//
//  ContentView.swift
//  Instafilter
//
//  Created by Buhecha, Neeta on 02/09/2024.
//
//  Building the Basic UI
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
            if let processedImage {
                processedImage
                    .resizable()
                    .scaledToFit()
            } else {
                ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
            }
        }
                .buttonStyle(.plain)
                onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack{
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                
                HStack{
                    Button("Change Filter", action: ChangeFilter)
                    
                    Spacer()
                    // share the picture
                }
                
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
    }
    
    func ChangeFilter() {
        // function here
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else {return}
            guard let inputImage = UIImage(data: imageData) else {return}
            
            // more code to come
        }
    }

}

#Preview {
    ContentView()
}
