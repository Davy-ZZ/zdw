import nimib

nbInit

nbText: """
# RPN计算器使用手册

<div style="text-align: center; color: #666; margin-bottom: 2rem;">
  基于C++实现的逆波兰表示法计算器 - 完整文档
</div>
"""

nbText: "## 🚀 快速开始"

nbText: "### 编译程序"
nbText: "```bash"
nbText: "# 使用g++编译"
nbText: "g++ -std=c++11 -o rpn_calc rpn_calc.cpp"
nbText: ""
nbText: "# 或者使用clang++" 
nbText: "clang++ -std=c++11 -o rpn_calc rpn_calc.cpp"
nbText: "```"

nbText: "### 运行程序"
nbText: "```bash"
nbText: "./rpn_calc"
nbText: "```"

nbText: "### 程序启动界面"
nbText: "```"
nbText: "C++ RPN 计算器"
nbText: "支持的操作: +, -, *, /, ^(幂), sqrt(平方根), fib(斐波那契)"
nbText: "栈操作: clear(清空), show(显示栈), history(显示历史)"
nbText: "输入表达式 (例: '5 5 +'), 或 'q' 退出, 'batch' 批量计算模式"
nbText: ">"
nbText: "```"

nbText: "## 📚 基础使用示例"

nbText: "### 简单四则运算"
nbText: "```"
nbText: "> 5 3 +"
nbText: "结果: 8"
nbText: ""
nbText: "> 10 4 -"
nbText: "结果: 6"
nbText: ""
nbText: "> 2 3 *"
nbText: "结果: 6"
nbText: ""
nbText: "> 15 3 /"
nbText: "结果: 5"
nbText: "```"

nbText: "### 复杂表达式计算"
nbText: "```"
nbText: "> 1 2 + 3 + 7 7 * +"
nbText: "结果: 55"
nbText: ""
nbText: "> 2 3 * 4 5 * +"
nbText: "结果: 26"
nbText: ""
nbText: "> 10 2 / 3 * 4 +"
nbText: "结果: 19"
nbText: "```"

nbText: "### 连续运算模式"
nbText: "```"
nbText: "> 5"
nbText: "结果: 5"
nbText: ""
nbText: "> 3" 
nbText: "结果: 3"
nbText: ""
nbText: "> +"
nbText: "结果: 8"
nbText: ""
nbText: "> 2"
nbText: "结果: 2"
nbText: ""
nbText: "> *"
nbText: "结果: 16"
nbText: "```"

nbText: "## 🔢 高级数学函数"

nbText: "### 幂运算"
nbText: "```"
nbText: "> 2 3 ^"
nbText: "结果: 8"
nbText: ""
nbText: "> 5 2 ^"
nbText: "结果: 25"
nbText: ""
nbText: "> 4 0.5 ^"
nbText: "结果: 2"
nbText: "```"

nbText: "### 平方根运算"
nbText: "```"
nbText: "> 16 sqrt"
nbText: "结果: 4"
nbText: ""
nbText: "> 2 sqrt"
nbText: "结果: 1.41421"
nbText: ""
nbText: "> 100 sqrt"
nbText: "结果: 10"
nbText: "```"

nbText: "### 斐波那契数列"
nbText: "```"
nbText: "> 0 fib"
nbText: "结果: 0"
nbText: ""
nbText: "> 1 fib"
nbText: "结果: 1"
nbText: ""
nbText: "> 5 fib"
nbText: "结果: 5"
nbText: ""
nbText: "> 10 fib"
nbText: "结果: 55"
nbText: ""
nbText: "> 15 fib"
nbText: "结果: 610"
nbText: "```"

nbText: "## 📖 操作符参考手册"

nbText: "### 基础算术运算符"
nbCode:
  let basicOps = @[
    ("+", "加法运算", "a b +", "a + b"),
    ("-", "减法运算", "a b -", "a - b"), 
    ("*", "乘法运算", "a b *", "a × b"),
    ("/", "除法运算", "a b /", "a ÷ b")
  ]

nbText: "| 操作符 | 功能说明 | RPN表达式 | 数学意义 |"
nbText: "|--------|----------|-----------|----------|"
for (op, desc, expr, math) in basicOps:
  nbText: "| `" & op & "` | " & desc & " | `" & expr & "` | " & math & " |"

nbText: "### 高级数学函数"
nbCode:
  let advancedOps = @[
    ("^", "幂运算", "a b ^", "aᵇ"),
    ("sqrt", "平方根", "a sqrt", "√a"),
    ("fib", "斐波那契数", "n fib", "fib(n)")
  ]

nbText: "| 操作符 | 功能说明 | RPN表达式 | 数学意义 |"
nbText: "|--------|----------|-----------|----------|"
for (op, desc, expr, math) in advancedOps:
  nbText: "| `" & op & "` | " & desc & " | `" & expr & "` | " & math & " |"

nbText: "## ⚙️ 系统命令"

nbText: "### 栈操作命令"
nbCode:
  let stackCommands = @[
    ("show", "显示当前栈内容"),
    ("clear", "清空栈"),
    ("stack", "显示栈状态（同show）")
  ]

nbText: "| 命令 | 功能说明 |"
nbText: "|------|----------|"
for (cmd, desc) in stackCommands:
  nbText: "| `" & cmd & "` | " & desc & " |"

nbText: "### 历史记录命令"
nbCode:
  let historyCommands = @[
    ("history", "显示计算历史"),
    ("clearhistory", "清空历史记录")
  ]

nbText: "| 命令 | 功能说明 |"
nbText: "|------|----------|"
for (cmd, desc) in historyCommands:
  nbText: "| `" & cmd & "` | " & desc & " |"

nbText: "### 程序控制命令"
nbCode:
  let controlCommands = @[
    ("batch", "进入批量计算模式"),
    ("help", "显示帮助信息"), 
    ("q", "退出程序"),
    ("quit", "退出程序（同q）")
  ]

nbText: "| 命令 | 功能说明 |"
nbText: "|------|----------|"
for (cmd, desc) in controlCommands:
  nbText: "| `" & cmd & "` | " & desc & " |"

nbText: "## 📦 批量计算模式"

nbText: "### 批量计算示例"
nbText: "```"
nbText: "> batch"
nbText: "批量计算模式 (输入空行结束):"
nbText: "batch> 1 2 + 3 *"
nbText: "batch> 10 5 / 2 +" 
nbText: "batch> 2 3 ^ 1 -"
nbText: "batch>"
nbText: "开始批量计算..."
nbText: "表达式 1: 1 2 + 3 *"
nbText: "结果: 9"
nbText: "---"
nbText: "表达式 2: 10 5 / 2 +"
nbText: "结果: 4"
nbText: "---"
nbText: "表达式 3: 2 3 ^ 1 -"
nbText: "结果: 7"
nbText: "---"
nbText: "批量计算完成"
nbText: "```"

nbText: "## ❌ 错误处理"

nbText: "### 常见错误示例"
nbCode:
  let errorExamples = @[
    ("除零错误", "5 0 /", "错误: 除零错误"),
    ("栈空错误", "+", "错误: 需要至少2个操作数"),
    ("无效输入", "abc", "错误: 未知的操作符或数字: abc"),
    ("负数平方根", "-4 sqrt", "错误: 负数不能开平方根"),
    ("无效斐波那契", "5.5 fib", "错误: 斐波那契数列需要非负整数")
  ]

nbText: "| 错误类型 | 输入示例 | 错误信息 |"
nbText: "|----------|----------|----------|"
for (errType, input, msg) in errorExamples:
  nbText: "| " & errType & " | `" & input & "` | " & msg & " |"

nbText: "## 💡 使用技巧"

nbText: "### 有效利用栈"
nbText: """
- **连续计算**: 利用栈的持久性进行多步计算
- **中间结果**: 复杂的计算可以分解为多个简单步骤
- **结果复用**: 之前的结果可以留在栈中供后续使用
"""

nbText: "### 表达式优化"
nbText: """
- **RPN优势**: 无需括号，操作顺序明确
- **效率**: 一次扫描即可完成计算
- **可读性**: 对于熟悉RPN的用户更加直观
"""

nbText: "## 🔧 技术规格"

nbText: "### 系统要求"
nbText: """
- **编译器**: 支持C++11标准的编译器 (g++ 4.8+, clang++ 3.3+)
- **内存**: 最少 4MB RAM
- **操作系统**: Linux, macOS, Windows (使用兼容的编译器)
"""

nbText: "### 性能特点"
nbText: """
- **时间复杂度**: O(n) - 线性时间处理表达式
- **空间复杂度**: O(n) - 基于栈深度
- **错误恢复**: 完整的异常安全保证
- **扩展性**: 模块化设计，易于添加新功能
"""

nbText: "## 📋 完整会话示例"

nbText: "### 交互式会话"
nbText: "```"
nbText: "C++ RPN 计算器"
nbText: "支持的操作: +, -, *, /, ^(幂), sqrt(平方根), fib(斐波那契)"
nbText: "栈操作: clear(清空), show(显示栈), history(显示历史)"
nbText: "输入表达式 (例: '5 5 +'), 或 'q' 退出, 'batch' 批量计算模式"
nbText: "> 5 3 +"
nbText: "结果: 8"
nbText: "> 2 *"
nbText: "结果: 16"
nbText: "> sqrt"
nbText: "结果: 4"
nbText: "> 10 fib"
nbText: "结果: 55"
nbText: "> show"
nbText: "当前栈: 4 55"
nbText: "> history"
nbText: "计算历史:"
nbText: "  5 3 + = 8.000000"
nbText: "  2 * = 16.000000"
nbText: "  sqrt = 4.000000"
nbText: "  10 fib = 55.000000"
nbText: "> clear"
nbText: "栈已清空"
nbText: "> q"
nbText: "感谢使用RPN计算器！"
nbText: "```"

nbText: """
## 🎯 总结

本RPN计算器提供了完整的逆波兰表示法计算功能，具有以下特点：

- ✅ **完整的四则运算**支持
- ✅ **高级数学函数**包括幂运算、平方根、斐波那契数列
- ✅ **健壮的错误处理**和用户友好的错误提示
- ✅ **批量计算模式**支持连续计算多个表达式
- ✅ **计算历史记录**便于查看和回溯
- ✅ **清晰的栈管理**操作简单直观

---

<div style="text-align: center; color: #999; margin-top: 3rem; border-top: 1px solid #eee; padding-top: 1rem;">
  文档版本: 1.0 | 最后更新: 2025年10月 | 生成工具: Nimib
</div>
"""

nbSave
