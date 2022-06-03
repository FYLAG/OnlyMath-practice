import unittest, os, sys, NodesLength
from unittest.signals import registerResult

class Test_test_LevelMatrixCheckFalse(unittest.TestCase):
     def test_A(self):
        levels=[20,10,300,50,70]
        dirs = os.listdir("static/tests/Окружение/")
        i = 0
        for file in dirs:
            filename = "static/tests/Окружение/" + file
            matrix = NodesLength.Get_adjacency_matrix(filename)
            self.assertFalse(NodesLength.sizeleve(matrix,levels[i]))
            i+=1

if __name__ == '__main__':
    unittest.main()
