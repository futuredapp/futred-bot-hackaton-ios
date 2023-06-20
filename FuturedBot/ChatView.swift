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

    @State var prompt: String = "Kolko coinov mám na účte?"
    @State var response: String = ""

    var body: some View {
        VStack {
            // texField input
            TextField("Input", text: $prompt)
                .padding()

            Button("Send") {
                openAI.chats(query: ChatQuery(
                    model: .gpt4_0613,
                    messages: [Chat(role: .user, content: prompt)],
                    functions: functions
                )) { result in
                    switch result {
                    case .success(let response):
                        process(choises: response.choices)
                    case .failure(let error):
                        self.response = error.localizedDescription

                    }
                }
            }

            Text(response)
        }
    }

    var configMessages: [Chat] {
        [
            Chat(role: .system, content: "You are FUCoin bot. You will receive text from which you should parse the following properties: names, number of points (which are called FUCoin, FUCoins, fukoins, fuckoins, coins or somehow similar or doesn't have to be mentioned directly) and a reason why the persons are receiving these coins. All of the properties are mandatory. If some property is missing return error: {\"error_message\": \"[missing properties]\"}"),
        ]
    }

    var functions: [ChatFunctionDeclaration] {
        [
            .init(
                name: "giveCoins",
                description: "Gives an amount of coins to a specific user for a specific reason",
                parameters: .init(type: .object, properties: [
                    "amount": .init(type: .number, description: "Amount of coins to give"),
                    "user": .init(type: .number, description: "ID of the user to give coins to"),
                    "reason": .init(type: .string, description: "Reason of the transation")
                ])
            ),
            .init(
                name: "getPersonId",
                description: "Returns the ID of a person for specific user",
                parameters: .init(type: .object, properties: [
                    "name": .init(type: .string, description: "User name")
                ])
            ),
            .init(name: "getPersonBudget",
                  description: "Returns the account balance for a specific user",
                  parameters: .init(type: .object, properties: [
                    "name": .init(type: .string, description: "User name")
                ]))
        ]
    }

    func process(choises: [ChatResult.Choice]) {
        let choice = choises.first!

        switch choice.message.functionCall {
        case "getPersonId":
            // sd
        default:
            print("unimplemented function \(choice.message.functionCall)")
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
