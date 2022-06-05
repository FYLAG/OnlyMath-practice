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

testikArr = [ [ 0 for x in fragment[0] ] for y in fragment ]

testikDots = [ 0 for i in fragment[0] ]

allEquals = 0

listDots = []

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

				listDots.append(testikDots.copy())

				for x in reversed(range(len(testikArr))):

					testikArr[x][x] = graph[testikDots[x]][testikDots[x]]

					for y in reversed(range(x)):

						testikArr[y][x] = graph[testikDots[y]][testikDots[x]]

				if (CheckArr(testikArr, fragment)):

					allEquals += 1

@post("/method-fragments", method="POST")
@view("method_fragments")

def BeginComputation():

	global graph, fragment, listDots, testikArr, testikDots

	listDots.clear()

	graph = allMethods.matrixReading(int(request.forms.get("matrixGraphSize")), ".G.").copy()
	fragment = allMethods.matrixReading(int(request.forms.get("matrixFragmentSize")), ".F.").copy()

	testikArr = [ [ 0 for x in fragment[0] ] for y in fragment ]
	testikDots = [ 0 for i in fragment[0] ]

	start_time = time.time()

	MainLogic(0, 0)

	print("\n --- %s seconds ---" % (time.time() - start_time))

	listDots = allMethods.transformationListDots(listDots).copy()

	return dict(
		title = "Нахождение заданного фрагмента в графе",
		imageGraph = "/static/graphs/" + "123" + ".png",
		year = datetime.now().year,
		listDots = listDots
	)