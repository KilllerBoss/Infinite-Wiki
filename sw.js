// Service Worker für Infinite Wiki PWA
const CACHE_NAME = 'infinite-wiki-v1';
const urlsToCache = [
  '/',
  '/index.html',
  '/index.css',
  '/index.tsx',
  '/App.tsx',
  '/manifest.json',
  '/icon-192.png',
  '/icon-512.png'
];

// Installation
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Cache geöffnet');
        return cache.addAll(urlsToCache);
      })
  );
});

// Fetch-Events abfangen
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Cache hit - Antwort aus Cache zurückgeben
        if (response) {
          return response;
        }
        
        // Netzwerk-Request durchführen
        return fetch(event.request).then(
          response => {
            // Überprüfen, ob wir eine gültige Antwort erhalten haben
            if (!response || response.status !== 200 || response.type !== 'basic') {
              return response;
            }

            // Antwort klonen
            const responseToCache = response.clone();

            caches.open(CACHE_NAME)
              .then(cache => {
                cache.put(event.request, responseToCache);
              });

            return response;
          }
        );
      })
  );
});

// Cache-Updates
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheName !== CACHE_NAME) {
            console.log('Lösche alten Cache:', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});