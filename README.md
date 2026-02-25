# Friendly Tips 💰

A simple and elegant tip calculator app built with SwiftUI. Calculate tips and split bills with ease!

![Gif Friendly Tips](https://github.com/felipeamodio/friendly-tips-app/blob/main/tips.gif)

## Overview

Friendly Tips is an iOS app that helps you quickly calculate tips and split bills among multiple people. With its clean interface and intuitive design, you can easily determine the tip amount, total bill, and individual share in seconds.

## Features

- **💵 Bill Amount Input**: Enter the total bill amount with decimal precision
- **📊 Quick Tip Selection**: Choose from preset tip percentages (10%, 15%, 20%, 25%)
- **✏️ Custom Tip Percentage**: Enter your own custom tip percentage
- **👥 Bill Splitting**: Divide the total among any number of people
- **📱 Real-time Calculations**: See the tip amount, total, and per-person cost instantly
- **⌨️ Smart Keyboard Handling**: Dismiss the keyboard with a tap anywhere on the screen

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/friendly-tips.git
```

2. Open the project in Xcode:
```bash
cd friendly-tips
open FriendlyTips.xcodeproj
```

3. Build and run the project on your simulator or device

## Usage

1. **Enter Bill Amount**: Type in the total bill amount in the "Amount ($)" field
2. **Select Tip Percentage**: 
   - Tap one of the preset tip buttons (10%, 15%, 20%, 25%)
   - OR enter a custom percentage in the "Custom %" field
3. **Enter Number of People**: Specify how many people are splitting the bill
4. **Calculate**: Tap the "Calculate Tip" button to see the results

The app will display:
- **Tip Amount**: The calculated tip based on your percentage
- **Total Amount**: Bill amount + tip
- **Total per Person**: The amount each person should pay

## Code Structure

```
FriendlyTips/
├── ContentView.swift          # Main view with UI and calculation logic
├── Assets.xcassets/          # App assets and logo
└── README.md                 # This file
```

### Key Components

- **State Management**: Uses `@State` properties to manage user input and calculation results
- **Input Validation**: Includes `parseDouble()` function to handle decimal inputs with both commas and periods
- **Keyboard Dismissal**: Custom `UIApplication` extension for hiding the keyboard
- **Responsive UI**: Built entirely with SwiftUI for a native iOS experience

## Technical Highlights

### Input Parsing
The app includes a custom `parseDouble()` function that handles both comma and period decimal separators:
```swift
func parseDouble(_ value: String) -> Double? {
    return Double(value.replacingOccurrences(of: ",", with: "."))
}
```

### Smart Tip Selection
Users can select preset tip percentages or enter custom values. Tapping a selected preset tip deselects it:
```swift
if selectedTip == tip {
    selectedTip = nil // remove selection
} else {
    selectedTip = tip
}
```

### Calculation Logic
The app prioritizes preset tips over custom values and handles edge cases gracefully:
```swift
let tip: Double
if let selected = selectedTip {
    tip = Double(selected)
} else if let custom = parseDouble(billPercentage){
    tip = custom
} else {
    tip = 0
}
```

## Future Enhancements

Potential features to add:
- [ ] Save calculation history
- [ ] Support for multiple currencies
- [ ] Dark mode optimization
- [ ] Tip rounding options
- [ ] Share results with friends
- [ ] Widgets for quick calculations
- [ ] watchOS companion app

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Acknowledgments

- Built with SwiftUI
- Designed for iOS
