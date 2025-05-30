I64 Calculator() {
    Print("\nEnter number 1: ");
    I64 n1 = GetI64;
    Print("\nEnter number 2: ");
    I64 n2 = GetI64;
    Print("\nSelect operation (+, -, *, /): ");
    U8 op = GetChar;
    
    switch (op) {
        case '+': return n1 + n2; break;
        case '-': return n1 - n2; break;
        case '*': return n1 * n2; break;
        case '/': return n1 / n2; break;
        default: PrintErr("\nWrong Operator"); break;
    }
}

U8 Main() {
    while (TRUE) {
        Print("\nDo you want to calculate? [Y/N]: ");
        U8 op = GetChar;
        if (op == 'Y') {
            DocClear;
            I64 result = Calculator;
            Print("\n\nResult: %d\n", result);
        }
        else {
            "\n";
            break;
        }
    }
}Main;