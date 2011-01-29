backtype
=======

BackType is a marketing intelligence company that develops products and services that help companies understand their social impact.

This is a simple Ruby gem wrapper for their API.

Note that this wrapper doesn't work for the services in beta or paid.

== SYNOPSIS:

Install from RubyGems
        gem install backtype

Require it in your files:

        require 'backtype'

        backtype = Backtype::Base.new(:api_key => your_api_key)
        backtype.comments_search :q => 'ruby AND chunky AND bakon'

The following are the current supported methods:

        backtype.comments_by_author_url
        backtype.comments_by_page
        backtype.comments_search
        backtype.comments_stats_by_page
        backtype.connect
        backtype.connect_stats
        backtype.stats_by_url
        backtype.user_influencer_score
        backtype.user_influenced_by
        backtype.user_influencer_of
        backtype.user_top_sites

You can check the parameters for each
 of the methods in http://www.backtype.com/developers.

Author
======

Adolfo Builes, builes.adolfo@googlemail.com

Copyright (c) 2011

