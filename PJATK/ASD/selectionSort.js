function selectionSort(arr){
    let n = arr.length;
    
    for(let i = 0; i < n - 1; i ++){
        let minNumberIndex = i;
        for(let j = i + 1; j < n; j++){
           if(arr[j] < arr[i]){
            minNumberIndex = j;
           }
        }
        if(minNumberIndex != 1){
            let tmp = arr[i];
            arr[i] = arr[minNumberIndex];
            arr[minNumberIndex] = tmp;
        }
    }
}

// Wprowadz tablice wymagana do posegregowania:
let arr = [4, 3, 6, 9, 1, 8, 0];
selectionSort(arr);
console.log(arr)
