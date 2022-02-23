---
title: "Restful"
date: 2020-09-09T09:35:37+01:00
---

### Design tips

- URI format:

```
URI = scheme "://" authority "/" path [ "?" query] ["#" fragment"]
URI = http://myserver.com/mypath?query=1#document
```

- General rules for URI formating:

    - A forward slash / is used to indicate a hierarchical relationship between resources
    - A trailing forward slash / should not be included in URIs
    - Hyphens - should be used to improve readability
    - Underscores _ should not be used in URIs
    - Lowercase lette

- URI path design

    - Collections: Always plural noun
        ```
        GET /cats   -> All cats in the collection
        GET /cats/1 -> Single document for a cat 1
        ```

    - Documents: Points to a single object. 
        ```
        GET /cats/1     -> Single document for cat 1
        GET /cats/1/kittens  -> All kittens belonging to cat 1
        GET /cats/1/kittens/1 -> Kitten 1 for cat 1
        ```

    - Controller: Used to map non standard CRUD
        ```
        POST /cats/1/feed   -> Feed cat 1
        POST /cats/1/feed?food=fish ->Feed cat 1 a fish
        ```
    - Store: A source repository.
        ```
        PUT /cats/2
        ```
    - Content type: Should be able to support multiple formats: JSON, YAML, XML, or any new future format.
    
    - Content Type Header: Use this header to communicate what content type you are sending. 
      - Also you could use the Accept header to see which content type your receiver is expecting.

    - Versioning:
      - Add version in the URI
        ```
        api.domain.com/v2/resource.
        ```
      - Add version in the Content-type header
        ```
        Content-­‐type:	application/json+v1	
        ```
    - Cache: Communicate that the call is cacheable and able to renew it expires.
      - Cache-control and expere headers:
        ```
        Cache-­‐Contro:lpublic,	 max-­‐age=3600	
        ```
        Above setting may appear as:
        ```
        Cache-Control: public
        Expires: Mon, 09 February 2015 17:00:00 GMT
        ```
      - Also we can send back the cache-control header with no chace and no store.
        ```
        Cache-­‐Control:no-­‐cache, no-­‐store	
        ```
      - CRUD suggetions:
        - GET: To get information of a object/item or collection
        - POST: To create a object or collection
        - PUT: To override the whole object or collection
        - PATCH: To override part of the object or collection
        - OPTIONS: To get the list of available methods  


###  References

- [RFC 7231: Hypertext Transfer Protocol (HTTP/1.1): Semantics and Content](https://tools.ietf.org/pdf/rfc7231.pdf)
- [RFC 2616: Header Field Definitions](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html) 
- [Microsoft REST API guidelines](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#51-errors)
- [OpenAPI specifications adopted by industry for documentation](https://www.openapis.org/)
- [Swagger using YAML](https://swagger.io/)
- [API Blueprint using Markdown](https://apiblueprint.org/)
- [RAML Restful API Modeling Language using YAML](https://raml.org/)
- [Calico project for container base networking](https://www.projectcalico.org/)
- [Undisturbed REST](https://www.amazon.co.uk/Undisturbed-Rest-Designing-Perfect-Paperback/dp/B0160F4LCG)
