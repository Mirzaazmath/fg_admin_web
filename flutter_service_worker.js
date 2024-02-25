'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "9f9cbb400ca9e5d449968d9b44c421d2",
"index.html": "847d61cf753a5d54639182f0b94aa9d2",
"/": "847d61cf753a5d54639182f0b94aa9d2",
"main.dart.js": "aacef62b60b984f3118debff4972a179",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "88d5a340f32c26313f598a8f2aed6b0e",
".git/ORIG_HEAD": "e423a47811ead38491aeebc78c59b39d",
".git/config": "b1b00ce9ee0bddf240d166ed8c4ceb9c",
".git/objects/92/5e2fb1b2ed30a6f727bf216de263757db8d7c9": "d8d42a985ba96648414b02d7693f29a2",
".git/objects/92/85331b282eacf0f039a6c04062eb0f1bb123db": "55ee41a8cd230f377bacd28689dc8a7c",
".git/objects/3b/9f967b796340c2a20ef206961104a81f2c694b": "dfca07080fece88bd9726c2af28f4711",
".git/objects/6f/e1a9f725c4b1c9a3393cb6bb992a5229c7331c": "094c6c58d4584996a09b54e7f85b2db3",
".git/objects/9b/df000cb42d0aed6dd0d7b6515e6613b2af9b8d": "badedaea2713c74a09eb1ffeb2071e09",
".git/objects/9e/030b09dd64ccfce1a47c3d4f372dc432f85f22": "e542d88817db1bbcd3bc94db4d856890",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "978222f47488835b92838c74cb5c684c",
".git/objects/04/1b5c0c42ecee7923674cdad9ff2211984badb2": "78b26f3baae50e543abb883ec94a2662",
".git/objects/32/c9f5cf9309ee6fda56b692b8f9c1dbcdd8b7e4": "120186ba38ce53762a5b0b70dcf55e4c",
".git/objects/3c/c62b9054decc146f1af1225de85b490f9df86b": "13d5e551b6c4952f3b4ef5fa428d5403",
".git/objects/94/b52e13bf7919ae4ea7235d78019b592dde8611": "b79fa5ca1cdbf72f253763797850f314",
".git/objects/94/0d14ab1184aed1bbbec04a55ca72bbc077c4b8": "d8d5952db46c3fee6e52d7abf41436c8",
".git/objects/0e/e3590f4d74c3a4e4621a8d048d01f13436ec7a": "25939fd9f3cb53628d90cf3f4f9a026a",
".git/objects/5a/de3f5bfe818c713988ac527fd09661b9750922": "2197696b93dd2a2214af2cdde1bdbfec",
".git/objects/5a/22a92ed3e2794e0e1f51b74de9a5cf23de8dc5": "7c08b9a38516f921965b651c03cb05e9",
".git/objects/9d/23739fa329afecae8cccbba98f713f8418c883": "1e64e907fe86068134babffc110f0bbb",
".git/objects/9d/9fa370d538fdebc7659059665650e4a6fb6190": "0e8074a4ee70597b0b54ee63dceac6d8",
".git/objects/9c/a03a96231016f9650c115292e7e19d3e647648": "dd43b02538520e2807a707334b480f88",
".git/objects/a4/21153e5b6a29395e5faadb693dac86b8d5582b": "57f9d567d927699379869e2490790002",
".git/objects/bb/3085876799532613a08c7ebe43f24f0cc46864": "1b6aa21800d948d5513c15e54d131215",
".git/objects/bb/8b1fac4356dad1f8ad2f97858afc61f0172595": "7e35b96db3e83dd475ec9a3aebfe9c70",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "d7280a766a5d6033f187d874a92b5ad6",
".git/objects/d7/d43746ee7b96a3430ab861073d5b0c29fe1ba9": "63c4c241d0d1a640eadd5e8f090144ac",
".git/objects/d0/832bfbf36a455d60f36f74489e501ecb79af5f": "56cc11918e1563cbba3c4dffbb0862b7",
".git/objects/be/c3b9a84550e57051ecfd580775fd6bfa485a74": "2241432b363abe1ceecff5aef5f54c0f",
".git/objects/df/7d2dcb89ab89da87467c0e1059b38c8d8f9296": "a44162ff357b024e4638ab18a9bb01c7",
".git/objects/a2/731d66543aa8dd94cb4fb068392ad98b12dfc9": "fc34c9698af22f9428d75c374d4644c0",
".git/objects/a2/c409841d50cd22e6a82105625650cced8811bc": "4a56daa1ca795b6716afba5c5d760bf6",
".git/objects/d1/fd671119494d6fe28eba57d2ccd7585ff0439b": "2b69563cb4946f38676440d218b19b69",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/bc/87cfb388d9a24be5a5b6bf3b07c59f3d30d3bf": "b2d8804d39cc5eef38adc8625887eb5b",
".git/objects/e5/dae46a5a956a9acf5b2ca7bf9028db74b68a3a": "d284e8193e5225284ebd646a5c39d51e",
".git/objects/f3/54657977b1ea229ada108b62183327dd704500": "487a852cd8f7c258b2a08d2edd361976",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/fd/342c4dc7c38a7df986d9ccdae35e0bb4c6d8a4": "649a3acd31acf7e04af6d08214474ab4",
".git/objects/f5/ca1abde1752c30948fc456184d22e7d62565b3": "73732bcbbee5ad2791d9017b94a49267",
".git/objects/cf/acd38a120385ade183efab45c58f9b88d69959": "f99f3400188f97d125a60d0891806611",
".git/objects/e4/886df3498f367327e5bdb9a1185e84cb54efa5": "e849bd1621221c4082dd8325fbdfff6b",
".git/objects/fe/ccf9483f59e2e97553e6f4573a96eeb39816b3": "29478540cb05120bd8cc20c32d71db5e",
".git/objects/c8/5a045950ef8e41738c1e8e2c62b551222a75a4": "6bec05d0edab4b763f3dbf81318d2ce4",
".git/objects/fb/7d12abb3698e5358106f3285ec711950d77df1": "63c2eee20f06399b15b43d54eba23c6a",
".git/objects/ed/99339c7e7f8f6bd61a73c942e0772860a1e506": "d27788ecdca6d03e3cfc9e17e6e2e114",
".git/objects/c1/1cbd8fba4a3f76ec59d7c47e5de099dbb8c5f5": "fba9c7a47de4d9c8f4ad7baa27829c0a",
".git/objects/c6/8c20ed6421dd8d851dc8b404d4f3734361ef80": "807fa1a98b4bdda8bcb75f2fb9f899a7",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/4b/08c92a6448f807045994c6de22d8ee9093aaab": "73d0aae290bed3c22142aa1a7a3ba56f",
".git/objects/11/7d47dcd22139a6d98721df3196463e96e4e4fd": "a0829e65ebba0ab89390e1dd1b310847",
".git/objects/73/c590c4c4314266c17ccadab0aa40dcff00565c": "d35778cd4524d16256fea87b7e31de53",
".git/objects/80/9cbf4ae1ba79080edcc3c55f6231e81d649dfc": "1601524094c6803dda85b9a9dfaa4567",
".git/objects/1a/996d90202527b13029e2652275ecede6a4aff2": "3df5ccb6ff6ecae378d83db06560d4bb",
".git/objects/1a/aed03b3b140b465324469c3865de0e54d322dd": "546591463effd2348adc649dcd2967d2",
".git/objects/1a/cd9f10a15819aa0f2808868a48b82aedbe98ce": "4219c2c172594b498938d3277bd358c2",
".git/objects/28/ea1c6f390c7529c1be5df500840e727b766a98": "22ad6e01a2f89d01d032abe4cdd828d6",
".git/objects/28/a6d3d0bf0cafe77b61deb296486a97156f97d1": "b1bc247955fce6b32d3ed208aec98a5c",
".git/objects/8f/58a0707cb87060318196bda900348fd007040a": "796a51a4dfb34326f1ff84c92031f6a7",
".git/objects/8a/bfabc30b2b8c95279dc3673299598f9134ebc4": "8ce0d14c36eb4bcfa8b603a6dde82b84",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/19/35708de8e62130fb9600cddb6edd7519ceba34": "189b7400364c33f0473102219c274dc4",
".git/objects/4d/f1a212661f1a700fac33a650e9e060b286b3a7": "e06b14992f50d331741e8b71cca70950",
".git/objects/43/22f35a9b4c4cbc290552bed8bfc856f5fcff74": "f55ad40b70be58dfeffe3aec7130cc32",
".git/objects/43/e946e398d96aee466fa0aabb625f0889c3a4bd": "ac34520dee747f675e6e0a15c0bbd2be",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/9f/0c71b70a49664ced448c63edc9c4ff2bf8cf4a": "bfe12b0c8078a4f477699ecebf5fd96c",
".git/objects/6b/cdcc27f22e001e46defdfd9e23f224ff65dd67": "624b5324c1f5198f7f6ede95410d5b7b",
".git/objects/6b/2e866e67c447e3b3419b723f9a555074afd906": "1469df149a17d48a4338c57cfae72197",
".git/objects/6e/dcc0b2fb063e7437ae6418c9e7f531d3dbaa49": "9060829c0848031991ad33ac71fcce0b",
".git/objects/5c/c6b490a6d2abcb3104cd22d8091b93110b3719": "d4c8ffaa5603b7e1787b74cceb0cd761",
".git/objects/09/07786f6667c9a286aad7ff5602bc221522a1e1": "7aa4418f9b9da28bf1b82cf085d22c80",
".git/objects/31/3bf8b1556803e4909f0449ac6aee42479352ea": "78212e0c9724d8866466ff9a83fc13d7",
".git/objects/91/43fef43738a12c3edbba79e21215b6de66ade3": "73191184e74302772f738a5b3df24489",
".git/objects/54/ce7862756cb68779ea071fc957b9da4b4ecc5e": "c64a915efaa297a289f2bb8122643cf0",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "970aec5149a3dbe9370a9dc982cdd022",
".git/objects/53/54f979da5decfb1d980172f023ad4b55e92a25": "a5040bc938ba5d5da4d893cd76aa2de1",
".git/objects/5b/15d5603ee4b0ee85db2e7785dd9850e43be03c": "9b649a08619c14dacbd24a2263c3563d",
".git/objects/01/cc73d3f2409c5c6d05f365f3403dbffc2cf7af": "796c562ceae5a222f89fde365503384a",
".git/objects/6c/12d601e1d54699f2259e86d23569a92f73391d": "c06956c33cff7def5e257dd726f4b611",
".git/objects/39/8ac203e15aeecf199644fda42651dbff05e854": "7711e360ad40ea136173a97b73f9ad72",
".git/objects/52/1e4ca54c0a52f0a09b0ac7274c9938f1018619": "4cad733206e1a79093323b780377e439",
".git/objects/55/3eb9acdbd4190914b52efb9d38dde203051927": "371a0e9c6959ad814bae17f6e323b030",
".git/objects/63/0d68637c063d8f7f2111f3dbb19a2883af7f26": "8b5ac9f843c4e6eb145e759e79dd5d38",
".git/objects/90/7ff15cb76af77b323b3369b1fb8c7a06aa8367": "72a4eaf2235f52258b286392de30fbe1",
".git/objects/d3/3cb1d16d588e3db3f14c98716ffa3e528832f1": "723559de8107ebf6168dc44ec72f8bd3",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "be8592f9341c9b01b70890c8614c6cf7",
".git/objects/a7/275405ac7feec3e7f8bb28a087e2a97d5f9bb5": "5587c8e3dd619fb71e569813dbe39714",
".git/objects/a7/f76f7ed2f69e653f51934b785d5034ec334a68": "01b2faef85d342c47381f017d5c1d894",
".git/objects/b7/0d425ccf592f04561665e6cab3bb79cc2e53a1": "85efd4b8ba87a7f61ceb57fc5c13d142",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/de/6184d1011af713a9618dec6498df5d03fe0a55": "cbdae0ebc770e08789143655fa973803",
".git/objects/a6/e459dd95f41ba969c008d20d318805d8a9f742": "a9c1c7ee866634aadd26f4ac5e621db8",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/a1/a83e2273541ef6d11a264f7fa8ea81d5c9c2b7": "386f509cdc03b476a54114f09abb00e8",
".git/objects/cc/28a4971ad8930ef4979a952e04967e89b65a45": "1ffbce09351ad3be2662704d90b806cd",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "2933b2b2ca80c66b96cf80cd73d4cd16",
".git/objects/f0/50ee3b33b81bf26c0d42fe1fa0908a1d9615d5": "980c77be7bb2ffd24dc4a53c3e328e85",
".git/objects/fa/514f2ce09e730908dcbc5b9b9f0cb6960d01a3": "dc16194ed31bf58a5f767a991dc2a533",
".git/objects/ce/d91e01e695f6be0edb7eb08a632f9d493e7b3f": "d7d409304ed1f07041f2ccc0786e379e",
".git/objects/48/33fcf9ba677d3df448c90e63368e50f8bfc8d6": "a5b926fccf641f8e2a09e52478c0d37a",
".git/objects/1e/aeb2033c358c5bf8f4d12361e66784790c0095": "6f16656bdf3565ef7811f62ec2ed284e",
".git/objects/84/6ac006b3e54739979f6b2155d7f2844e1bb1b7": "be79fb97ba2ef1e8f19671d5636730bc",
".git/objects/4f/d0e51f345ee398d4c56c9a2a36514cfdc54f3e": "d8e976b7b97437231f01681fc40815a3",
".git/objects/8d/dba08dd737fa9021b584cb5c516d799b85e155": "eda84163ac4321bb8f0f6d0ddcb8c728",
".git/objects/8d/0edefb39cad75244f26d8cbba12698c37b913c": "703f7fe213cd03d17d922db58fe07e86",
".git/objects/8c/188f638e307142b9792b8287af25476fc516e2": "2ee76a9559742e5cd2ebd9aef56d16ef",
".git/objects/76/c8ace7709b9c26a33a1fb7f29389e3bde2d4f7": "fabc2b1128581a4ef5d945f9d48d429c",
".git/objects/49/2efe9e69678c6486d0c0043e93e96357c370b4": "5e935e3f3ec605fe236c90660537b9ad",
".git/objects/40/7129b9717254f9cbe510388f6fd6eeafbf8d9d": "37045f34b1f30ed5f982bc3ab2187d0f",
".git/objects/2b/e39c7fd3da441ddac9bea54fd12621dd39960a": "24031b20667d22ca8dba4debe8b9eab5",
".git/objects/8b/0f562a5a8e27358a55edb300a7903f7acbed9e": "7360a529f444b879d0196b28818cecbf",
".git/objects/13/cd9fbe8c3104c4305944da405c13114cd331cd": "fc939852a65aada5c9ef1e20b87705d4",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "2b7decefd17009b0cc54d7e91ef323d0",
".git/logs/refs/heads/main": "25bb64e6a50cab1145de262b082eb4c5",
".git/logs/refs/remotes/origin/main": "7e4e3298a222713c7691c8b5a1e1eca6",
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
".git/refs/heads/main": "93d2debcf9569aa895ee24ecdd4a9075",
".git/refs/remotes/origin/main": "93d2debcf9569aa895ee24ecdd4a9075",
".git/index": "25a9461d008cfd88c65ece7376f9788d",
".git/COMMIT_EDITMSG": "73d7885a65f843323786c41d9f576772",
".git/FETCH_HEAD": "7e52532c7a7c23a891db906076e69b5e",
"assets/AssetManifest.json": "3ec10127b05b829aeb51b1fc621d7611",
"assets/NOTICES": "ae2059f859c6c2aaac84aa4df571bf98",
"assets/FontManifest.json": "42f2764c3d999a6861e79430ccdf8bba",
"assets/AssetManifest.bin.json": "66434e21b017373163ca2f9762cb0f2b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "3714bbab9939b8208c7c459b31900696",
"assets/fonts/MaterialIcons-Regular.otf": "521daf4b6440ba9aa69715ca565c5b75",
"assets/assets/images/map.png": "762bacca9616afd96856121eda0fb6c8",
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
