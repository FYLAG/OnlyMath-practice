import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import io, os, random, time, datetime, re, pdb, app, routes
from bottle import post, view, request
from random import randint

def fillingMatrix():

    pass

    #lenMatrix = request.forms.getlist('');

    #matrix = [([0] * for o in range(lenMatrix)) for i in range(lenMatrix) ]

    #print(matrix)

    #return matrix

def Get_adjacency_matrix(file): #cчитывание графа из файла
    adj_matrix = list()
    graphline = file
    test = list(graphline.rstrip()[1:-1].split('\n'))
    print(test)
    #graphfile = open("TestSasha.txt", 'r')
    for l in test:
        print(l)
        l = l.rstrip()[2:-1].split(',')
        for i in range(len(l)):
            l[i] = int(l[i])
        adj_matrix.append(l)
    #graphfile.close()
    return adj_matrix

@post('/method-eul', method="post")
@view('method_eul')
def Gregory():
    matrix = [[0, 1, 1], [1, 0, 1], [1, 1, 0]]
    G = nx.Graph(np.matrix(matrix))  
    nx.draw(G,pos=nx.circular_layout(G), node_color="#C83033", node_size=400, font_color='white',edge_color='#333', with_labels=True, arrows=False)
    try:
        L = []
        try:
            eul_circ = list(nx.eulerian_circuit(G))     
            line = showEulPathLoop(eul_circ, ' => ', 'loop')
            print(line)
            C = nx.from_edgelist(eul_circ)
        except:
            print("not eulerian graph")
        eul_path = list(nx.eulerian_path(G))
        C = nx.from_edgelist(eul_path)
        line = showEulPathLoop(eul_path, ' -> ', 'path')
        print(line)
        #print(nx.to_numpy_array(C)) # вывод графа в виде матрицы
        nx.draw(C,pos=nx.circular_layout(C), node_color="#C83033", node_size=400, font_color='white',edge_color='blue', with_labels=True, arrows=False)
    except:
        print("not contains eulerian path")
    dt = datetime.datetime.now()
    filename = int(time.mktime(dt.timetuple()))
    pathPicture = 'static/graphs/'+str(filename)+'.png'
    fillingMatrix()
    plt.savefig(pathPicture)
    plt.show()

    return dict (
        title = "Поиск Эйлерова цикла",
        year = datetime.datetime.now().year
    )