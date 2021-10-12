def max_heapify(array, i, heap_size):
    l = 2 * i
    r = 2 * i + 1
    largest = i
    
    if l < heap_size and array[l] > array[i]:
        largest = l
        
    if r < heap_size and array[r] > array[largest]:
        largest = r

    if largest != i:
        array[i], array[largest] = array[largest], array[i]
        max_heapify(array, largest, heap_size)

def heapsort(array):
    heap_size = len(array)
    
    for i in reversed(range((len(array) + 1) // 2)):
        max_heapify(array, i, heap_size)
        
    for i in reversed(range(1, len(array))):
        array[0], array[i] = array[i], array[0]
        heap_size -= 1
        max_heapify(array, 0, heap_size)


test = [1,3,82,3,9,3,8,2,22]
heapsort(test)
print(test)

