import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import io, os, time, re, pdb, app, routes, allMethods
from bottle import post, view, request
from datetime import datetime
from random import randint

graph = [
	[0, 1, 1, 1, 1],
	[1, 0, 1, 1, 1],
	[1, 1, 0, 1, 1],
	[1, 1, 1, 0, 1],
	[1, 1, 1, 1, 0]
]

fragment = [
	[0, 1, 1],
	[1, 0, 1],
	[1, 1, 0]
]

testikArr = [ [ 0 ] ]

testikDots = [ 0 ]

allEquals = 0

listDots = []

def CheckArr__transposition(arr): # меняет точки внутри списка и проверяет с фрагментом

	arrBig = [ 0 for i in arr]

	for i in range(len(arr)):

		arrBig[i] = arr[i].copy()

	arrBig.append([ 0 for i in range(len(arr[0]))])

	arrBig[len(arr)] = arrBig[0]

	arrBig.pop(0)

	for y in range(len(arrBig)):

		arrBig[y].append(arrBig[y][0])

	for y in range(len(arrBig)):

		del arrBig[y][0]

	return arrBig

def CheckArr__counter(arrFull, arrFragment, y, x, n):

	if (arrFragment[y][x] == 1):

		if (arrFull[y][x] == 1):

			n += 1

	else:

		n += 1

	return n

def CheckArr(arrFull, arrFragment):

	n = 0

	for x in reversed(range(len(arrFull))):

		n = CheckArr__counter(arrFull, arrFragment, x, x, n)

		for y in reversed(range(x)):

			n = CheckArr__counter(arrFull, arrFragment, y, x, n)

	for i in reversed(range(len(arrFull))):

		n -= (i + 1)

	if (n == 0):

		return True

	return False

def MainLogic(dot, begin):

	global allEquals

	for i in range(max(dot, begin), len(graph[0]) + dot + 1 - len(fragment[0])):

		print('\t' * dot + str(dot) + ' - ' + str(i))

		testikDots[dot] = i

		if (dot < len(fragment[0]) - 1): # ограничение для рекурсии

			MainLogic(dot + 1, i + 1)

		else:

			for x in reversed(range(len(testikArr))):

				testikArr[x][x] = graph[testikDots[x]][testikDots[x]]

				for y in reversed(range(x)):

					testikArr[y][x] = graph[testikDots[y]][testikDots[x]]

			if (CheckArr(testikArr, fragment)):

				listDots.append(testikDots.copy())

				allEquals += 1

def WriteFile(graphArr, fragmentArr, listDotsArr):

	with open('history/hystoryMethodFragments.txt', 'r') as file:

		dataFile = file.read()

	with open('history/hystoryMethodFragments.txt', 'w') as file:
		
		file.write("\n ========== " + str(datetime.now()) + " ========== \n" + 
			 "\n Матрица графа: \n")

		for i in graphArr:
			file.write(" " + str(i) + "\n")

		file.write("\n Матрица фрагмента: \n")

		for i in fragmentArr:
			file.write(" " + str(i) + "\n")

		file.write("\n Точки совпадений: \n")

		for i in range(len(listDotsArr)):

			if ((i + 1) % 2 == 0):

				file.write("  |  " + listDotsArr[i] + "\n")

			else:

				file.write(" " + listDotsArr[i])

		file.write(dataFile)

pathGraph = "imageGraph"
pathFragment = "imageFragment"

@post("/method-fragments", method="POST")
@view("method_fragments")

def BeginComputation():

	global graph, fragment, listDots, testikArr, testikDots

	listDots.clear()

	graph = allMethods.matrixReading(int(request.forms.get("matrixGraphSize")), ".G.").copy()
	fragment = allMethods.matrixReading(int(request.forms.get("matrixFragmentSize")), ".F.").copy()

	allMethods.matrixPicture(graph, pathGraph)
	allMethods.matrixPicture(fragment, pathFragment)

	testikArr = [ [ 0 for x in fragment[0] ] for y in fragment ]
	testikDots = [ 0 for i in fragment[0] ]

	start_time = time.time()

	graphTestik = [ 0 for i in graph ]

	MainLogic(0, 0)

	print("\n --- %s seconds ---" % (time.time() - start_time))

	listDots = allMethods.transformationListDots(listDots).copy()

	WriteFile(graph, fragment, listDots)

	return dict(
		title = "Нахождение заданного фрагмента в графе",
		imageGraph = "/static/graphs/" + pathGraph + ".png",
		imageFragment = "/static/graphs/" + pathFragment + ".png",
		graphMatrix = graph,
		fragmentMatrix = fragment,
		year = datetime.now().year,
		listDots = listDots,
		allEquals = allEquals
	)