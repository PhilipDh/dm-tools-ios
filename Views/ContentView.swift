//
//  ContentView.swift
//  dmtools
//
//  Created by Philip Dahmen on 17.12.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NPCViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            TabsView()
            
            switch viewModel.loadingState {
            case .idle, .loading:
                Spacer()
                VStack(spacing: 16) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color(hex: "64b5f6")))
                        .scaleEffect(1.5)
                    Text("Loading...")
                        .foregroundColor(Color(hex: "64b5f6"))
                }
                Spacer()
            case .loaded:
                    ScrollView {
                        VStack(spacing: 24) {
                            GenerateButtonView(viewModel: viewModel)
                            RaceButtonsView(viewModel: viewModel)
                            GeometryReader { geometry in
                                NPCCardView(viewModel: viewModel)
                                    .frame(width: geometry.size.width * 0.9)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .frame(height: 600) // Adjust this height based on your content
                        }
                        .padding(.horizontal)
                    }
                    .background(Color(hex: "1a1f2e"))
            case .error(let message):
                Spacer()
                VStack(spacing: 16) {
                    Text("Error: \(message)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Button("Retry") {
                        viewModel.retryLoading()
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color(hex: "2c3548"))
                    .foregroundColor(.white)
                    .cornerRadius(4)
                }
                Spacer()
            }
        }
        .background(Color(hex: "1a1f2e"))
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
}
