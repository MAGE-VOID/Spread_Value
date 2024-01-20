//+------------------------------------------------------------------+
//|                                                Spread Filter.mq5 |
//|                                                        Copyright |
//|                          https://www.mql5.com/en/users/neverwolf |
//+------------------------------------------------------------------+

#property copyright "Neverwolf"
#property link "https://www.mql5.com/en/users/neverwolf"
#property version "1.00"

void OnStart()
{
    string currentSymbol = Symbol();
    Print("Spread in Pips for " + currentSymbol + " = " + (string)SpreadInPips(currentSymbol));
    Print("Spread in Points for " + currentSymbol + " = " + (string)SpreadInPoints(currentSymbol));
}

double SpreadInPips(string currentSymbol)
{
    double Pip = 1.0;
    int getdigits = (int)SymbolInfoInteger(currentSymbol, SYMBOL_DIGITS);
    double getpoints = SymbolInfoDouble(currentSymbol, SYMBOL_POINT);

    if (getdigits == 2 || getdigits == 4)
        Pip = 0.1;

    if (getdigits == 3 || getdigits == 5)
        Pip = 10.0;

    long spread = SymbolInfoInteger(currentSymbol, SYMBOL_SPREAD);
    return (spread / Pip);
}

long SpreadInPoints(string currentSymbol)
{
    long spread = SymbolInfoInteger(currentSymbol, SYMBOL_SPREAD);
    return spread;
}
