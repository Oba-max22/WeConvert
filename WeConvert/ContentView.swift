//
//  ContentView.swift
//  WeConvert
//
//  Created by Decagon on 17/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State var inputTime : Double = 0;
    @State var from = "Seconds";
    @State var to = "Minutes";
    
    let units = ["Seconds", "Minutes", "Hours", "Days"]
    
    var convertedTime : Double {
        var result: Double = 0.0
        if (from == "Seconds" && to == "Minutes" || from == "Minutes" && to == "Hours") {
             result = inputTime / 60;
        } else if (from == "Minutes" && to == "Seconds" || from == "Hours" && to == "Minutes") {
            result = inputTime * 60;
        } else if (from == "Seconds" && to == "Hours") {
            result = inputTime / 3600;
        } else if (from == "Hours" && to == "Seconds") {
            result = inputTime * 3600;
        } else if (from == "Seconds" && to == "Days") {
            result = inputTime / 86400;
        } else if (from == "Days" && to == "Seconds") {
            result = inputTime * 86400;
        } else if (from == "Minutes" && to == "Days") {
            result = inputTime / 1440;
        } else if (from == "Days" && to == "Minutes") {
            result = inputTime * 1440;
        } else if (from == "Hours" && to == "Days") {
            result = inputTime / 24;
        } else if (from == "Days" && to == "Hours") {
            result = inputTime * 24;
        } else {
            result = inputTime
        }
        
        return result;
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Time", value: $inputTime, format: .number)
                } header: {
                    Text("Input (\(from))")
                }
                
                Section {
                    Picker("From:",selection: $from) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header : {
                    Text("From : ")
                }
                
                Section {
                    Picker("To:",selection: $to) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header : {
                    Text("To :")
                }
                
                Section {
                    Text("\(convertedTime)")
                } header: {
                    Text("Output (\(to))")
                }
            }
            .navigationTitle("WeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
