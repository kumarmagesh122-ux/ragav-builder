/**
 * RAGAV BUILDERS - Outro Video Frame Extractor (Node.js)
 * Extracts all 180 frames from ragav_builders_animated_outro_v2.mp4 at 1920x1080 (30 FPS, 6 seconds)
 * Saves sequentially to assets/outro-frames/frame_001.jpg through frame_180.jpg
 */

const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');

const SCRIPT_DIR = __dirname;
const ASSETS_DIR = path.join(SCRIPT_DIR, 'assets');
const OUTRO_DIR = path.join(ASSETS_DIR, 'outro-frames');

const CANDIDATE_VIDEOS = [
  path.join(ASSETS_DIR, 'ragav_builders_animated_outro_v2.mp4'),
  path.join(ASSETS_DIR, 'ragav_builders_animated_outro_v2(1).mp4'),
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\.user_uploaded\\media_1794371653239_9d1cf532.mp4'
];

function findSourceVideo() {
  for (const p of CANDIDATE_VIDEOS) {
    if (fs.existsSync(p) && fs.statSync(p).size > 1000) {
      return p;
    }
  }
  return null;
}

function main() {
  const videoPath = findSourceVideo();
  if (!videoPath) {
    console.error('ERROR: Outro video not found.');
    process.exit(1);
  }

  if (!fs.existsSync(OUTRO_DIR)) {
    fs.mkdirSync(OUTRO_DIR, { recursive: true });
  }

  const frame180 = path.join(OUTRO_DIR, 'frame_180.jpg');
  if (fs.existsSync(frame180) && fs.statSync(frame180).size > 1000) {
    console.log('All 180 frames already present in assets/outro-frames/.');
    return;
  }

  console.log(`Extracting 180 frames via ffmpeg from: ${videoPath}`);
  const outPattern = path.join(OUTRO_DIR, 'frame_%03d.jpg');
  const res = spawnSync('ffmpeg', [
    '-y',
    '-i', videoPath,
    '-vf', 'fps=30,scale=1920:1080',
    '-frames:v', '180',
    '-q:v', '2',
    outPattern
  ], { stdio: 'inherit' });

  if (res.status === 0) {
    console.log('Successfully extracted 180 frames.');
  } else {
    console.warn('ffmpeg extraction failed or ffmpeg not in PATH. Browser in-memory decoder will serve frames.');
  }
}

main();

