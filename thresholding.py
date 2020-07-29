import cv2
import numpy as np
img = cv2.imread('5hed256.bmp', 0)

ret1,th1 = cv2.threshold(img,127,255,cv2.THRESH_BINARY)

ret2,th2 = cv2.threshold(img,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)

th3 = cv2.adaptiveThreshold(img,255,cv2.ADAPTIVE_THRESH_MEAN_C,\
            cv2.THRESH_BINARY,199,5)

th4 = cv2.adaptiveThreshold(img,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,\
            cv2.THRESH_BINARY,199,5)

outpath1 = "5globlena256.bmp"
outpath2 = "5otsulena256.bmp"
outpath3 = "5meanadaptlena256.bmp"
outpath4 = "5gausadaptlena256.bmp"




cv2.imwrite(outpath1, th1)
cv2.imwrite(outpath2, th2)
cv2.imwrite(outpath3, th3)
cv2.imwrite(outpath4, th4)
