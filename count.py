
with open('failing') as f:
    failing = f.readlines()

failing = [int(x.strip()) for x in failing]

with open('passing') as f:
    passing = f.readlines()

passing = [int(x.strip()) for x in passing]

with open('pending') as f:
    pending = f.readlines()

pending = [int(x.strip()) for x in pending]

sum_passing = 0
sum_pending = 0
sum_failing = 0

for i in passing:
    sum_passing += i

for i in failing:
    sum_failing += i

for i in pending:
    sum_pending += i
    
print(f'Passing: {sum_passing}')
print(f'pending: {sum_pending}')
print(f'Failing: {sum_failing}')
