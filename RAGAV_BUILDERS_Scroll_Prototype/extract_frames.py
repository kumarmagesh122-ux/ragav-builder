#!/usr/bin/env python3
"""
RAGAV BUILDERS - Outro Video Frame Extractor
Extracts all 180 frames from ragav_builders_animated_outro_v2.mp4 at 1920x1080 (30 FPS, 6 seconds)
Saves sequentially to assets/outro-frames/frame_001.jpg through frame_180.jpg
"""

import os
import sys
import subprocess

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
ASSETS_DIR = os.path.join(SCRIPT_DIR, 'assets')
OUTRO_DIR = os.path.join(ASSETS_DIR, 'outro-frames')

CANDIDATE_VIDEOS = [
    os.path.join(ASSETS_DIR, 'ragav_builders_animated_outro_v2.mp4'),
    os.path.join(ASSETS_DIR, 'ragav_builders_animated_outro_v2(1).mp4'),
    r'C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794371653239_9d1cf532.mp4'
]

def find_source_video():
    for p in CANDIDATE_VIDEOS:
        if os.path.exists(p) and os.path.getsize(p) > 1000:
            return p
    return None

def extract_with_ffmpeg(video_path):
    print(f"[FFmpeg] Extracting 180 frames from: {video_path}")
    os.makedirs(OUTRO_DIR, exist_ok=True)
    out_pattern = os.path.join(OUTRO_DIR, 'frame_%03d.jpg')
    cmd = [
        'ffmpeg', '-y',
        '-i', video_path,
        '-vf', 'fps=30,scale=1920:1080',
        '-frames:v', '180',
        '-q:v', '2',
        out_pattern
    ]
    try:
        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if res.returncode == 0:
            print("[FFmpeg] Successfully extracted 180 frames.")
            return True
        else:
            print(f"[FFmpeg] Non-zero exit: {res.stderr.decode('utf-8', errors='ignore')[:300]}")
    except Exception as e:
        print(f"[FFmpeg] Error: {e}")
    return False

def extract_with_opencv(video_path):
    try:
        import cv2
    except ImportError:
        print("[OpenCV] cv2 not installed, skipping.")
        return False

    print(f"[OpenCV] Extracting 180 frames from: {video_path}")
    os.makedirs(OUTRO_DIR, exist_ok=True)
    cap = cv2.VideoCapture(video_path)
    if not cap.isOpened():
        print("[OpenCV] Could not open video file.")
        return False

    count = 0
    while cap.isOpened() and count < 180:
        ret, frame = cap.read()
        if not ret:
            break
        count += 1
        # Ensure 1920x1080
        if frame.shape[1] != 1920 or frame.shape[0] != 1080:
            frame = cv2.resize(frame, (1920, 1080), interpolation=cv2.INTER_LANCZOS4)
        out_path = os.path.join(OUTRO_DIR, f'frame_{count:03d}.jpg')
        cv2.imwrite(out_path, frame, [int(cv2.IMWRITE_JPEG_QUALITY), 94])

    cap.release()
    print(f"[OpenCV] Successfully extracted {count} frames.")
    return count >= 170

def main():
    video_path = find_source_video()
    if not video_path:
        print("ERROR: Outro video not found in candidate paths.")
        sys.exit(1)

    print(f"Target Outro Video: {video_path}")
    os.makedirs(OUTRO_DIR, exist_ok=True)

    # Check if already extracted
    frame_180 = os.path.join(OUTRO_DIR, 'frame_180.jpg')
    if os.path.exists(frame_180) and os.path.getsize(frame_180) > 1000:
        print("All 180 frames are already extracted in assets/outro-frames/.")
        return

    # Try FFmpeg first, then OpenCV
    if not extract_with_ffmpeg(video_path):
        if not extract_with_opencv(video_path):
            print("WARNING: Neither ffmpeg nor cv2 succeeded. Browser in-memory frame extractor will serve frames dynamically.")

if __name__ == '__main__':
    main()

