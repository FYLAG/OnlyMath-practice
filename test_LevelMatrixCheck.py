import unittest, os, sys, NodesLength
from unittest.signals import registerResult

class Test_test_LevelMatrixCheck(unittest.TestCase):
    def test_A(self):
        levels=[2,1,0,3,10]
        dirs = os.listdir("static/tests/Окружение/")
        i = 0
        for file in dirs:
            filename = "static/tests/Окружение/" + file
            matrix = NodesLength.Get_adjacency_matrix(filename)
            self.assertTrue(NodesLength.sizeleve(matrix,levels[i]))
            i+=1

if __name__ == '__main__':
    unittest.main()
