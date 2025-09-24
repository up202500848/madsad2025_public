from itertools import chain

def hondt_(votes, seats):

  quocients = map(
      lambda p: map(
          lambda i: {"party": p[0], "quotient": p[1] / i},
          range(1, seats + 1)
      ),
      enumerate(votes)
  )

  quotients_list = list(chain.from_iterable(quocients))
  quotients_list.sort(key=lambda x: x["quotient"], reverse=True)

  occupied_seats = [0] * len(votes)
  for entry in quotients_list[:seats]:
      occupied_seats[entry['party']] += 1

  return occupied_seats


print(hondt_([12000,7500,4500,3000], 7))

