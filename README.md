# Molteo code challenge

The vault challenge has it's own small  readme in the vault folder

## Flutter Book app

A book app 

This is a proof of concept, the app is by no means finished of fully functional, it is just 
a starting point for developing a more feature rich app.

Libraries:
* flutter_bloc (for bloc pattern)
*  http (for http requests)
*  shared_preferences (for saving preferences)
*  html (for parsing html)
*  cached_network_image (for caching images)

Features:

* load a list of books from a source

    The source that works with all features is good reads -> https://www.goodreads.com, and it is the only one I have tried the app with 
  (although crude implementations for https://api.itbook.store and http://openlibrary.org are semi-complete, they are not finished and will not
  work if switched to any of them).
    The source can be easily changed by implementing the IBookApi
  
* On the new books tab (main tab) 
    * swiping a book card to the left will add it to the 'Not interested' list.
While in that list, the book will be filtered from new queries (to the new books endpoint). It will disappear 
      from the current list 
  * swiping to the right will add the book to the interested list, and add a green check mark to the card to show in future
    queries that the specific card is in your 'interested in' list.
    
* On the Not interested / Interested tabs a list with the specific books are shown
* The interested in / not interested in books are saved locally (Shared preferences)
* Tapping a card in portrait view will open a page with details about the card.
* Switching to landscape while in the new books tab will change the display to:
    * On the left, the book list with the same functionality as in portrait.
    * On the right, the (higher quality) book cover and comments about the book from goodreads.
* If tapping a book in landscape mode, the comments for that book are loaded and displayed to the right.
* All book queries are cached per app session (until the app closes)

Implementation specific comments can be read throughout the code.

The reason I have picked goodreads instead of the provided api is that the provided api does not have enough
information about books to make it functional on it's own. It should work in tandem with other apis but 
there was no point in combining 2 apis to reach the functionality I wanted.

The goodreads information is not an actual api (goodreads discontinued their api for new users), it is
data acquired by scrapping the site, so it may take a while to load un-cached data. 
