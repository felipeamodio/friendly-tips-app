//
//  ContentView.swift
//  Friendly Tips
//
//  Created by Felipe Alves Amodio on 24/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var billPercentage = ""
    
    @State private var selectedTip: Int? = nil
    
    let tipOptions = [10, 15, 20, 25]
    
    var body: some View {
        ZStack {
            VStack {
                Text("FRIENDLY TIPS").font(.system(size: 32, weight: .semibold))
                
                Text("Calculate tips and split bills easily").font(.headline).fontWeight(.medium).foregroundStyle(.gray)
                
                //Form
                VStack (alignment: .leading) {
                    //Amount
                    Text("Amount ($)").font(.system(size: 16, weight: .semibold))
                    TextField("0.00", text: $billAmount)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .keyboardType(.decimalPad)
                        .textContentType(.none)
                        .autocorrectionDisabled()
                    
                    //Amount
                    Text("Tip Percentage").font(.system(size: 16, weight: .semibold)).padding(.top, 5)
                    HStack (spacing: 8) {
                        ForEach(tipOptions, id: \.self) {tip in
                            Button("\(tip)%"){
                                selectedTip = tip
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(selectedTip == tip ? Color.black : Color.white)
                            .foregroundStyle(selectedTip == tip ? Color.white : Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        }
                    }
                    
                    TextField("Custom %", text: $billPercentage)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .keyboardType(.decimalPad)
                        .textContentType(.none)
                        .autocorrectionDisabled()
                        .padding(.top, 3)
                    
                    Text("Number of People").font(.system(size: 16, weight: .semibold)).padding(.top, 5)
                    TextField("0", text: $billPercentage)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .keyboardType(.decimalPad)
                        .textContentType(.none)
                        .autocorrectionDisabled()
                    
                }.padding(.top, 20)
                
                Divider().padding(.vertical, 30)
                
                VStack {
                    HStack {
                        Text("Tip Amount").foregroundStyle(Color(.systemGray)).font(.title3).fontWeight(.regular)
                        Spacer()
                        Text("$0.00").foregroundStyle(.black).fontWeight(.bold).font(.largeTitle)
                    }
                    
                    HStack {
                        Text("Total Amount").foregroundStyle(Color(.systemGray)).font(.title3).fontWeight(.regular)
                        Spacer()
                        Text("$0.00").foregroundStyle(.black).fontWeight(.bold).font(.largeTitle)
                    }
                }
                
                Spacer()
                
                // Calculate Button
                Button(action: {
                    //
                }) {
                    Text("Calculate Tip")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.top, 20)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
