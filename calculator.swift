enum CalculatorError: Error {
    case InvalidOperator
    case DivisionByZero
}

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func divide(_ a: Int, _ b: Int) throws -> Int {
    guard b != 0 else {
        throw CalculatorError.DivisionByZero
    }
    return a / b
}

var operatorSymbol: String? = "/"
var operand1: Int? = 5
var operand2: Int? = 0

if let operatorSymbol = operatorSymbol, let operand1 = operand1, let operand2 = operand2 {
    do {
        var result: Int = 0
        switch operatorSymbol {
        case "+":
            result = add(operand1, operand2)
        case "-":
            result = subtract(operand1, operand2)
        case "*":
            result = multiply(operand1, operand2)
        case "/":
            result = try divide(operand1, operand2)
        default:
            throw CalculatorError.InvalidOperator
        }
        print("Результат операції: \(result)")
    } catch CalculatorError.InvalidOperator {
        print("Помилка: Невідомий оператор.")
    } catch CalculatorError.DivisionByZero {
        print("Помилка: Ділення на нуль.")
    } catch {
        print("Інша помилка: \(error)")
    }
} else {
    print("Не всі змінні мають значення")
}
