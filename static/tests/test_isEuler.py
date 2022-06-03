import unittest, os, sys

class Test_test_isEuler(unittest.TestCase):
    def test(self):
        dirs = os.listdir("static/tests/Эйлеровые/")
        for file in dirs:
            print("======" + file + "======")
            filename = "static/tests/Симметричные/" + file
            matrix = method_eul.checkMatrix(method_eul.Get_adjacency_matrix(filename))
            self.assertTrue(matrix)
            print(matrix)

if __name__ == '__main__':
    unittest.main()
