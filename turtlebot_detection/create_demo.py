import time
import random

import numpy as np
import cv2
import torch

from utils.plots import plot_one_box
from models.experimental import attempt_load
from utils.general import  check_img_size, non_max_suppression, scale_coords
from utils.torch_utils import select_device


img_size = 640
device = select_device("")
model = attempt_load('turtlebot_detector.pt', map_location=device).to(device=device)  # load FP32 model
# model = TracedModel(model, device, img_size)
model.eval()
stride = int(model.stride.max())  # model stride
imgsz = check_img_size(img_size, s=stride)  # check img_size
shapes = [imgsz, imgsz]  # (width, height) of webcam stream
cap = cv2.VideoCapture("vid_for_demo.mp4")  # open webcam
result = cv2.VideoWriter('turtlebot_detector_demo.avi', 
                         cv2.VideoWriter_fourcc(*'MJPG'),
                         30, (img_size, img_size))

# if device.type != 'cpu':
#         model(torch.zeros(1, 3, imgsz, imgsz).to(device).type_as(next(model.parameters())))
names = model.module.names if hasattr(model, 'module') else model.names
colors = [[random.randint(0, 255) for _ in range(3)] for _ in names]

with torch.no_grad():
    while True:
        _, img0 = cap.read() # get img from webcam stream
        img0 = cv2.resize(img0, shapes) # resize to shapes
        img = cv2.cvtColor(img0, cv2.COLOR_BGR2RGB) # BGR to RGB
        img_tensor = torch.from_numpy(img).to(device)
        img_tensor = img_tensor.float()  # uint8 to fp16/32
        img_tensor /= 255.0  # 0 - 255 to 0.0 - 1.0
        if img_tensor.ndimension() == 3:
            img_tensor = img_tensor.unsqueeze(0)
        img_tensor = img_tensor.permute(0, 3, 1, 2)
        start_time = time.time()
        out = model(img_tensor, augment=False)[0] # inference
        out = non_max_suppression(out, 0.8, 0.6, classes=None, agnostic=False)  # apply NMS
        # print(f'FPS: {1/(time.time() - start_time)}')
        for pred in out:
            if pred is not None and len(pred):
                # Rescale boxes from img_size to im0 size
                pred[:, :4] = scale_coords(img_tensor.shape[2:], pred[:, :4], img0.shape).round()

                for *xyxy, conf, cls in reversed(pred):
                    label = f'{names[int(cls)]} {conf:.2f}'
                    plot_one_box(xyxy, img0, label=label, color=colors[int(cls)], line_thickness=3)
            del pred
        # cv2.imshow('img', img0)
        result.write(img0)
        if cv2.waitKey(1) == ord('q'):
            break
        del img_tensor
        del out
        torch.cuda.empty_cache()
                