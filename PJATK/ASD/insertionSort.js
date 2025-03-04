function insertionSort(arr){
    let n = arr.length
    for(let i = 1; i < n; i ++){
       tmp = arr[i];
       let j = i - 1;

       while(j >= 0 && arr[j] > tmp){
        arr[j + 1] = arr[j];
        j--; 
       }
       arr[j + 1] = tmp;
    }
}

// Wprowadz tablice wymagana do posegregowania:
let arr = [-1, 4, 6, 2, 7, 8]
insertionSort(arr)
console.log(arr)