#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <cmath>
#include <stdexcept>
#include <algorithm>
#include <map>

class RPNCalculator {
private:
    std::vector<double> stack;
    std::vector<std::string> history;
    
public:
    // 栈操作
    void push(double value) {
        stack.push_back(value);
    }
    
    double pop() {
        if (stack.empty()) {
            throw std::runtime_error("错误: 栈为空");
        }
        double value = stack.back();
        stack.pop_back();
        return value;
    }
    
    void clear() {
        stack.clear();
    }
    
    void displayStack() const {
        std::cout << "当前栈: ";
        if (stack.empty()) {
            std::cout << "空";
        } else {
            for (size_t i = 0; i < stack.size(); ++i) {
                std::cout << stack[i];
                if (i != stack.size() - 1) {
                    std::cout << " ";
                }
            }
        }
        std::cout << std::endl;
    }
    
    // 基础运算
    void add() {
        if (stack.size() < 2) {
            throw std::runtime_error("错误: 需要至少2个操作数");
        }
        double b = pop();
        double a = pop();
        push(a + b);
    }
    
    void subtract() {
        if (stack.size() < 2) {
            throw std::runtime_error("错误: 需要至少2个操作数");
        }
        double b = pop();
        double a = pop();
        push(a - b);
    }
    
    void multiply() {
        if (stack.size() < 2) {
            throw std::runtime_error("错误: 需要至少2个操作数");
        }
        double b = pop();
        double a = pop();
        push(a * b);
    }
    
    void divide() {
        if (stack.size() < 2) {
            throw std::runtime_error("错误: 需要至少2个操作数");
        }
        double b = pop();
        if (b == 0) {
            throw std::runtime_error("错误: 除零错误");
        }
        double a = pop();
        push(a / b);
    }
    
    // 高级运算
    void power() {
        if (stack.size() < 2) {
            throw std::runtime_error("错误: 需要至少2个操作数");
        }
        double exponent = pop();
        double base = pop();
        push(std::pow(base, exponent));
    }
    
    void squareRoot() {
        if (stack.empty()) {
            throw std::runtime_error("错误: 栈为空");
        }
        double value = pop();
        if (value < 0) {
            throw std::runtime_error("错误: 负数不能开平方根");
        }
        push(std::sqrt(value));
    }
    
    void fibonacci() {
        if (stack.empty()) {
            throw std::runtime_error("错误: 栈为空");
        }
        double n = pop();
        if (n < 0 || n != static_cast<int>(n)) {
            throw std::runtime_error("错误: 斐波那契数列需要非负整数");
        }
        
        int num = static_cast<int>(n);
        if (num == 0) {
            push(0);
        } else if (num == 1) {
            push(1);
        } else {
            long long a = 0, b = 1;
            for (int i = 2; i <= num; ++i) {
                long long temp = a + b;
                a = b;
                b = temp;
            }
            push(static_cast<double>(b));
        }
    }
    
    // 表达式计算
    void calculate(const std::string& expression) {
        std::istringstream iss(expression);
        std::string token;
        std::vector<double> originalStack = stack;
        
        try {
            while (iss >> token) {
                if (token == "+") {
                    add();
                } else if (token == "-") {
                    subtract();
                } else if (token == "*") {
                    multiply();
                } else if (token == "/") {
                    divide();
                } else if (token == "^") {
                    power();
                } else if (token == "sqrt") {
                    squareRoot();
                } else if (token == "fib") {
                    fibonacci();
                } else if (token == "clear") {
                    clear();
                } else if (token == "show") {
                    displayStack();
                } else {
                    // 尝试转换为数字
                    try {
                        double value = std::stod(token);
                        push(value);
                    } catch (const std::exception&) {
                        throw std::runtime_error("错误: 未知的操作符或数字: " + token);
                    }
                }
            }
            
            // 记录成功的计算
            history.push_back(expression + " = " + std::to_string(getResult()));
            
        } catch (const std::exception& e) {
            // 恢复原始栈状态
            stack = originalStack;
            throw;
        }
    }
    
    double getResult() const {
        if (stack.empty()) {
            throw std::runtime_error("错误: 栈为空");
        }
        return stack.back();
    }
    
    void showHistory() const {
        std::cout << "计算历史:" << std::endl;
        for (const auto& entry : history) {
            std::cout << "  " << entry << std::endl;
        }
    }
    
    size_t getStackSize() const {
        return stack.size();
    }
};

// 批量计算函数
void batchCalculate(RPNCalculator& calc, const std::vector<std::string>& expressions) {
    std::cout << "开始批量计算..." << std::endl;
    for (size_t i = 0; i < expressions.size(); ++i) {
        std::cout << "表达式 " << (i + 1) << ": " << expressions[i] << std::endl;
        try {
            calc.calculate(expressions[i]);
            std::cout << "结果: " << calc.getResult() << std::endl;
            calc.clear(); // 清空栈为下一个表达式准备
        } catch (const std::exception& e) {
            std::cout << e.what() << std::endl;
        }
        std::cout << "---" << std::endl;
    }
}

int main() {
    RPNCalculator calc;
    std::string input;
    
    std::cout << "C++ RPN 计算器" << std::endl;
    std::cout << "支持的操作: +, -, *, /, ^(幂), sqrt(平方根), fib(斐波那契)" << std::endl;
    std::cout << "栈操作: clear(清空), show(显示栈), history(显示历史)" << std::endl;
    std::cout << "输入表达式 (例: '5 5 +'), 或 'q' 退出, 'batch' 批量计算模式" << std::endl;
    
    while (true) {
        std::cout << "> ";
        std::getline(std::cin, input);
        
        if (input == "q" || input == "quit") {
            break;
        } else if (input == "clear") {
            calc.clear();
            std::cout << "栈已清空" << std::endl;
        } else if (input == "show") {
            calc.displayStack();
        } else if (input == "history") {
            calc.showHistory();
        } else if (input == "batch") {
            std::vector<std::string> batchExpressions;
            std::cout << "批量计算模式 (输入空行结束):" << std::endl;
            std::string batchInput;
            while (true) {
                std::cout << "batch> ";
                std::getline(std::cin, batchInput);
                if (batchInput.empty()) {
                    break;
                }
                batchExpressions.push_back(batchInput);
            }
            batchCalculate(calc, batchExpressions);
        } else if (!input.empty()) {
            try {
                calc.calculate(input);
                std::cout << "结果: " << calc.getResult() << std::endl;
            } catch (const std::exception& e) {
                std::cout << e.what() << std::endl;
            }
        }
    }
    
    return 0;
}
