import unittest, os, sys, PythonApplication1

class Test_test_T_isAsymmetrical(unittest.TestCase):
    def test(self):
        dirs = os.listdir("C:/Users/user1.STDM2/Desktop/PythonApplication1/tests/matrix/Асимметричные")
        print(dirs)
        for file in dirs:
            matrix = True
            print("======" + file + "======")
            filename = "C:/Users/user1.STDM2/Desktop/PythonApplication1/tests/matrix/Асимметричные/" + file
            matrix = PythonApplication1.checkMatrix(PythonApplication1.Get_adjacency_matrix(filename))
            print(matrix)
            if(matrix):
                print("Not ok, is true")
            self.assertFalse(matrix)

if __name__ == '__main__':
    unittest.main()