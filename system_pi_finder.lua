-- This program receives a Markovian Model Matrix and
-- calculates the system's respective Pi Values vector.

local matrix = require("matrix")

function main()
  local dimension = tonumber(io.read())
  local raw_mtx = read_raw_matrix(dimension)
  
  local q = matrix:new(raw_mtx)
  local qt = matrix.transpose(q)
  local qt_inv = matrix.invert(qt)
  local pi = calculate_sys_pi(qt_inv)

  print("\nMatrix:\n")
  matrix_format_print(q)

  print("\nTransposed:\n")
  matrix_format_print(qt)

  print("\nInverted:\n")
  matrix_format_print(qt_inv)

  print("\nPi Values Vector:\n")
  for i = 1, dimension do
    print(string.format("[%.3f]", pi[i]))
  end
end

function read_raw_matrix(dim)
  local input = {}

  for i = 1, dim do
    input[i] = {}
    for j = 1, dim do
      input[i][j] = io.read("*n")
    end
  end

  return input
end

function matrix_format_print(mtx)
  for i = 1, #mtx do
    io.write("[  ")

    for j = 1, #mtx[i] do
      elem = matrix.getelement(mtx, i, j)

      if (elem >= 0) then io.write("+") end
      io.write(string.format("%.4f  ", elem))

    end
    io.write("]\n")
  end
end

function calculate_sys_pi(inv_mtx)
  local pi_values = {}
  for i = 1, #inv_mtx do
    pi_values[i] = inv_mtx[i][#inv_mtx]
  end
  return pi_values
end

main()
