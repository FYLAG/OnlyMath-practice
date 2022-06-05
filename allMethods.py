import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
from bottle import post, request
import io, os, re, pdb, app
from random import randint

def checkSymmetryMatrix(matrix):

	for y in range(len(matrix)):

		for x in range(y + 1): # проверяем элементы находящиеся после диагонали

			if (matrix[y][x] != matrix[x][y]):

				return False

	return True

def transformationListDots(listDots):

	for i in range(len(listDots)):

		listDots[i] = ' - '.join(map(str,listDots[i]))

	return listDots

def matrixReading(sizeMatrix, nameMatrix): # функция для автособирания матрицы со стараницы метода

	finishMatrix = [ [ 0 for x in range(sizeMatrix) ] for y in range(sizeMatrix) ]

	for y in range(sizeMatrix):

		for x in range(sizeMatrix):

			finishMatrix[y][x] = int(request.forms.get(str(y + 1) + nameMatrix + str(x + 1)))

	return finishMatrix