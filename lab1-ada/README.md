# ada assignment
implementation of a concurrent matrix multiplication
using the easist but also a dumb way: creating task for every value.
the context switch cost is quite expensive.
it turns out that sequential is much faster if you create so many "adaroutines".