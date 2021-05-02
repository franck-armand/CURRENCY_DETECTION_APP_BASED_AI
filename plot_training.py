import  matplotlib.pyplot as plt
import numpy as np
from  matplotlib.pyplot import style
print(style.available)
style.use("fast")

f = open("darknet/logs/log_file.log", "r")
content = ""
for line in f:
    if 'avg' in line:
        content = content + line

contents = content.split(",")
avg_content = []
for c in contents:
    if 'avg' in c:
        avg_content.append(c.strip())

loss = []

for a in avg_content:
    at = a.split(" ")
    loss.append(float(at[0]))

loss = np.array(loss)
loss = loss[loss < 1.0]
print(loss)
x = np.arange(0, 9000, 1000)

mAP = [0, 0.562720, 0.979095, 0.995541, 0.992207, 0.997659, 0.997112, 0.996843, 0.998524]

fig = plt.figure()
ax = fig.add_subplot(111)

ax.plot(loss, label="Training Loss")
ax.plot(x[:len(mAP)],
        mAP,  'ro', label="mAP",
                linestyle="-.",
                marker='o',
                markevery=1)
ax.set_xlim(0, 8000)
ax.set_ylim(0, 1.05)

for i,j in zip(x, mAP):
    if i == 0: continue
    jj = str(j * 100)[:2]
    ax.annotate("{}%".format(jj), xy=(i, j))

ax.set_ylabel("mAP/Loss")
ax.set_xlabel("Iterations")

plt.legend()
plt.grid()
plt.show()