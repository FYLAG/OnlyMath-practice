import unittest, os, sys, NodesLength
from unittest.signals import registerResult

class Test_test_NodesLength(unittest.TestCase):
   def test(self):
        answers=["Вершины с максимальным окружением на уровне 2 :0,1,2,3,","Вершины с максимальным окружением на уровне 1 :0,","Вершины с максимальным окружением на уровне 0 :0,1,2,","Вершины с максимальным окружением на уровне 3 :0,1,2,","Вершины с максимальным окружением на уровне 10 :0,1,2,3,4,5,6,7,8,9,"]
        levels=[2,1,0,3,10]
        dirs = os.listdir("static/tests/Окружение/")
        i = 0
        for file in dirs:
            filename = "static/tests/Окружение/" + file
            matrix = NodesLength.Get_adjacency_matrix(filename)
            result = NodesLength.getTestResult(matrix,levels[i])
            self.assertTrue(answers[i] == result)
            i+=1

if __name__ == '__main__':
    unittest.main()
