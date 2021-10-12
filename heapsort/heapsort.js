function maxHeapify(array, i, heapSize) {
    let l = 2 * i;
    let r = 2 * i + 1;
    let largest = i;

    if (l < heapSize && array[l] > array[i]) {
	largest = l
    } 

    if (r < heapSize && array[r] > array[largest]) {
	largest = r
    }
    if (largest != i) {
	[array[i], array[largest]] = [array[largest], array[i]];
	maxHeapify(array, largest, heapSize)
    }
}

function heapSort(array) {
    let heapSize = array.length;

    for (let i = Math.floor(array.length / 2); i >= 0; i--) {
	maxHeapify(array, i, heapSize);
	}

    for (let i = array.length - 1; i >= 1; i--) {
	[array[0], array[i]] = [array[i], array[0]];
	heapSize -= 1;
	console.log(heapSize);
	maxHeapify(array, 0, heapSize)
    }
}



    
    
	

	
    
