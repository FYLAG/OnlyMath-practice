import unittest, os, sys, method_eul

class Test_test_T_isAsymmetrical(unittest.TestCase):
    def test(self):
        dirs = os.listdir("static/tests/Асимметричные/")
        print(dirs)
        for file in dirs:
            matrix = True
            print("======" + file + "======")
            filename = "static/tests/Асимметричные/" + file
            matrix = method_eul.checkMatrix(method_eul.Get_adjacency_matrix(filename))
            print(matrix)
            if(matrix):
                print("Not ok, is true")
            self.assertFalse(matrix)

if __name__ == '__main__':
    unittest.main()