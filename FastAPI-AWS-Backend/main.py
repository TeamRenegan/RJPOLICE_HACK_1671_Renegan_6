import cv2
import boto3  # For S3 interaction
from fastapi import FastAPI
from contextlib import asynccontextmanager
import time
from moviepy.video.io.ffmpeg_tools import ffmpeg_extract_subclip
import json

# Replace with your camera's RTSP URL
rtsp_url = "rtsp://your_camera_ip_address:554/user=username_password=password_channel=channel_number_stream=0.sdp"

# Define functions for crime detection, video trimming, and report generation
def detect_crime(frame):
    # Implement your crime detection logic here
    # Return True if suspicious activity is detected, False otherwise
    ...

def trim_video(frames, start_time, end_time):
    # Implement video trimming logic here
    # Assuming frames is a list of file paths to the frames
    # We'll take the first and last frame timestamps as the start and end of the clip
    # You'll need to replace this with your actual logic for determining the start and end times
    clip_start_time = start_time
    clip_end_time = end_time

    # Assuming the video is named 'original.mp4'
    # The trimmed video will be saved as 'trimmed.mp4'
    ffmpeg_extract_subclip("original.mp4", clip_start_time, clip_end_time, targetname="trimmed.mp4")

    # Return the path to the trimmed video
    return "trimmed.mp4"
    ...

def generate_report(event_details):
    # Create a report with timestamp, video clip, and metadata
    # For simplicity, we'll just write the event details to a JSON file
    # You'll need to replace this with your actual logic for generating the report
    with open('report.json', 'w') as f:
        json.dump(event_details, f)
    ...


@asynccontextmanager
async def lifespan(app : FastAPI):
    global cap
    cap = cv2.VideoCapture(rtsp_url)
    yield
    cap.release()


app = FastAPI(lifespan=lifespan)


@app.get("/process_stream")
async def process_stream():
    frame_count = 0
    start_time = None
    frames = []

    while True:
        ret, frame = cap.read()

        if not ret:
            print("Error reading frame from stream")
            break

        frames.append(frame)
        frame_count += 1

        if frame_count % (20 * 60) == 0:  # 20-minute interval
            if start_time is not None:
                end_time = time.time()
                if not detect_crime(frames):
                    # No crime detected, delete frames
                    del frames[:]
                else:
                    # Crime detected, trim video and upload to S3
                    event_details = "Some details about the event"
                    trimmed_video = trim_video(frames, start_time, end_time)
                    s3_client = boto3.client("s3")
                    s3_client.upload_fileobj(trimmed_video, "your-bucket-name", "video_file.mp4")
                    generate_report(event_details)
            start_time = time.time()

        # Perform crime detection on each frame
        # if detect_crime(frame):
        #     # Crime detected, handle accordingly
            
        if detect_crime(frame):
            # Crime detected, handle accordingly
            # Perform crime detection on each frame
            print("Crime detected!")
            event_details = "Details about the detected crime"
            generate_report(event_details)
            ...

    return "Stream processing complete"

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)