fn main() {
    let mut eagles = vec![1,3,9,2,0,1,8];
    heapsort(&mut eagles);
    println!("{:?}", eagles);
}

fn max_heapify<T>(array: &mut [T], i: usize, heap_size: usize)
    where T: Ord
{
    let l = 2 * i;
    let r = 2 * i + 1;
    let mut largest = i;

    if l < heap_size && array[l] > array[i] {
	largest = l
    }

    if r < heap_size && array[r] > array[largest] {
	largest = r
    }

    if largest != i {
	array.swap(i, largest);
	max_heapify(array, largest, heap_size);
    }
}
	  
fn heapsort<T>(array: &mut [T])
    where T: Ord
{
    let mut heap_size = array.len();

    for i in (0..array.len() / 2).rev() {
	max_heapify(array, i, heap_size)
    }

    for i in (1..array.len()).rev() {
	array.swap(0, i);
	heap_size -= 1;
	max_heapify(array, 0, heap_size);
    }
}
    
