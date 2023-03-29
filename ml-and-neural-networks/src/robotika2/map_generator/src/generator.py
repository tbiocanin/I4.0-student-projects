import cv2, os, pickle
import random 
from os.path import exists
from PIL import Image

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

    if exists('relevan_contours.pkl'):
        with open('relevan_contours.pkl', 'rb') as file:
            relevant_contours = pickle.load(file)
            return relevant_contours
    else:
        print("Relevant contours do not exits, need to generate new ones... \n")

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

    with open('relevan_contours.pkl', 'wb') as file:
        pickle.dump(relevant_contours, file) #save it for later use, so that the extraction does not need to run again

    return relevant_contours

def resize_image(img, img_size):   
    return cv2.resize(img, img_size, interpolation=cv2.INTER_AREA)

def image_translation(contour):
    # TODO: contour translation
    pass

def image_rotation(contour):
    #TODO: contour rotation
    pass

def image_generator(relevant_contour, no_imgs, no_objects):
    new_img = cv2.imread('blank.jpg')
    #getting all contours from the second item since the border needs to be a constant in all images 
    new_contour = relevant_contour[1:]
    contour_to_be_used = []
    contour_to_be_used.append(relevant_contour[0]) #uzmi okvir koji mora da bude konstanta u svakoj slici
    #fill in the choices of relevant conoturs to be used for the generated imgs
    #with the random selected contours, save new images in the folder new imgs
    for i in range(1, no_imgs):
        for _ in range(1, no_objects): #for every new image, take new random contours
            contour_to_be_used.append(random.choice(new_contour))
        cv2.drawContours(new_img, contour_to_be_used, -1, (0, 0, 0), 3)
        cv2.imwrite('new_imgs/map_' + str(i) + '.jpg', new_img)
        rescaled_img = resize_image(new_img, (100, 100))
        recovered_img = recover_object_info(rescaled_img)
        cv2.imwrite('resized_imgs/map_resized_' + str(i) + '.jpg', recovered_img)
    
    #check if imgs are listed in the given directory
    if len(os.listdir('new_imgs/')) and len(os.listdir('resized_imgs/')) == 0:
        return False
    else:
        return True #ako se funkcija uspesno izvrsi do kraja i naprave se nove slike

def recover_object_info(img):
    
    # width, height = img.size

    for i in range(img.shape[0]):
        for j in range(img.shape[1]):
            if (img[i, j] != 255).all():
                img[i, j] = 0
            else:
                continue
    
    return img

if __name__ == '__main__':
    image = cv2.imread('test.jpg')
    relevant_contour = relevant_contour_detect(image)

    flag_when_created = image_generator(relevant_contour, 5, 5)
    print(flag_when_created)