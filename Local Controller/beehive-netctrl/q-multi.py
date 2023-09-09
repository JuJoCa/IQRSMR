import sys
import json
import csv
import networkx as nx
import pylab as plt
import numpy as np
import os.path as path
import time

start = time.time()

secuencia_json = []
gamma = 0.1
tasa_aprendizaje = 0.9
epsilon = 0.4


class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.graph = [[100 for _ in range(vertices)] for _ in range(vertices)]  # se crea la matriz de n posiciones
        self.grafica = [[0 for _ in range(vertices)] for _ in range(vertices)]  # se crea la matriz de n posiciones

    def min_distance(self, dist, sptSet):
        min_dis = sys.maxsize  # distancia infinita
        min_index = 0
        for u in range(self.V):
            if dist[u] < min_dis and sptSet[u] == False:
                min_dis = dist[u]
                min_index = u
        return min_index

    def ruta(self, raiz, objetivo):
        caminho = []
        dist = [sys.maxsize] * self.V  # distancia infinita
        dist[raiz] = 0  # la distancia al punto de origen es 0
        spt_set = [False] * self.V  # un vector de solo false
        for cout in range(self.V):
            x = self.min_distance(dist, spt_set)
            spt_set[x] = True  # pasa el vecino a visitado
            for y in range(self.V):
                if self.graph[x][y] > 0 and spt_set[y] == False and dist[y] > dist[x] + self.graph[x][y]:
                    dist[y] = dist[x] + self.graph[x][y]
                    caminho.append([x, y, dist[y]])
        caminho.reverse()
        self.caminho(caminho, raiz, objetivo)

    def caminho(self, caminho, raiz, objetivo):
        aux = []
        origem = -1
        while not origem == raiz:
            for i in range(len(caminho)):
                if caminho[i][1] == objetivo:
                    aux.append(caminho[i])
                    objetivo = caminho[i][0]
                    origem = caminho[i][0]
        aux.reverse()
        sequencia = []
        newsequencia = []
        for i in range(len(aux)):
            if i == (len(aux) - 1):
                sequencia.append(aux[i][0] + 1)
                sequencia.append(aux[i][1] + 1)
            else:
                sequencia.append(aux[i][0] + 1)

        for val1 in sequencia:
            for val2 in newListGen.keys():
                if newListGen[val2] == val1-1:
                    newsequencia.append(val2)

        print(newsequencia, " |\t   ", aux[(len(aux) - 1)][2])
        secuencia_json.append(newsequencia)

def divir(lista, tamano):
    return [lista[n:n + tamano] for n in range(0, len(lista), tamano)]

coordenadas_nodos = []
listGen = []
with open('/home/controller2/go/src/github.com/kandoo/beehive-netctrl/topologyTest.json') as topology:
    data_topology = json.load(topology)
    for i in data_topology:
        listGen.append(int(i))
        for client in data_topology[i]:
            coordenadas_nodos.append(int(i))
            split_values = client['To'].split("$$")
            coordenadas_nodos2 = split_values[0]
            coordenadas_nodos.append(int(coordenadas_nodos2))
topology.close()

lista_nodos = divir(coordenadas_nodos, 2)

dictprueba = {}
for ix in lista_nodos:
    ctn = 0
    for iy in lista_nodos:
        if ix == iy or list(reversed(ix)) == iy:
            ctn+=1
            dictprueba[(ix[0], ix[1])] = ctn

for iz in dictprueba:
    if dictprueba[iz] == 1:
        lista_nodos.append([iz[1], iz[0]])

#print(lista_nodos, " len: ", len(lista_nodos))

listGen.sort()
newListGen = {}
ctn = 0
for val in listGen:
    newListGen[val] = ctn
    ctn+=1

with open('/home/controller2/go/src/github.com/kandoo/beehive-netctrl/bw_r.txt') as BW:
    bw_t = BW.readlines()

    bw_t = [s.strip() for s in bw_t]
    bw_t = [s.split(',') for s in bw_t]
    bw_t = [[float(num) for num in sublist] for sublist in bw_t]
    
    fileNet = '/home/controller2/go/src/github.com/kandoo/beehive-netctrl/net_info.csv'
    if path.exists(fileNet):
        with open(fileNet) as datos:
            datos_controlador = csv.reader(datos)
            sdf = next(datos_controlador)
            arrBw = []
            for dat in datos_controlador:
                arrBw.append(dat)
                
            bw = {}
            delay = {}
            lost_packets = {}
            for bwt in bw_t:
                for dat in arrBw:
                    if (int(dat[0]) == bwt[0]) and (int(dat[1]) == bwt[1]):
                        #bw.append(max((bwt[3] * 1000) - float(dat[2]), 0))
                        #delay.append(max(float(dat[3]), 0))
                        #lost_packets.append(max(float(dat[4]), 0))
                        
                        bw[(bwt[0], bwt[1])] = max((bwt[3] * 1000) - float(dat[2]), 0)
                        delay[(bwt[0], bwt[1])] = max(float(dat[3]), 0)
                        lost_packets[(bwt[0], bwt[1])] = max(float(dat[4]), 0)

                    elif (int(dat[0]) == bwt[1]) and (int(dat[1]) == bwt[0]):
                        #bw.append(max((bwt[3] * 1000) - float(dat[2]), 0))
                        #delay.append(max(float(dat[3]), 0))
                        #lost_packets.append(max(float(dat[4]), 0))
                        
                        bw[(bwt[1], bwt[0])] = max((bwt[3] * 1000) - float(dat[2]), 0)
                        delay[(bwt[1], bwt[0])] = max(float(dat[3]), 0)
                        lost_packets[(bwt[1], bwt[0])] = max(float(dat[4]), 0)
        datos.close()
    else:
        bw = {}
        delay = {}
        lost_packets = {}
        for nd in lista_nodos:
            bw[(nd[0], nd[1])] = 0.0
            delay[(nd[0], nd[1])] = 0.0
            lost_packets[(nd[0], nd[1])] = 0.0
BW.close()
#print(lista_nodos)
num_nodos = len(listGen)
G = nx.Graph()
G.add_edges_from(lista_nodos)
pos = nx.spring_layout(G)
nx.draw_networkx_nodes(G, pos)
nx.draw_networkx_edges(G, pos)
nx.draw_networkx_labels(G, pos)
#plt.show()


# normalzacion metodo min-max
def reward(metrica_qos):
    new_min_metric = 1
    new_max_metric = 10
    max_metric = max(metrica_qos.values())
    min_metric = min(metrica_qos.values())
    metrica_normalizada = {}

    for i in lista_nodos:
        if max_metric != min_metric:
            valor = metrica_qos.get((i[0], i[1]))
            if valor is not None:
            #metrica_normalizada.append(((metrica_qos[i] - min_metric) * (new_max_metric - new_min_metric)) / (
            #        max_metric - min_metric) + new_min_metric)
                metrica_normalizada[(i[0], i[1])] = ((metrica_qos[(i[0], i[1])] - min_metric) * (new_max_metric - new_min_metric)) / (max_metric - min_metric) + new_min_metric
            else:
                metrica_normalizada[(i[0], i[1])] = 1
        else:
            metrica_normalizada[(i[0], i[1])] = 1
    return metrica_normalizada


w1 = 0.3
w2 = 0.3
w3 = 0.3
#RR = []
RR1 = {}
RR2 = {}
RR3 = {}

BW_New = reward(bw)
DlinkN = reward(delay)
PLlinkN = reward(lost_packets)

for i in lista_nodos:
    RR1[(i[0], i[1])] = 1/BW_New[(i[0], i[1])]
    RR2[(i[0], i[1])] = DlinkN[(i[0], i[1])]
    RR3[(i[0], i[1])] = PLlinkN[(i[0], i[1])]


def acciones_posibles(estado_actual):
    fila_estado_actual = recompensa.graph[estado_actual]
    av_act = np.where(np.array(fila_estado_actual) < 50)[0]
    return av_act


def accion(acciones_posibles, epsilon, estado_actual):
    if np.random.random() < epsilon:
        next_action = int(np.argmin(Q.graph[estado_actual]))
    else:
        next_action = int(np.random.choice(acciones_posibles, 1))
    return next_action


def actualizacion_q(estado_actual, accion, gamma, tasa_aprendizaje):
    max_index1 = np.where(Q1.graph[accion] == np.min(Q1.graph[accion]))[0]
    max_index2 = np.where(Q2.graph[accion] == np.min(Q2.graph[accion]))[0]
    max_index3 = np.where(Q3.graph[accion] == np.min(Q3.graph[accion]))[0]
    if max_index1.shape[0] > 1:
        max_index1 = int(np.random.choice(max_index1, size=1))
    else:
        max_index1 = int(max_index1)
    if max_index2.shape[0] > 1:
        max_index2 = int(np.random.choice(max_index2, size=1))
    else:
        max_index2 = int(max_index2)
    if max_index3.shape[0] > 1:
        max_index3 = int(np.random.choice(max_index3, size=1))
    else:
        max_index3 = int(max_index3)

    Q1.graph[estado_actual][accion] = Q1.graph[estado_actual][accion] + tasa_aprendizaje * (
            recompensa1.graph[estado_actual][accion] + (gamma * Q1.graph[accion][max_index1]) - Q1.graph[estado_actual][accion])
    Q2.graph[estado_actual][accion] = Q2.graph[estado_actual][accion] + tasa_aprendizaje * (
            recompensa2.graph[estado_actual][accion] + (gamma * Q2.graph[accion][max_index2]) - Q2.graph[estado_actual][accion])
    Q3.graph[estado_actual][accion] = Q3.graph[estado_actual][accion] + tasa_aprendizaje * (
            recompensa3.graph[estado_actual][accion] + (gamma * Q3.graph[accion][max_index3]) - Q3.graph[estado_actual][accion])

    Q.graph[estado_actual][accion] = 1/3 * np.add(np.add(Q1.graph[estado_actual][accion], Q2.graph[estado_actual][accion]),
                                              Q3.graph[estado_actual][accion])

    '''ke = 0
    for yy in range(len(lista_nodos)):
        coor_x.append(lista_nodos[ke][0])
        coor_y.append(lista_nodos[ke][1])
        Q_grafica.grafica[newListGen[coor_x[ke]]][newListGen[coor_y[ke]]] = Q.graph[newListGen[coor_x[ke]]][newListGen[coor_y[ke]]]

    if (np.max(Q_grafica.grafica) > 0):
        return (np.sum(Q_grafica.grafica / np.max(Q_grafica.grafica) * 100))
    else:
        return (0)'''


for estado_actual in range(num_nodos):
    for x in range(num_nodos):
        if x == estado_actual:
            continue
        else:
            recompensa = Graph(num_nodos)
            recompensa1 = Graph(num_nodos)
            recompensa2 = Graph(num_nodos)
            recompensa3 = Graph(num_nodos)
            recompensa_aux=Graph(num_nodos)
            Q = Graph(num_nodos)
            Q1 = Graph(num_nodos)
            Q2 = Graph(num_nodos)
            Q3 = Graph(num_nodos)
            Q_grafica = Graph(num_nodos)
            coor_x = []
            coor_y = []
            ki = 0
            for xx in lista_nodos:
                coor_x.append(lista_nodos[ki][0])
                coor_y.append(lista_nodos[ki][1])
                recompensa1.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = RR1[(xx[0], xx[1])]
                recompensa2.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = RR2[(xx[0], xx[1])]
                recompensa3.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = RR3[(xx[0], xx[1])]
                Q.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = 0
                Q1.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = 0
                Q2.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = 0
                Q3.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = 0
                ki+=1
            #recompensa.graph=1/3*(recompensa1.graph+recompensa2.graph+recompensa3.graph)
            recompensa_aux.graph = np.add(recompensa1.graph, recompensa2.graph)
            recompensa.graph = np.add(recompensa_aux.graph, recompensa3.graph)/3
            scores = []
            for entrenamiento in range(500):
                state = np.random.randint(0, num_nodos)
                acion_posible = acciones_posibles(state)
                siguiente_accion = accion(acion_posible, epsilon, estado_actual)
                actualizacion = actualizacion_q(state, siguiente_accion, gamma, tasa_aprendizaje)
                scores.append(actualizacion)
            Q.ruta(estado_actual, x)
            # plt.plot(scores)
            # plt.xlabel('No of iterations')
            # plt.ylabel('Reward gained')
            # plt.show()

end = time.time()
print("Tiempo de ejecucion program --> ", end-start)
start2 = time.time()
with open('/home/controller2/go/src/github.com/kandoo/beehive-netctrl/dijkstra_all.json', 'w') as file:
    json.dump(secuencia_json, file, indent=2)
file.close()
end2 = time.time()
print("Tiempo de ejecucion write file --> ", end2-start2)
