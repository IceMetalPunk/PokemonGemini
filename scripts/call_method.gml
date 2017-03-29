/// call_method(instance id, string method[, args...])
/* Syntax: boolean call_method(instance id, string method)

Arguments:
id - The ID of the instance to call the method on.
method - The string name of the method to call.
[args...] (Optional) - Any arguments to pass to the method, in order.

Returns: The result of the method call, or undefined if it throws an error.
*/

var methodName, retVal;
if (argument_count<2) {
    show_error("Invalid number of arguments to call_method (must be at least 2).", true);
    return undefined;
}

if (!object_is_ancestor(argument[0].object_index, Callable)) {
    show_error("Instance is not a Callable object!", true);
    return undefined;
}

methodName = argument[1];
with (argument[0]) {
    if (!ds_map_exists(self.methods, methodName)) {
        show_error("Method '"+string(methodName)+"' does not exist!", true);
        return undefined;
    }
    
    self.arguments = undefined; // Clears the array, and (hopefully?) GC's it
    for (var p=2; p<argument_count; ++p) {
        self.arguments[p-2] = argument[p];
    }
    
    event_user(self.methods[? methodName]);
    
    retVal = self.returnValue;
    
}
return retVal;