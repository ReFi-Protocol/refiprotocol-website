'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1e84a35ca88a96fe39577758b4200bb7",
"assets/AssetManifest.json": "0bdca7ac292476b883cdedc6d6747338",
"assets/assets/images/about_detail.png": "9dcf72eec651403c2bc7d101e9f2a1b1",
"assets/assets/images/about_explore.jpeg": "f322ea2ebd8bef0d9b994372a4e4c7ab",
"assets/assets/images/about_frame_d.png": "cd8740c9ab31d475762206ea34faf80a",
"assets/assets/images/about_frame_m.png": "839c3d3ca1ce8ddc7900ea8406a7e142",
"assets/assets/images/appbar_logo.png": "41597ef994d62adcf44970258af65862",
"assets/assets/images/bg_contact_frame.png": "f2306b24042e5c10b79b989e6dd562d2",
"assets/assets/images/bg_landing_frame.png": "31e79d9c57120f37f2e30e76a90fa719",
"assets/assets/images/bg_transparency_frame.png": "b46c0963d7cd8d76132c28f5037da5a1",
"assets/assets/images/bg_transparency_frame_mobile.png": "bed7536d775e673f2ffdebeb3d77cf13",
"assets/assets/images/blogs_intro-1.png": "09c3db29159c2b2cc19074fe311051ca",
"assets/assets/images/blogs_intro-2.png": "d14b3f376d34b923004b638b7b4c4636",
"assets/assets/images/blogs_intro-3.png": "63adaaf702fe22c803f2cdb892ae8f92",
"assets/assets/images/blogs_intro-4.png": "480cfb06c7582e4a7b82cfdefba396d7",
"assets/assets/images/blogs_intro-5.png": "a6919bf7955bf6e915febd50fae886ac",
"assets/assets/images/blogs_intro-6.png": "e8cfbdb2849914c8012314d84623edfd",
"assets/assets/images/blogs_intro-7.png": "4529aea2538a6986ee0e832a3c7b4bfe",
"assets/assets/images/blogs_intro-8.png": "2b43407f4bbe8cbf0605a7d69c8563b1",
"assets/assets/images/bytebison.png": "daaacfffe96babf40b6bb63d70a379e8",
"assets/assets/images/contact1.png": "322ef1291cebc6880881e522949b86f9",
"assets/assets/images/contact2.png": "108291f36ac22395de29497b25ba93bd",
"assets/assets/images/contact3.png": "83c46babf592ecd5799b1e9d4b39fc11",
"assets/assets/images/detail.png": "a09268a463ca585a08255062658bda2c",
"assets/assets/images/detail_1.png": "efb6513d38e10776a428fcb9ebb47cbc",
"assets/assets/images/detail_2.png": "07de61fafd9cca20499be0757452aa9f",
"assets/assets/images/detail_3.png": "ee24c34ab1a191396a05d32d3cea3c88",
"assets/assets/images/detail_4.png": "51172a11d00c9e41422ee6c6ccb1de45",
"assets/assets/images/falcon.jpeg": "3a297885871b20bdefd4b9a07904db2c",
"assets/assets/images/gradients.png": "2eba13b42f9aa0dca61a2c2aaa34281f",
"assets/assets/images/hero_bg.png": "cec76c91528346873f6994cd0944d792",
"assets/assets/images/hero_section.png": "9e2e87f5db9d0781b5d690edb1eaa67e",
"assets/assets/images/logo.png": "1158d38e61dc2a14e373854c1c10d992",
"assets/assets/images/mission_bg.png": "e4430d4e6ec48724f68536a482f9aae3",
"assets/assets/images/mission_frame_d.png": "f7d1dacbbd216a0054dfb3247ec663b8",
"assets/assets/images/mission_frame_m.png": "7d2f632687ab6c3184170a02766b7b8b",
"assets/assets/images/roadmap.png": "f463169055064729438b8fe5a8661a1a",
"assets/assets/images/roadmap_mobile.png": "8ffaf56febd8d2fa57e7963cb8e529f5",
"assets/assets/images/tab_1.png": "1baf7438cb9e5b9c41d5983b58218cfc",
"assets/assets/images/tab_2.png": "84b83cb3c1982ac3231d40d93e5d375b",
"assets/assets/images/tab_3.png": "c9af43a8af325d006930d9b573575393",
"assets/assets/images/tim.jpeg": "3fa510d8475100276bbc57a72ebd39e8",
"assets/assets/images/tuv_sud.png": "7de6365b56b926c2eac1ededd77f844d",
"assets/assets/images/vision_bg.png": "57f058d68ad20d026787c31feae5a5c8",
"assets/assets/images/vision_frame_d.png": "68ee2f20b07fb0ab0c3451afed9e884e",
"assets/assets/images/vision_frame_m.png": "f6afcf84e9eb1b1a9f4f76adb6b83f0e",
"assets/assets/images/wave_line.png": "833b1ad36ce2b3319c3a62706921f839",
"assets/assets/videos/hero_section.mov": "b161e0379c3e109873b4259b1d9765b3",
"assets/assets/videos/hero_section_mobile.mov": "069bf406b2aab0bdd681692c8d76822a",
"assets/assets/videos/windturbine.mp4": "363bb84084f7bb895987d6d61b7f6ff2",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "15a50f0f740cb1f605974534d5131075",
"assets/NOTICES": "fd489c54838053a073c004ae784cf0d6",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "5260d724639ba17c953743d2963faef8",
"/": "5260d724639ba17c953743d2963faef8",
"main.dart.js": "090636328b3ff11174c76278a827ec34",
"manifest.json": "c69129ef06c873c976bbbb50c3e71433",
"version.json": "e8967861b989b55fe85ff06ed02847d8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
