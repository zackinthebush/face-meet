from _socket import gethostname
from keras.models import load_model
from time import sleep
from keras.preprocessing.image import img_to_array
from keras.preprocessing import image
import cv2
import numpy as np
from vidstream import *
import tkinter as tk
import socket
import threading
local_ip = socket.gethostbyname(gethostname())
server = StreamingServer(local_ip, 9999)
reciver =AudioReceiver(local_ip, 8888)

def start_listening():
    t1 = threading.Thread(target=server.start_server)
    t2 = threading.Thread(target=reciver.start_server)
    t1.start()
    t2.start()
def start_caamera():
    camera_client = CameraClient(text_target_ip.get(1.0, 'end-1c'), 7777)
    t3 = threading.Thread(target=camera_client.start_stream)
    t3.start()
def screen_share():
    screen_client = ScreenShareClient(text_target_ip.get(1.0, 'end-1c'), 7777)
    t4 = threading.Thread(target=screen_client.start_stream)
    t4.start()

def audio_stream():
        audio_sender = AudioSender(text_target_ip.get(1.0, 'end-1c'), 6666)
        t5 = threading.Thread(target=audio_sender.start_stream)
        t5.start()

def emotion_detection():
    face_classifier = cv2.CascadeClassifier(r'haarcascade_frontalface_default.xml')
    classifier = load_model(r'model.h5')

    emotion_labels = ['Angry', 'Disgust', 'Fear', 'Happy', 'Neutral', 'Sad', 'Surprise']

    cap = cv2.VideoCapture(0)

    while True:
        _, frame = cap.read()
        labels = []
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        faces = face_classifier.detectMultiScale(gray)

        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 255), 0)
            roi_gray = gray[y:y + h, x:x + w]
            roi_gray = cv2.resize(roi_gray, (48, 48), interpolation=cv2.INTER_AREA)

            if np.sum([roi_gray]) != 0:
                roi = roi_gray.astype('float') / 255.0
                roi = img_to_array(roi)
                roi = np.expand_dims(roi, axis=0)

                prediction = classifier.predict(roi)[0]
                label = emotion_labels[prediction.argmax()]
                label_position = (x, y)
                cv2.putText(frame, label, label_position, cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
            else:
                cv2.putText(frame, 'No Faces', (30, 80), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
        cv2.imshow('facemeet', frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

window = tk.Tk()
window.title("FeceMeet 1.0")
window.geometry("200x300")
label_target_ip = tk.Label(window, text="target ip is :")
label_target_ip.pack()
text_target_ip = tk.Text(window, height=1)
text_target_ip.pack()

btn_listen = tk.Button(window, text="start listening", width=50, command=start_listening)
btn_listen.pack(anchor=tk.CENTER, expand=True)

btn_camera= tk.Button(window, text="start camera", width=50, command=start_caamera)
btn_camera.pack(anchor=tk.CENTER, expand=True)

btn_screen = tk.Button(window, text="start screen sharing", width=50, command=screen_share)
btn_screen.pack(anchor=tk.CENTER, expand=True)

btn_audio = tk.Button(window, text="start audio stram", width=50, command=audio_stream)
btn_audio.pack(anchor=tk.CENTER, expand=True)

btn_emotion = tk.Button(window, text="start emotion detection", width=50, command=emotion_detection)
btn_emotion.pack(anchor=tk.CENTER, expand=True)
window.mainloop()
