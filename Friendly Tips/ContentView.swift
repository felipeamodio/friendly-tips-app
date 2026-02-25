import SwiftUI

struct ContentView: View {
    @State private var billAmount: String = ""
    @State private var billPercentage: String = ""
    @State private var numberOfPerson: String = ""
    @State private var tipAmount: Double = 0.0
    @State private var totalAmount: Double = 0.0
    @State private var totalPerPerson: Double = 0.0
    @State private var selectedTip: Int? = nil
    
    let tipOptions = [10, 15, 20, 25]
    
    var body: some View {
        ZStack {
            VStack {
                Image("logo").resizable().frame(width: 200, height: 40)
                
                Text("Calculate tips and split bills easily")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                
                VStack(alignment: .leading) {
                    Text("Amount ($)").font(.system(size: 16, weight: .semibold))
                    TextField("0.00", text: $billAmount)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .keyboardType(.decimalPad)
                        .textContentType(.none)
                        .autocorrectionDisabled()
                    
                    Text("Tip Percentage").font(.system(size: 16, weight: .semibold)).padding(.top, 5)
                    HStack(spacing: 8) {
                        ForEach(tipOptions, id: \.self) { tip in
                            Button("\(tip)%") {
                                selectedTip = selectedTip == tip ? nil : tip
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
                    TextField("0", text: $numberOfPerson)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .keyboardType(.numberPad)
                        .textContentType(.none)
                        .autocorrectionDisabled()
                    
                }.padding(.top, 20)
                
                Divider().padding(.vertical, 30)
                
                VStack {
                    HStack {
                        Text("Tip Amount").foregroundStyle(Color(.systemGray)).font(.title3)
                        Spacer()
                        Text(String(format: "$%.2f", tipAmount)).fontWeight(.bold).font(.largeTitle)
                    }
                    HStack {
                        Text("Total Amount").foregroundStyle(Color(.systemGray)).font(.title3)
                        Spacer()
                        Text(String(format: "$%.2f", totalAmount)).fontWeight(.bold).font(.largeTitle)
                    }
                    HStack {
                        Text("Total per Person").foregroundStyle(Color(.systemGray)).font(.title3)
                        Spacer()
                        Text(String(format: "$%.2f", totalPerPerson)).fontWeight(.bold).font(.largeTitle)
                    }
                }
                
                Spacer()
                
                Button(action: calculate) {
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
        .onTapGesture {
            UIApplication.shared.hideKeyboard()
        }
    }
    
    func parseDouble(_ value: String) -> Double? {
        Double(value.replacingOccurrences(of: ",", with: "."))
    }
    
    func calculate() {
        guard let amount = parseDouble(billAmount),
              let people = Int(numberOfPerson),
              people > 0 else { return }
        
        let tip: Double
        if let selected = selectedTip {
            tip = Double(selected)
        } else if let custom = parseDouble(billPercentage) {
            tip = custom
        } else {
            tip = 0
        }
        
        tipAmount = amount * tip / 100
        totalAmount = amount + tipAmount
        totalPerPerson = totalAmount / Double(people)
    }
}

extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
