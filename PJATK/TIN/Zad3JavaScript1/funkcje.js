//zadanie 1
function fib(n){
    const fib = [0, 1]
    for(let i = 2; i < n ; i++){
        fib[i] = fib[i -1] + fib[i-2]
    }
    return  fib
}
console.log(fib(4))
console.log(fib(5))
console.log(fib(6))
console.log(fib(7))
//zadanie 2
function palindrom(tab){
    if(tab.join('') === tab.slice().reverse().join('')){
        return " Jest palindromem"
    }else{
        return " Nie jest palindromem"
    }
}
console.log(palindrom([1,2,3,2,1]))
console.log(palindrom(['a','b','c','b','a']))

//zadanie 3
function getType(n){
    return typeof n;
}
console.log(getType(46));            
console.log(getType([25, 10, 5, 2, 1])); 
console.log(getType("Tekst"));

//zadanie 4
function amountCoins(amount, coins) {
    let result = [];
    for (let i = 0; i < coins.length; i++) {
        while (amount >= coins[i]) {
            amount = amount-coins[i];
            result.push(coins[i])
        }
    }
    return result;
}
console.log(amountCoins(46, [25, 10, 5, 2, 1]));
