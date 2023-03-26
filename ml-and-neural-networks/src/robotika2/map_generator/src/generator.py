import cv2
#TODO: make a shitload of combos of it and save them seperatly. They should be a 10x10 matrix with characteristic shapes representing 
#different tools within the plant

def contour_detect(img):
    cv2.waitKey(0)
    
    # Grayscale
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    
    # Find Canny edges
    edged = cv2.Canny(gray, 30, 200)
    cv2.waitKey(0)

    contours, hierarchy = cv2.findContours(edged, 
                                          cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    
    return contours

def relevant_contour_detect(img):
    
    contours = contour_detect(img)
    relevant_contours = []

    for i in range(0, len(contours)):
        cv2.drawContours(image, contours, i, (0, 255, 0), 3)
        cv2.imshow('Contours', image)
        cv2.waitKey(0)
        prompt = input('It is a relevant contour [y/n]? \n')
        if prompt == 'y':
            relevant_contours.append(contours[i])
            print("Relevant contour is recorded.")
            continue
        elif prompt == 'n':
            print("Contour skipped...")
            continue
        else:
            continue
    cv2.destroyAllWindows()
    return relevant_contours


def resize_image(img, img_size):   
    return cv2.resize(img, (img_size))

def image_generator(relevant_contour, img):
    # TODO: from relevant contours of an object, generate new images with different positions of the object
    pass


if __name__ == '__main__':
    image = cv2.imread('test.jpg')
    relevant_contour = relevant_contour_detect(image)
    cv2.drawContours(image, relevant_contour, -1, (0, 255, 0), 3)