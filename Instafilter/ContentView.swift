//
//  ContentView.swift
//  Instafilter
//
//  Created by Buhecha, Neeta on 02/09/2024.
//
//  Building the Basic UI
//

import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                }
                
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

}

#Preview {
    ContentView()
}
