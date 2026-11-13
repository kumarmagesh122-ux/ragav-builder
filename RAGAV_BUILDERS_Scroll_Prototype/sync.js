const fs = require('fs');
const path = require('path');

const candidates = [
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\.user_uploaded\\media_1794384039966_d25b81ad.png',
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\.user_uploaded\\media_1794379107734_787def9f.png',
  path.join(__dirname, '..', 'Ragav Builders Chrome Logo(2).png'),
  path.join(__dirname, '..', 'Ragav Builders Chrome Logo(1).png'),
  path.join(__dirname, '..', 'Ragav Builders Chrome Logo.png'),
  path.join(__dirname, 'Ragav Builders Chrome Logo(2).png'),
  path.join(__dirname, 'Ragav Builders Chrome Logo(1).png'),
  path.join(__dirname, 'assets', 'ragav-builders-chrome-logo.png')
];

let logoSource = candidates.find(p => fs.existsSync(p));

if (logoSource) {
  const destDirs = [
    path.join(__dirname, 'assets'),
    path.join(__dirname, 'images'),
    path.join(__dirname, 'public', 'images')
  ];

  destDirs.forEach(dir => {
    if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
  });

  const targetFiles = [
    path.join(__dirname, 'assets', 'ragav-builders-chrome-logo.png'),
    path.join(__dirname, 'assets', 'ragav-builders-logo.png'),
    path.join(__dirname, 'assets', 'ragav-builders-transparent-logo.png'),
    path.join(__dirname, 'assets', 'logo.png'),
    path.join(__dirname, 'assets', 'ragav-builders-logo.jpg'),
    path.join(__dirname, 'assets', 'logo.jpg'),
    path.join(__dirname, 'images', 'ragav-builders-logo.png'),
    path.join(__dirname, 'images', 'ragav-builders-chrome-logo.png'),
    path.join(__dirname, 'public', 'images', 'ragav-builders-logo.png'),
    path.join(__dirname, 'public', 'images', 'ragav-builders-chrome-logo.png')
  ];

  targetFiles.forEach(target => {
    try {
      fs.copyFileSync(logoSource, target);
      console.log('Synchronized logo to:', target);
    } catch (e) {
      console.error('Failed to copy to', target, e.message);
    }
  });
} else {
  console.log('Logo source not found among candidates.');
}

// Synchronize footer architectural villa watermark (Clean pristine architectural photograph)
const villaCandidates = [
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\footer_villa_clean_1794563024775.jpg',
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\.user_uploaded\\media_1794559304869_abbc5f0b.jpg',
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\.user_uploaded\\media_1794556977284_8a004f35.jpg',
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\.user_uploaded\\media_1794378533979_7dfa59c4.jpg',
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\.user_uploaded\\media_1794387559795_85944f50.jpg',
  'C:\\Users\\mages\\.gemini\\antigravity\\brain\\0542399e-1da1-43ac-819f-3d80acdc46d3\\.user_uploaded\\media_1794386961128_b723ab48.jpg',
  path.join(__dirname, 'assets', 'footer-villa-clean.jpg'),
  path.join(__dirname, 'assets', 'footer-villa-bg.jpg')
];

let villaSource = villaCandidates.find(p => fs.existsSync(p));
if (villaSource) {
  const villaTargets = [
    path.join(__dirname, 'assets', 'footer-villa-clean.jpg'),
    path.join(__dirname, 'assets', 'footer-villa-bg.jpg'),
    path.join(__dirname, 'assets', 'footer-reference.jpg'),
    path.join(__dirname, 'images', 'footer-villa-clean.jpg'),
    path.join(__dirname, 'images', 'footer-villa-bg.jpg'),
    path.join(__dirname, 'images', 'footer-reference.jpg'),
    path.join(__dirname, 'public', 'images', 'footer-villa-clean.jpg'),
    path.join(__dirname, 'public', 'images', 'footer-villa-bg.jpg'),
    path.join(__dirname, 'public', 'images', 'footer-reference.jpg')
  ];
  villaTargets.forEach(t => {
    try {
      fs.copyFileSync(villaSource, t);
      console.log('Synchronized villa watermark to:', t);
    } catch(e) {}
  });
}

