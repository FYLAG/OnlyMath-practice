import io, os, re, pdb, app, datetime, time
import matplotlib.pyplot as plt
import networkx as nx
import numpy as np

from bottle import post, request
from random import randint

def checkSymmetryMatrix(matrix): # функция проверки симметричности матрицы

	for y in range(len(matrix)):

		for x in range(y + 1): # проверяем элементы находящиеся после диагонали

			if (matrix[y][x] != matrix[x][y]):

				return False

	return True

def transformationListDots(listDots): # функция для красивого вывода строки с точками

	for i in range(len(listDots)):

		listDots[i] = ' - '.join(map(str,listDots[i]))

	return listDots

def matrixReading(sizeMatrix, nameMatrix): # функция для автособирания матрицы со стараницы метода

	finishMatrix = [ [ 0 for x in range(sizeMatrix) ] for y in range(sizeMatrix) ]

	for y in range(sizeMatrix):

		for x in range(sizeMatrix):

			finishMatrix[y][x] = int(request.forms.get(str(y + 1) + nameMatrix + str(x + 1)))

	return finishMatrix

def matrixPicture(matrix):
	
	plt.clf() # очистка буфера MatPlotLib

	G = nx.Graph(np.matrix(matrix)) # создание матрицы из преобразованной в np.matrix

	nx.draw(G, pos=nx.circular_layout(G), node_color="#C83033", node_size=400, font_color='white', edge_color='#333', with_labels=True, arrows=False)

	dt = datetime.datetime.now() # запись уникального времени в переменную
	fileName = str(round(time.mktime(dt.timetuple())))
	plt.savefig('static/graphs/' + fileName + '.png') # сохранение изображения графа

	return fileName