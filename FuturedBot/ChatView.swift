//
//  ContentView.swift
//  FuturedBot
//
//  Created by Patrik Potocek on 20.06.2023.
//

import SwiftUI
import OpenAI

struct ChatView: View {

    let openAI = OpenAI(apiToken: "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")

    @State var response: String = ""

    var body: some View {
        VStack {
            Button("Test") {
                openAI.chats(query:
                                ChatQuery(
                                    model: .gpt4,
                                    messages: [Chat(role: .user, content: "Daj 20 coinov Radkovy za super spoluprácu na hackatone.")]
                                )) { result in
                                    switch result {
                                    case .success(let response):
                                        self.response = response.choices.first?.message.content ?? ""
                                    case .failure(let error):
                                        self.response = error.localizedDescription

                                    }
                                }
            }

            Text(response)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
