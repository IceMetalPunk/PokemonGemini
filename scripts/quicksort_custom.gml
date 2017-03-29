/// quicksort_custom(ds_list list, int low_index, int high_index, script comparator)
/* Syntax: quicksort_custom(ds_list list, int low_index, int high_index, script comparator)

Arguments:
list - The ds_list handle to sort.
low_index, high_index - The first and last elements in the subset to sort; usually 0 to length(list)
comparator - The script index to use for comparing. See notes below for more info.

Returns: Nothing. Just sorts the list.

Notes: A comparator should take two arguments, A and B (so comparator(A, B)). It should
        return -1 if A<B, 0 if A=B, and 1 if A>B.
*/
var A=argument0, low=argument1, high=argument2, comparator=argument3, i, j, temp, pivot;
if (low < high) {

    pivot = A[| high];
    i = low - 1;    
    for (j = low; j < high; ++j) {
        if (script_execute(comparator, A[| j], pivot) <= 0) {
            ++i;
            temp = A[| i];
            A[| i] = A[| j];
            A[| j] = temp;
        }
    }
    temp = A[| i + 1];
    A[| i + 1] = A[| high];
    A[| high] = temp;
    
    // Recurse
    quicksort_custom(A, low, i, comparator);
    quicksort_custom(A, i + 2, high, comparator);
}
