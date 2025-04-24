'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a8697d4db9cfe9a43e483ff5d8ca2c4d",
"assets/AssetManifest.bin.json": "d2043c05a80c467818ec371375e68695",
"assets/AssetManifest.json": "5364b804b3796ab2a56afe09067503dc",
"assets/assets/j1.jpg": "6428431016f5cd5c9d5e6e649c31406d",
"assets/assets/j10.jpeg": "47c5bd69fc6606ee91940cfedaec6fec",
"assets/assets/j11.jpeg": "cc3ec8b5a661fef58a677a6fa098966e",
"assets/assets/j12.jpeg": "9b58ab2af999d71f0849bd0a2d41fa1d",
"assets/assets/j13.jpeg": "5053962e3c9ca14db64fa3ae5a5d2d1a",
"assets/assets/j14.png": "5913521793adc7ef75736a36c911c272",
"assets/assets/j15.png": "77dad25cbdc8b60311710979b846d4dd",
"assets/assets/j16.png": "9b1e6e5cf224adb2be4827c79c0008c6",
"assets/assets/j17.jpg": "367ea5cd5b98c2aaaa2fad23eadda471",
"assets/assets/j18.jpeg": "5daefc2cc08b2cdfe7c8bde91150955c",
"assets/assets/j19.jpeg": "914ec5b8b5efd16665723c339cdb22d9",
"assets/assets/j2.jpeg": "a8d0b326276e633789155ff732f2d3b3",
"assets/assets/j20.jpeg": "62e984269f1e1ca21a4d6efc567c76c6",
"assets/assets/j21.jpeg": "ab6a0af111074fc07a6571fbfcd5fd76",
"assets/assets/j22.jpeg": "e3d44826f6f637e51bb19fa90d85a8f3",
"assets/assets/j23.jpeg": "a6533f0457796d5a528bb8264d7ad804",
"assets/assets/j24.jpeg": "60efa3aab9be4fd370eca93b4b1b58bd",
"assets/assets/j25.jpeg": "cc4158944a1c302d9964708672c75671",
"assets/assets/j26.jpeg": "4e38989dca50fc0aa84833400c6d215d",
"assets/assets/j27.jpeg": "db85b33d357b29430605f41c9413bfef",
"assets/assets/j28.jpeg": "c6dde723e67025ba05a74b0a7ce4d311",
"assets/assets/j3.jpeg": "5053962e3c9ca14db64fa3ae5a5d2d1a",
"assets/assets/j4.jpeg": "e7b1e4ff3b97cdfa1b80ea402ef4f388",
"assets/assets/j5.jpeg": "9d9ae265b4afb953c6a22319333ed088",
"assets/assets/j6.jpeg": "104d46c590d1aa1cf204c9dd9f52efba",
"assets/assets/j8.jpeg": "68d4568aaee895da42de24db105806a4",
"assets/assets/j9.jpeg": "076bfb0a14422752d01e27fca57bb53a",
"assets/assets/jewel2.png": "ddb1d346f89edca82b3badb7d183d4b2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "b4c9f9b8d7f0ea98d134bfd515299826",
"assets/NOTICES": "a09c9b2a4d4cfd699c4e9bc8af574fba",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "e858f0b60e2268e86914d5a64a0e5c4d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "8f8ffebb039a733c7a96332754d95bf7",
"/": "8f8ffebb039a733c7a96332754d95bf7",
"main.dart.js": "552316a9885f15d0ae7ec8a7ab3db5f1",
"manifest.json": "f1656743d6a5a81340bc396f41b84e53",
"version.json": "6148e869d26a52061b709a7b4d55aa28"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
