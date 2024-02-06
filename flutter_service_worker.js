'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "9f9cbb400ca9e5d449968d9b44c421d2",
"index.html": "66ae8ec22847c005ec356dd03be2eb79",
"/": "66ae8ec22847c005ec356dd03be2eb79",
"main.dart.js": "7dfaff947b46f3e63a7575926d02a752",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "88d5a340f32c26313f598a8f2aed6b0e",
".git/ORIG_HEAD": "0105b09f89876db14d4288ef2691357d",
".git/config": "b1b00ce9ee0bddf240d166ed8c4ceb9c",
".git/objects/92/85331b282eacf0f039a6c04062eb0f1bb123db": "55ee41a8cd230f377bacd28689dc8a7c",
".git/objects/9b/df000cb42d0aed6dd0d7b6515e6613b2af9b8d": "badedaea2713c74a09eb1ffeb2071e09",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "978222f47488835b92838c74cb5c684c",
".git/objects/32/c9f5cf9309ee6fda56b692b8f9c1dbcdd8b7e4": "120186ba38ce53762a5b0b70dcf55e4c",
".git/objects/3c/c62b9054decc146f1af1225de85b490f9df86b": "13d5e551b6c4952f3b4ef5fa428d5403",
".git/objects/94/b52e13bf7919ae4ea7235d78019b592dde8611": "b79fa5ca1cdbf72f253763797850f314",
".git/objects/94/0d14ab1184aed1bbbec04a55ca72bbc077c4b8": "d8d5952db46c3fee6e52d7abf41436c8",
".git/objects/0e/e3590f4d74c3a4e4621a8d048d01f13436ec7a": "25939fd9f3cb53628d90cf3f4f9a026a",
".git/objects/5a/de3f5bfe818c713988ac527fd09661b9750922": "2197696b93dd2a2214af2cdde1bdbfec",
".git/objects/5a/22a92ed3e2794e0e1f51b74de9a5cf23de8dc5": "7c08b9a38516f921965b651c03cb05e9",
".git/objects/9d/23739fa329afecae8cccbba98f713f8418c883": "1e64e907fe86068134babffc110f0bbb",
".git/objects/9d/9fa370d538fdebc7659059665650e4a6fb6190": "0e8074a4ee70597b0b54ee63dceac6d8",
".git/objects/a4/21153e5b6a29395e5faadb693dac86b8d5582b": "57f9d567d927699379869e2490790002",
".git/objects/bb/3085876799532613a08c7ebe43f24f0cc46864": "1b6aa21800d948d5513c15e54d131215",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "d7280a766a5d6033f187d874a92b5ad6",
".git/objects/d7/d43746ee7b96a3430ab861073d5b0c29fe1ba9": "63c4c241d0d1a640eadd5e8f090144ac",
".git/objects/df/7d2dcb89ab89da87467c0e1059b38c8d8f9296": "a44162ff357b024e4638ab18a9bb01c7",
".git/objects/a2/c409841d50cd22e6a82105625650cced8811bc": "4a56daa1ca795b6716afba5c5d760bf6",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/f3/54657977b1ea229ada108b62183327dd704500": "487a852cd8f7c258b2a08d2edd361976",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/fd/342c4dc7c38a7df986d9ccdae35e0bb4c6d8a4": "649a3acd31acf7e04af6d08214474ab4",
".git/objects/e4/886df3498f367327e5bdb9a1185e84cb54efa5": "e849bd1621221c4082dd8325fbdfff6b",
".git/objects/fe/ccf9483f59e2e97553e6f4573a96eeb39816b3": "29478540cb05120bd8cc20c32d71db5e",
".git/objects/c8/5a045950ef8e41738c1e8e2c62b551222a75a4": "6bec05d0edab4b763f3dbf81318d2ce4",
".git/objects/fb/7d12abb3698e5358106f3285ec711950d77df1": "63c2eee20f06399b15b43d54eba23c6a",
".git/objects/ed/99339c7e7f8f6bd61a73c942e0772860a1e506": "d27788ecdca6d03e3cfc9e17e6e2e114",
".git/objects/c6/8c20ed6421dd8d851dc8b404d4f3734361ef80": "807fa1a98b4bdda8bcb75f2fb9f899a7",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/4b/08c92a6448f807045994c6de22d8ee9093aaab": "73d0aae290bed3c22142aa1a7a3ba56f",
".git/objects/11/7d47dcd22139a6d98721df3196463e96e4e4fd": "a0829e65ebba0ab89390e1dd1b310847",
".git/objects/73/c590c4c4314266c17ccadab0aa40dcff00565c": "d35778cd4524d16256fea87b7e31de53",
".git/objects/80/9cbf4ae1ba79080edcc3c55f6231e81d649dfc": "1601524094c6803dda85b9a9dfaa4567",
".git/objects/1a/996d90202527b13029e2652275ecede6a4aff2": "3df5ccb6ff6ecae378d83db06560d4bb",
".git/objects/1a/cd9f10a15819aa0f2808868a48b82aedbe98ce": "4219c2c172594b498938d3277bd358c2",
".git/objects/8f/58a0707cb87060318196bda900348fd007040a": "796a51a4dfb34326f1ff84c92031f6a7",
".git/objects/8a/bfabc30b2b8c95279dc3673299598f9134ebc4": "8ce0d14c36eb4bcfa8b603a6dde82b84",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/19/35708de8e62130fb9600cddb6edd7519ceba34": "189b7400364c33f0473102219c274dc4",
".git/objects/43/e946e398d96aee466fa0aabb625f0889c3a4bd": "ac34520dee747f675e6e0a15c0bbd2be",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/9f/0c71b70a49664ced448c63edc9c4ff2bf8cf4a": "bfe12b0c8078a4f477699ecebf5fd96c",
".git/objects/6b/cdcc27f22e001e46defdfd9e23f224ff65dd67": "624b5324c1f5198f7f6ede95410d5b7b",
".git/objects/6b/2e866e67c447e3b3419b723f9a555074afd906": "1469df149a17d48a4338c57cfae72197",
".git/objects/5c/c6b490a6d2abcb3104cd22d8091b93110b3719": "d4c8ffaa5603b7e1787b74cceb0cd761",
".git/objects/09/07786f6667c9a286aad7ff5602bc221522a1e1": "7aa4418f9b9da28bf1b82cf085d22c80",
".git/objects/91/43fef43738a12c3edbba79e21215b6de66ade3": "73191184e74302772f738a5b3df24489",
".git/objects/54/ce7862756cb68779ea071fc957b9da4b4ecc5e": "c64a915efaa297a289f2bb8122643cf0",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "970aec5149a3dbe9370a9dc982cdd022",
".git/objects/53/54f979da5decfb1d980172f023ad4b55e92a25": "a5040bc938ba5d5da4d893cd76aa2de1",
".git/objects/01/cc73d3f2409c5c6d05f365f3403dbffc2cf7af": "796c562ceae5a222f89fde365503384a",
".git/objects/39/8ac203e15aeecf199644fda42651dbff05e854": "7711e360ad40ea136173a97b73f9ad72",
".git/objects/52/1e4ca54c0a52f0a09b0ac7274c9938f1018619": "4cad733206e1a79093323b780377e439",
".git/objects/63/0d68637c063d8f7f2111f3dbb19a2883af7f26": "8b5ac9f843c4e6eb145e759e79dd5d38",
".git/objects/d3/3cb1d16d588e3db3f14c98716ffa3e528832f1": "723559de8107ebf6168dc44ec72f8bd3",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "be8592f9341c9b01b70890c8614c6cf7",
".git/objects/a7/f76f7ed2f69e653f51934b785d5034ec334a68": "01b2faef85d342c47381f017d5c1d894",
".git/objects/b7/0d425ccf592f04561665e6cab3bb79cc2e53a1": "85efd4b8ba87a7f61ceb57fc5c13d142",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/a1/a83e2273541ef6d11a264f7fa8ea81d5c9c2b7": "386f509cdc03b476a54114f09abb00e8",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "2933b2b2ca80c66b96cf80cd73d4cd16",
".git/objects/f0/50ee3b33b81bf26c0d42fe1fa0908a1d9615d5": "980c77be7bb2ffd24dc4a53c3e328e85",
".git/objects/fa/514f2ce09e730908dcbc5b9b9f0cb6960d01a3": "dc16194ed31bf58a5f767a991dc2a533",
".git/objects/ce/d91e01e695f6be0edb7eb08a632f9d493e7b3f": "d7d409304ed1f07041f2ccc0786e379e",
".git/objects/48/33fcf9ba677d3df448c90e63368e50f8bfc8d6": "a5b926fccf641f8e2a09e52478c0d37a",
".git/objects/1e/aeb2033c358c5bf8f4d12361e66784790c0095": "6f16656bdf3565ef7811f62ec2ed284e",
".git/objects/4f/d0e51f345ee398d4c56c9a2a36514cfdc54f3e": "d8e976b7b97437231f01681fc40815a3",
".git/objects/8d/0edefb39cad75244f26d8cbba12698c37b913c": "703f7fe213cd03d17d922db58fe07e86",
".git/objects/8c/188f638e307142b9792b8287af25476fc516e2": "2ee76a9559742e5cd2ebd9aef56d16ef",
".git/objects/49/2efe9e69678c6486d0c0043e93e96357c370b4": "5e935e3f3ec605fe236c90660537b9ad",
".git/objects/2b/e39c7fd3da441ddac9bea54fd12621dd39960a": "24031b20667d22ca8dba4debe8b9eab5",
".git/objects/13/cd9fbe8c3104c4305944da405c13114cd331cd": "fc939852a65aada5c9ef1e20b87705d4",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "f4cb5b30048264aed94f5095aa22c555",
".git/logs/refs/heads/main": "180a4a9a1b43c384dc4e411bfa24b26b",
".git/logs/refs/remotes/origin/main": "591e157024fb5f75652b31ebe76e1edb",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "62e9db40b01eaa92326b5cf2c75cad9a",
".git/refs/remotes/origin/main": "62e9db40b01eaa92326b5cf2c75cad9a",
".git/index": "d8220bc9f2f4765f6e9ad600df00c771",
".git/COMMIT_EDITMSG": "66a06856d1e9375cba2b872f30dd3a12",
".git/FETCH_HEAD": "0a7cc0d78800ccbe065e9833c130ddc5",
"assets/AssetManifest.json": "f68336dc62d3eb84150a6e7b4d861c41",
"assets/NOTICES": "3959afe220835e81e0cc100142aebbee",
"assets/FontManifest.json": "42f2764c3d999a6861e79430ccdf8bba",
"assets/AssetManifest.bin.json": "e418b959f91978fd919fac36a2d50efc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "9a6bfe228f0ba2cbd83ad2598c8b093b",
"assets/fonts/MaterialIcons-Regular.otf": "783e7e9b823fbca6881e845e1da07b37",
"assets/assets/images/profile.png": "925728e6bfe36ebf6490f1b4c5b16073",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
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
