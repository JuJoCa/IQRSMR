import json
import os
import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.axes_grid1 import host_subplot

dj = {"0:00": 1.0161073825503355, "1:00": 1.0655033557046978, "3:00": 1.062281879194631, "5:00": 1.0636241610738257, "7:00": 1.0606711409395975, "8:00": 1.0338255033557047, "9:00": 1.0252348993288591,
      "10:00": 1.025771812080537, "11:00": 1.0373154362416106, "12:00": 1.033288590604027, "13:00": 1.0249664429530203, "15:00": 1.0273825503355707, "17:00": 1.0225503355704697,
      "19:00": 1.1068456375838926, "21:00": 1.0542281879194633, "23:00": 1.0690939597315437}

uni = {0: 1.0191946308724833, 1: 1.0336912751677854, 3: 1.027248322147651, 5: 1.0163758389261746, 7: 1.0126174496644298, 8: 1.0233557046979866, 9: 1.014765100671141,
      10: 1.0477852348993288, 11: 1.1485906040268457, 12: 1.08751677852349,13: 1.0714093959731543, 15: 1.0551677852348997, 17: 1.056778523489933,
      19: 1.0591946308724833, 21: 1.0641610738255034, 23: 1.0529530201342283}

multi = {0: 1.0097986577181208, 1: 1.045503355704698, 3: 1.0386577181208057, 5: 1.025503355704698, 7: 1.0213422818791948, 8: 1.022818791946309, 
         9: 1.0178523489932885, 10: 1.045369127516779, 11: 1.0612080536912754, 12: 1.107248322147651, 13: 1.0096644295302015, 15: 1.0111409395973154, 
         17: 1.0142281879194635, 19: 1.011543624161074, 21: 1.0088590604026844, 23: 1.048013422818792}

key = dj.keys()
values1 = dj.values()
values2 = uni.values()
values3 = multi.values()
#print(values1)
#print(values2)
#print(values3)

numgrup = len(values1)
indic = np.arange(numgrup)
ancho = 0.25

params = {'xtick.labelsize': 14, 'ytick.labelsize': 14}
plt.rcParams.update(params)

#fig, ax1 = plt.subplots()
ax1 = host_subplot(111)

ax1.bar(indic, values1, width=ancho, label="Dijkstra_Re")
ax1.bar(indic+ancho, values2, width=ancho, label="Q-Learning")
ax1.bar(indic+ancho+ancho, values3, width=ancho, label="IQRSMR")
ax1.legend(loc='best', fancybox=True, framealpha=1, borderpad=0.5, fontsize=14)

plt.xticks(indic+ancho, key)

plt.ylim(bottom=1, top=1.155)
ax1.grid(True)
ax1.set_axisbelow(True)
ax1.set_ylabel("Stretch", fontsize=14, weight="bold")
ax1.set_xlabel("Hora", fontsize=14, weight="bold")

ax2 = ax1.twin()
ax2.axis["right"].major_ticklabels.set_visible(False)
ax2.axis["top"].major_ticklabels.set_visible(False)
plt.show()
'''
key2 = ["5488.4", "5043.2", "5095.2", "6880.4", "9581" , "9377.4", "9705.1", "9625.4", "9725.8", "9466.8", "9276.8", "8453.2", "7917.1", "7522.3", "6322.5", "5872.3"]
plt.plot(key2, values1, marker="o")
plt.plot(key2, values2, marker="o")
plt.plot(key2, values3, marker="o")
plt.show()
'''
