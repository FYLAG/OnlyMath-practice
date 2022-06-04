import networkx as nx
from bottle import route,view,post,request,redirect
import numpy as np
import matplotlib.pyplot as plt
import io
import os, sys
import random
import time
import datetime
from random import randint

def checkMatrix(matrix):
    n = len(matrix)
    h= True
    for k in range(0,n-1):
        for l in range(k+1,n):
            if matrix[k][l]!=matrix[l][k]:
                h=False
                break
    if h!=False:
        print('Матрица симметрична')
    else:
        print('Матрица асимметрична')
    return h

def Get_adjacency_matrix(file): #cчитывание графа из файла
    adj_matrix = list()
    graphfile = open(file, 'r')
    for l in graphfile:
        #Сплит строки чере запятую с 1-го символа
        l = l.rstrip()[1:-1].split(',')
        for i in range(len(l)):
            l[i] = int(l[i])
        adj_matrix.append(l)
    #Проверка матрицы на симметричность
    checkMatrix(adj_matrix)
    graphfile.close()
    return adj_matrix

#Получение матрицы из формы
def reading():
    lenMatrix = request.forms.get('matrix_size')
    intnumber = int(lenMatrix)
    #Задание размера матрицы
    matrix = [ [ 0 for o in range(intnumber) ] for i in range(intnumber)]
    print(matrix)
    #Преборазование ячеек из формы в готовую для конвертации матрицу
    for o in range(intnumber):
        for i in range(intnumber):
            name=str(i+1)+"."+str(o+1)
            matrix[o][i]=int(request.forms.get(name))
    print(matrix)
    return matrix

#Форматированный вывод результата
def showEulPathLoop(K, sym, type):
    line = ""
    isFirst = True
    for i in K:
        if (isFirst):
            line += str(i[0]) + str(sym) + str(i[1]) + str(sym)
            isFirst = False
        else:
            line += str(i[1]) + str(sym)
    return(line + type)
#Метод нахождения, отрисовки и передачи текстового результата на страницу
@post('/method-eul', method="post")
@view('method_eul')
def method():
    #Очистка буфера MatPlotLib
    plt.clf()
    #Получение матрицы
    matrix = reading()
    #Создание матрицы из преобразованной в np.matrix
    G = nx.Graph(np.matrix(matrix))
    #Отладка
    print(G)
    res = ""
    matrString = ""
    #Вывод матрицы в строку
    for l in matrix:
        matrString += str(l);
        matrString += "\n"
    try:
        L = []
        color_map = []
        try:
            eul_circ = list(nx.eulerian_circuit(G))     
            line = showEulPathLoop(eul_circ, ' => ', 'цикл; \n')
            res += line
            #Выхов метода для нахождения эйлерова цикла
            C = nx.from_edgelist(eul_circ)
            print(line)
            for edge in G:
                if edge in C:
                    #Окрашивание в синий цвета ребра, состоящего в эйлеровом цикле
                    color_map.append('blue')
                else:
                    #Окрашивание в чёрный цвет ребра
                    color_map.append("#333")
        except:
            res += "Граф не является эйлеровым и не содержит эйлеров цикл. \n"
            print("Не содержит эйлеров цикл")
        eul_path = list(nx.eulerian_path(G))
        #Вызов метода нахождения эйлерова пути
        C = nx.from_edgelist(eul_path)
        for edge in G:
            if edge in C:
                color_map.append('blue')
            else:
                color_map.append("#333")
        line = showEulPathLoop(eul_path, ' -> ', 'путь')
        res += line + "\n"
        print(line)
        #Отрисовка графа по кругу
        nx.draw(G,pos=nx.circular_layout(G), node_color="#C83033", node_size=400, font_color='white',edge_color=color_map, with_labels=True, arrows=False)
    except:
        res += "Граф не содержит эйлеров путь."
        print("Не содержит эйлеров путь")
        nx.draw(G,pos=nx.circular_layout(G), node_color="#C83033", node_size=400, font_color='white',edge_color="#333", with_labels=True, arrows=False)
    #Получение текущего времени
    dt = datetime.datetime.now()
    #Преобразование времени в UNIX-формат
    filename = int(time.mktime(dt.timetuple()))
    #Статичный путь для сохранения графов
    dir = 'static/graphs/'
    for f in os.listdir(dir):#очистка директории
        os.remove(os.path.join(dir, f))
    #Конкатенация пути сохранения
    pathPicture = dir+str(filename)+'.png'
    #Дозапись в файл истории
    history = open('historyEul.txt', 'a')
    history.write("\n ========== " + str(datetime.datetime.now()) + " ========== " + "\n" + matrString + res)
    #Закрытие файла
    history.close()
    #Сохранение графа
    plt.savefig(pathPicture)
    
    #Передача параметров на страницу
    return dict (
        title = "Поиск Эйлерова цикла",
        year = datetime.datetime.now().year,
        image_path = pathPicture,
        result = res,
        matrixout = matrix
    )

#Метод для тестирования
def method_test(matrix):
    plt.clf()
    G = nx.Graph(np.matrix(matrix))
    res = ""
    matrString = ""
    for l in matrix:
        matrString += str(l);
        matrString += "\n"
    try:
        L = []
        color_map = []
        try:
            eul_circ = list(nx.eulerian_circuit(G))     
            line = showEulPathLoop(eul_circ, ' => ', 'цикл; \n')
            res += line
            C = nx.from_edgelist(eul_circ)
            for edge in G:
                if edge in C:
                    color_map.append('blue')
                else:
                    color_map.append("#333")
        except:
            res += "Граф не содержит эйлеров цикл. \n"
        eul_path = list(nx.eulerian_path(G))
        C = nx.from_edgelist(eul_path)
        for edge in G:
            if edge in C:
                color_map.append('blue')
            else:
                color_map.append("#333")
        line = showEulPathLoop(eul_path, ' -> ', 'путь')
        res += line
    except:
        res += "Граф не содержит эйлеров путь."
    return (res)