tests :-

  test('take elements from head of list', (
    take(0, [1,2,3], [], [1,2,3]),
    take(1, [1,2,3], [1], [2,3]),
    take(2, [1,2,3], [1,2], [3])
  )),

  test('first element of list', (
    first([1,2,3], 1, [2,3])
  )),

  test('partition list', (
    partition(1, [], []),
    partition(1, [1,2], [[1], [2]]),
    partition(2, [1,2,3,4], [[1,2], [3,4]])
  )),

  test('transpose two-dimentional list', (
    transpose([], []),
    transpose([[1], [2]], [[1,2]]),
    transpose([[1,2], [3,4]], [[1,3], [2,4]])
  )),

  test('size of puzzle', (
    size_of([1,2,3,4,5,6,7,8,9], 3)
  )),

  test('size of square', (
    square_size(4, 2, 2),
    square_size(6, 3, 2),
    square_size(9, 3, 3),
    \+ square_size(10, _, _)
  )),

  test('get squares in puzzle', (
    squares([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
      [[1,5,2,6], [3,7,4,8], [9,13,10,14], [11,15,12,16]])
  )),

  test('square root as integer', (
    sqrt_int(9, 3),
    \+ sqrt_int(5, _)
  )).

:- initialization(tests).
