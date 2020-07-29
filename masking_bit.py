
import cv2
import numpy as np

original_img = cv2.imread("lena512.bmp",cv2.COLOR_BGR2GRAY)
result = original_img & 0b11100000
cv2.imshow( "out", result )
cv2.imwrite("5lena512.bmp", result)
