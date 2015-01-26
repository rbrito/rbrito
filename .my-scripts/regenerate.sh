#!/bin/sh

# To be executed at the root directory of the *source* of the blog.
ikiwiki --setup .blog.setup --verbose
cd ../rbrito.github.com/
git checkout -- blog/smileys/*.png blog/wikiicons/*.png blog/*.css
