//
//  ContentView.swift
//  FirebaseFunctionsExample
//
//  Created by Reed Gantz on 11/26/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject var firebaseFunctionsManager: FirebaseFunctionsManager = FirebaseFunctionsManager()
    //@State var helloWorldMsg: String = "function not called yet"
    @State var responseData: ResponseData = ResponseData()
    
    var body: some View {
        VStack {
            Button("Call hello world firebase function"){
                Task{
                    do{
                        print("⚪️ Attempting to call helloWorld...")
                        responseData = try await firebaseFunctionsManager.callHelloWorld()
                        print("🟢 Successful call made at \(strDateFromUnixMilliseconds(milliseconds: responseData.timestamp))")
                    }
                    catch{
                        print("🔴 Error: \(error.localizedDescription)")
                    }
                }
            }.buttonStyle(.bordered)
            
            Text(responseData.message)
            
            Text("Called on:\n **\(strDateFromUnixMilliseconds(milliseconds: responseData.timestamp))**")
                .multilineTextAlignment(.center)
            
            Button("Clear"){
                responseData = ResponseData()
            }.buttonStyle(.bordered)
        }
        .padding()
    }
    
    func strDateFromUnixMilliseconds(milliseconds: Int) -> String{
        if milliseconds == 0{
            return "__"
        }
        let date = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm:ss a E, MMM d" // "Wed Feb 12 11:30 AM"
        formatter.timeZone = TimeZone.current // Set to local timezone
        return formatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
