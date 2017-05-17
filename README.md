### What is this for?

This is for sites that are super-simple but require loading some page content independently of the rest.

Maybe one part loads slowly and it's dragging the rest of the page down with it. Maybe some boilerplate can be cached indefinitely and doesn't need to be downloaded on every page view.

### Usage

    <head>
        <script src="remote-div.js"></script>
    </head>
    <body>
        <remote-div data-src="/partial-page.html">
    </body>

It's that easy. This is what it does:

1.  Registers a new HTML element `registerElement('remote-div')`
2.  Fetches the HTML document specified with the `data-src` attribute.
3.  Injects the HTML into the `remote-div`

### Styling with CSS

There a few lifecycle events that you can style in your css if you wish. Here's a starting point:

    remote-div {
        display: block;
    }
    remote-div[data-stage="loading"]:before {
        content: 'Here comes your content!!!';
    }
    remote-div[data-stage="error"]:before {
        content: 'Oh no, your content failed to load :(';
    }

### FAQ's

#### This is dumb

Yeah, there may be problems with client-side-includes… take it or leave it. It's just a tiny project I found useful once.

#### Are there JS lifecycle events?

Not at the moment. I didn't have a need for them, but I can imagine they may be useful. Send a pull request if you are so inclined!
