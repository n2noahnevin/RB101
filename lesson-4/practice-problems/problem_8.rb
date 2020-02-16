# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# .take returns the first n elements of the array. It is not destructive.
# This will return [1, 2].