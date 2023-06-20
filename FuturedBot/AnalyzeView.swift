//
//  AnalyzeView.swift
//  FuturedBot
//
//  Created by Patrik Potocek on 20.06.2023.
//

import Foundation
import SwiftUI

// View that containts TextField input
struct AnalyzeView: View {

    @State var inputText: String = ""
    @State var response: String = ""

    var body: some View {
        VStack {
            TextField("Enter text to analyze", text: $inputText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            Button("Analyze") {
                print("analyze")
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
            .padding(.horizontal)

            Text(response)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}


// preview
struct AnalyzeView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzeView()
    }
}


