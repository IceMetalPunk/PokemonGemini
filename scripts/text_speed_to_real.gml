/// text_speed_to_real(TextSpeed speed)
/* Syntax: text_speed_to_real(TextSpeed speed)

Arguments:
TextSpeed speed - A value from the TextSpeed enum (SLOW, NORMAL, or FAST)

Returns: The proper real value corresponding to the speed type for text, in characters per step.
*/

return 0.125 * sqr(argument0) + 0.125 * argument0 + 0.25;