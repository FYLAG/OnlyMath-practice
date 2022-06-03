import unittest, os, sys, PythonApplication1

class Test_test_isEuler(unittest.TestCase):
    def test(self):
        dirs = os.listdir("C:/Users/user1.STDM2/Desktop/PythonApplication1/tests/matrix/Симметричные")
        for file in dirs:
            print("======" + file + "======")
            filename = "C:/Users/user1.STDM2/Desktop/PythonApplication1/tests/matrix/Симметричные/" + file
            matrix = PythonApplication1.checkMatrix(PythonApplication1.Get_adjacency_matrix(filename))
            self.assertTrue(matrix)
            print(matrix)

if __name__ == '__main__':
    unittest.main()
