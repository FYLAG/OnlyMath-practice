from bottle import route,view,post, request,redirect
from datetime import datetime
import re, pdb, app, routes
import networkx as nx
import numpy as np
import time
import os
import matplotlib.pyplot as plt


def get_matrix(): # метод получения матрицы со страницы html
    lenMatrix = request.forms.get('matrix_size')
    intnumber = int(lenMatrix)
    matrix = [ [ 0 for o in range(intnumber) ] for i in range(intnumber)]

    for o in range(intnumber):
        for i in range(intnumber):
            matrix[o][i] = int(request.forms.get(str(o+1)+"."+str(i+1)))# запись в массив всех значений клеток со страницы

    return matrix

def to_file(matrix, result):#метод записи информации в файл с историей запросов
    dt = datetime.now()#получение времени запроса
    filewrite=open('nodelength_history.txt', 'a')#запись иннформации в файл
    filewrite.write("\n")
    filewrite.write("=========="+str(dt)+" ==========\n")#время
    filewrite.write("Матрица:\n")
    for i in matrix:
         filewrite.write(str(i)+"\n")#построчно матрица
    filewrite.write("Результат:\n"+result+"\n")#результат
    filewrite.close()


@post('/method-nodes-length', method="post")#метод вызывающийся после нажатия на кнопку "Посчитать результат"
@view('method_nodesLength')
def my_form():
    plt.clf()#очистка буфера с картинкой графа 
    dir = 'static/graphs/' #директория для хранения картинки графа
    for f in os.listdir(dir):#очистка директории
        os.remove(os.path.join(dir, f))
    matrix=get_matrix()#вызов метода получения матрицы со страницы
    k=int(request.forms.get('level'))#получения переменной яруса на котором мы будем искать максимальное окружение
    G = nx.Graph(np.matrix(matrix))#отрисовка графа по матрице смежности
    length = dict(nx.all_pairs_shortest_path_length(G))
    R = np.array([[length.get(m,{}).get(n, 0) <= k for m in G.nodes] for n in G.nodes], dtype=np.int32)#образование матрицы достижимости k степени
    array_indexes=np.argwhere(np.sum(R, axis=-1) == max(R.sum(axis=1))) #поиск точек с максимальным окружением
    flat_array = array_indexes.flatten()
    color_map = [] #обьявление массива для раскрашивания вершин
    for node in G:#если вершина появляется в массиве с вершинами с макс окружением
        if node in flat_array:
            color_map.append('blue')
        else: 
            color_map.append("#C83033")
    result="Вершины с максимальным окружением на уровне "+str(k)+" :" #запись результата
    for i in flat_array:
        result+=str(i)+","
    nx.draw(G,pos=nx.shell_layout(G), node_color=color_map, node_size=400, font_color='white',edge_color='#333', with_labels=True, arrows=False)#отрисовка графа
    dt = datetime.now()
    filename = int(time.mktime(dt.timetuple()))#сохранение файла при помощи UML времени
    pathPicture = 'static/graphs/'+str(filename)+'.png'
    plt.savefig(pathPicture)#сохранение файла
    to_file(matrix,result)#вызов метода сохранения в историю

    return dict( #возвращаемые значения
        title = "Поиск в графе вершин, имеющих наибольшее окружение", #заголовок
        year=datetime.now().year,
        image=pathPicture, #путь к изображению
        resultout=result, #строка результата
        matrixout=matrix, #введенная матрица
        levelout=k #введенный ярус
    )
