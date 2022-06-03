import unittest, os, sys, method_eul
from unittest.signals import registerResult

class Test_test_isEuler(unittest.TestCase):
    def test(self):
        answers=["Граф не содержит эйлеров цикл. \n1 -> 0 -> 2 -> путь",
                     "Граф не содержит эйлеров цикл. \nГраф не содержит эйлеров путь.",
                     "Граф не содержит эйлеров цикл. \nГраф не содержит эйлеров путь.",
                     "Граф не содержит эйлеров цикл. \n0 -> 1 -> 2 -> 0 -> 4 -> 2 -> 3 -> 4 -> 4 -> путь",
                     "0 => 4 => 3 => 2 => 4 => 1 => 3 => 0 => 2 => 1 => 0 => цикл; \n0 -> 1 -> 2 -> 0 -> 3 -> 1 -> 4 -> 2 -> 3 -> 4 -> 0 -> путь",
                     "0 => 4 => 3 => 2 => 4 => 1 => 3 => 0 => 2 => 1 => 0 => цикл; \n0 -> 1 -> 2 -> 0 -> 3 -> 1 -> 4 -> 2 -> 3 -> 4 -> 0 -> путь"]
        dirs = os.listdir("static/tests/Эйлеровые/")
        #print(dirs)
        i = 0
        for file in dirs:
            print("======" + file + "======")
            filename = "static/tests/Эйлеровые/" + file
            matrix = method_eul.Get_adjacency_matrix(filename)
            #print(matrix)
            result = method_eul.method_test(matrix)
            #print(result)
            print(answers[i])
            self.assertTrue(answers[i] == result)
            i+=1

if __name__ == '__main__':
    unittest.main()
