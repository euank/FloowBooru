API
===

search
------

### Request:
+ q
    + search term
+ lastId 
    + the id of the last item displayed
+ nsfw
+ order
    + 0: normal (newest-first) 
    + 1: oldest-first 
    + 2: random
+ numLinks 
    + Number of links to return, number of images expected to fit on a page and a half (to allow buffering).
+ size:
    + 'axb'  Note: If they only specify one parameter, the other will be empty.  For a person only wishing the width to be 1000px, the request would read 
```
. . .&size='1000x'. . .
``
+ sizeType:
    + 0: exactly
    + 1: larger than
    + 2: smaller than
    + 3: approximately

### Example: 
```
/api/search?q='frogs'&lastId=-1&nsfw=0&order=2&numLinks=40&size='1920x1080'&sizeType=0
```

### Return:
+ imgs: [ {
    + id: 'asdf', 
    + ext: 'png', 
    + tags: ['tag1', 'tag2', ... ],
        + Searched-for tag is first
    + albums: ['album1', 'album2', ...], 
        + Albums this image is in.
    + size: 'axb' 
}, {}, ... ],
+ numHits: 100, 
    + number of hits for this tag
+ err: 0
    + Return 1 if server is overloaded or otherwise unable to handle the request properly.  Will display a "server overloaded" message, and retry request in 1 second, while preventing further requests for 1 second.

related
-------

### Request:
+ term
+ numTerms 
    + maximum number to return

### Example: 
```
/api/related?term='starcraft'&numTerms=3
```  

### Return:
+ related: [ 'term1', 'term2', ... ] 
    + if no related terms, return an empty array

didyoumean
----------

### Request:
+ term
+ numTerms
    + Number of alternate tags to return.

### Example: 
```
/api/didyoumean?term='mizspeld'&numTerms=2
```

### Return:
+ wrong: 0, 
    + if 1, it's not a tag and will print out "did you mean" message
+ alts: [ 'alt1', 'alt2', . . .]
    + closest tags

upload
------

### Request:
+ link='http://www.google.com/images/logos/google_logo_41.png'
+ tags=tag1+tag2+tag3. . .

### Example:
```
/api/uploadlink?link='http://www.google.com/images/logos/google_logo_41.png'&tags='google'+'logo'
```

### Return:
+ success: 0,
+ id: 'asdf'
    + Image id  


makealbum
---------

### Request:
+ ids=id1+id2+id3. . .
    + Ids of already uploaded pictures
+ tags=tag1+tag2+tag3. . .
    + Tags for entire album, not necessarily the same as pictures
+ title=relevant_title

### Example: 
```
/api/makealbum?ids='a17j'+'a17k'+'a17l'&tags='pretty'+'kitty'+'cat'&title='Some pictures of cats'
```

### Return:
    
+ success: 0,
+ id: 'asdf'
    + Id of the album
   
To-do
-----
+ [ ] search
+ [ ] related
+ [ ] didyoumean
+ [ ] upload
+ [ ] makealbum
