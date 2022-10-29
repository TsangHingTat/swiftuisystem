//
import SwiftUI

struct CalculatorLogic {
    
    private var number: Double?
    
    private var previousValue: Double?
    private var currentNumber: Double?
    private var activeOperation: CalculatorButton?
    private var calculatedValue: Double = 0

    //private var lastCalculation: (n1: Double, calcMethod: CalculatorButton)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private mutating func resetCalculator() -> Double {
        previousValue = nil
        currentNumber = nil
        activeOperation = nil
        return 0
    }
    
    private var lastInputEqual = false
    
    mutating func calculate(symbol: CalculatorButton) -> Double? {
        
        if let number = number {
            switch symbol {
            case .plusMinus:
                if number != 0 { return number * -1 }
            case .ac:
                return resetCalculator()
            case .percent:
                return number * 0.01
            case .equals:
                
                lastInputEqual = true
                
                if let previousValue = previousValue {
                    if let currentNumber = currentNumber {
                        return performCalculation(previousValue: previousValue, currentNumber: currentNumber)
                    } else {
                        currentNumber = number
                        return performCalculation(previousValue: previousValue, currentNumber: number)
                    }
                }
                
            default:
                
                if lastInputEqual {
                    lastInputEqual = false
                    previousValue = nil
                }

                if let previousValue = previousValue {
                    let result = performCalculation(previousValue: previousValue, currentNumber: number)
                    activeOperation = symbol
                    return result
                }
                
                activeOperation = symbol
                currentNumber = nil
                previousValue = previousValue != nil ? previousValue : number
            }
        }
        return nil
    }

    private mutating func performCalculation(previousValue: Double, currentNumber: Double) -> Double? {
        
        if let operation = activeOperation {
            switch operation {
            case .add:
                calculatedValue = previousValue + currentNumber
            case .subtract:
                calculatedValue = previousValue - currentNumber
            case .multiply:
                calculatedValue = previousValue * currentNumber
            case .divide:
                calculatedValue = previousValue / currentNumber
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        self.previousValue = calculatedValue
        return calculatedValue
    }
    
    
}

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, decimal
    case equals, add, subtract, multiply, divide
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "×"
        case .divide: return "÷"
        case .plusMinus: return "±"
        case .percent: return "%"
        case .decimal: return "."
        case .equals: return "="
        default:
            return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
    var textColor: Color {
        switch self {
        case .ac, .plusMinus, .percent:
            return Color(.black)
        default:
            return .white
        }
    }
    
    var size: CGFloat {
        switch self {
        case .ac, .plusMinus, .percent:
            return 28.0
        default:
            return 32.0
        }
    }
}

//MARK: - Global Application State

class GlobalEnvironment: ObservableObject {
    
    @Published var display = "0"
    
    //MARK: - Variables and Properties
    
    private var isFinishedTypingNumber: Bool = true
    private var lastInput: CalculatorButton?
    
    private var displayValue: Double {
        get {
            guard let number = Double(self.display) else { fatalError("Cannot convert display label text to a Double") }
            return number
        }
        set {
            self.display = newValue.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", newValue) : String(newValue)
        }
    }

    private var calculator = CalculatorLogic()
    
    //MARK: - Internal Methods
    
    private func isLastInputOperator() -> Bool {
        guard let lastInput = lastInput else { return false }
            return lastInput == .divide || lastInput == .multiply || lastInput == .add || lastInput == .subtract
    }
    
    func receiveInput(calculatorButton: CalculatorButton) {

        switch calculatorButton {
        case .ac, .plusMinus, .percent, .divide, .multiply, .subtract, .add, .equals:
            
            // check for two consecutive operators
            if isLastInputOperator() { break }
            
            isFinishedTypingNumber = true
            
            calculator.setNumber(displayValue)

            if let result = calculator.calculate(symbol: calculatorButton) {
                displayValue = result
            }
            
        default:
            
            if isFinishedTypingNumber {
                
                // do not duplicate zeros
                if displayValue == 0 && calculatorButton == .zero { return }
                
                if calculatorButton == .decimal {
                    self.display = "0" + calculatorButton.title
                } else { self.display = calculatorButton.title }
                
                isFinishedTypingNumber = false
                
            } else {
                
                if calculatorButton == .decimal {
                    
                    // check if number is whole number
                    if self.display.contains(".") { return }

                    // check if number already has a decimal
                    let isInt = floor(displayValue) == displayValue
                    if !isInt { return }
                }
                self.display = self.display + calculatorButton.title
            }
        }
        lastInput = calculatorButton
    }
}

//MARK: - ContentView

struct CalcView: View {
    
    @EnvironmentObject var env: GlobalEnvironment

    let spacing: CGFloat = 16
    
    var buttonWidth = (UIScreen.main.bounds.width - 5 * 16) / 4
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equals]
    ]

    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack (spacing: self.spacing) {
                
                HStack {
                    Spacer()
                    Text(env.display).foregroundColor(.white)
                        .font(.system(size: 100))
                        .fontWeight(.light)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }.padding(.trailing).padding(.trailing, buttonWidth / 2 / 4)
                
                ForEach(buttons, id: \.self) { row in
                    HStack (spacing: self.spacing) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
        Spacer()
            .frame(height: 50)
    }
}

//MARK: - SubViews

struct CalculatorButtonView: View {
    
    var button: CalculatorButton
    let spacing: CGFloat = 16
    
    let screenWidth = UIScreen.main.bounds.width
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        Button(action: {
            self.env.receiveInput(calculatorButton: self.button)
        }) {
            Text(button.title)
                .font(.system(size: button.size))
                .fontWeight(.regular)
                .frame(width: self.buttonWidth(button: button), height: (screenWidth - 5 * self.spacing)  / 4)
                .foregroundColor(button.textColor)
                .background(button.backgroundColor)
                .cornerRadius(self.buttonWidth(button: button))
        }
    }

    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (screenWidth - 4 * self.spacing)  / 4 * 2
        }
        return (screenWidth - 5 * self.spacing)  / 4
    }
}
