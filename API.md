API
===

search
------

### Request:
+ q
    + search term
+ lastId 
    + -1 for the first time a search is called, else the id of the last item displayed
+ nsfw
+ order
    + 0: normal (newest-first) 
    + 1: oldest-first 
    + 2: random
+ numLinks 
    + Number of links to return, number of images expected to fit on a page and a half (to allow buffering).
+ size:
    + 'axb' or 0 if no restrictions

### Example: 
```
/api/search?q='frogs'&lastId=-1&nsfw=0&order=2&numLinks=40&size='1920x1080'
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
+ numOfTerms 
    + maximum number to return

### Example: 
```
/api/related?term='starcraft'&numOfTerms=3
```  

### Return:
+ related: [ 'term1', 'term2', ... ] 
    + if no related terms, return an empty array

didyoumean
----------

### Request:
+ term
+ numAlt
    + Number of alternate tags to return.

### Example: 
```
/api/didyoumean?term='mizspeld'&numAlt=2
```

### Return:
+ wrong: 0, 
    + if 1, it's not a tag and will print out "did you mean" message
+ alts: [ 'alt1', 'alt2', . . .]
    + closest tags

uploadlink
----------

### Request:
+ link='http://www.google.com/images/logos/google_logo_41.png'
+ tags=tag1+tag2+tag3. . .

### Example:
```
/api/uploadlink?link='http://www.google.com/images/logos/google_logo_41.png'&tags='google'+'logo
```

### Return:
+ success: 0,
+ id: 'asdf'
    + Image id  

uploadfile
----------

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
+ [ ] uploadlink
+ [ ] uploadfile
+ [ ] makealbum