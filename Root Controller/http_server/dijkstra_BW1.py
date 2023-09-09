#!/usr/local/bin/python

import sys
import json
import csv
import os.path as path

secuencia_json = []
class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.graph = [[0 for _ in range(vertices)] for _ in range(vertices)]  # se crea la matriz de n posiciones

    def min_distance(self, dist, sptSet):
        min_dis = sys.maxsize  # distancia infinita
        min_index = 0
        for u in range(self.V):
            if dist[u] < min_dis and sptSet[u] == False:
                min_dis = dist[u]
                min_index = u
        return min_index

    def dijkstra(self, raiz, objetivo):
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
                sequencia.append(aux[i][0]+1)
                sequencia.append(aux[i][1]+1)
            else:
                sequencia.append(aux[i][0]+1)
            
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
with open('/home/kandoo18/Documentos/http_server/totalData/totalTopology.json') as topology:
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

print("listanodos: ", lista_nodos, " len: ", len(lista_nodos))
listGen.sort()
newListGen = {}
ctn = 0
for val in listGen:
    newListGen[val] = ctn
    ctn+=1

num_nodos = len(listGen)
g = Graph(num_nodos)

with open('/home/kandoo18/Documentos/http_server/totalData/totalBandwidth.txt') as BW:
    bw_t = BW.readlines()

    bw_t = [s.strip() for s in bw_t]
    bw_t = [s.split(',') for s in bw_t]
    bw_t = [[float(num) for num in sublist] for sublist in bw_t]

    fileNet = '/home/kandoo18/Documentos/http_server/totalData/totalMetrics.csv'
    if path.exists(fileNet):
        with open(fileNet) as datos:
            datos_controlador = csv.reader(datos)
            sdf = next(datos_controlador)
            arrBw = []
            for dat in datos_controlador:
                arrBw.append(dat)

            bw = {}
            for bwt in bw_t:
                for dat in arrBw:
                    if (int(dat[0]) == bwt[0]):
                        if (int(dat[1]) == bwt[1]):
                            bw[(bwt[0], bwt[1])] = max((bwt[3]*1000)-float(dat[2]), 0)
                            #bw[(bwt[0], bwt[1])] = 0.0
            
            for bwt in bw_t:
                for dat in arrBw:
                    if (int(dat[0]) == bwt[1]):
                        if (int(dat[1]) == bwt[0]):
                            bw[(bwt[1], bwt[0])] = max((bwt[3]*1000)-float(dat[2]), 0)
                            #bw[(bwt[1], bwt[0])] = 0.0
        datos.close()
    else:
        #si no existe un archivo de metricas colocar todos los pesos en 0
        bw = {}
        for nd in lista_nodos:
            bw[(nd[0], nd[1])] = 0.0
BW.close()

#normalzacion metodo min-max
new_mina = 1
new_maxa = 10
maxa = max(bw.values())
mina = min(bw.values())
BWlink_New = {}

for i in lista_nodos:
    if (maxa - mina) != 0:
        valor = bw.get((i[0], i[1]))
        if valor is not None:
            BWlink_New[(i[0], i[1])] = (((bw[(i[0], i[1])] - mina) * (new_maxa - new_mina)) / (maxa - mina)) + new_mina
        else:
            BWlink_New[(i[0], i[1])] = 0.0
    else:
        BWlink_New[(i[0], i[1])] = 0.0

coor_x=[]
coor_y = []
ki = 0
for x in lista_nodos:
    coor_x.append(lista_nodos[ki][0])
    coor_y.append(lista_nodos[ki][1])
    if BWlink_New[(x[0], x[1])] != 0:
        g.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = 1 / BWlink_New[(x[0], x[1])]
    else:
        g.graph[newListGen[coor_x[ki]]][newListGen[coor_y[ki]]] = 999999
    ki+=1

for i in range(num_nodos):
    if i < 12:
        for x in range(12,23):
            g.dijkstra(i, x)
    elif i >= 12:
        for x in range(0,12):
            g.dijkstra(i, x)

with open('/home/kandoo18/Documentos/http_server/bestRoutes.json', 'w') as file:
    json.dump(secuencia_json, file, indent=2)
file.close()
