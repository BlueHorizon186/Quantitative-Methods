# This program generates and prints all possible states
# from an N-PC Token Ring setup, where each PC can only
# send 1 packet before the token is depleted, and each
# one can store up to 1 packet in a temporary buffer.

# NOTE: The program outputs every single possible state,
# regardless if it's valid or not. It is up to the
# programmer to define that according to the system's
# specifications. :D

from itertools import product
from sys import argv

pcs = int(argv[1])
packets = list(range(pcs + 1))

packets = [pck for pck in product(packets, repeat = pcs)]
for i in range(pcs):
  packets = list(filter(lambda x: x[i] <= 2, packets))

token = list(range(pcs * -1, pcs + 1))
token.remove(0)

states = []
for i in packets:
  for j in token:
    x = i + (j,)
    states.append(x)

for i in range(pcs):
  states = list(filter(lambda x: \
    not(x[i] == 2 and x[pcs] == (i+1)*-1), states))

print(len(states))
