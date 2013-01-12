Feature: Greeting plugin standart features BDD
    Test base functionality of LiveStreet greeting plugin standart


    Scenario: Sitemap LiveStreet CMS
        Given I am on "/sitemap/"
            Then the response should contain "/sitemap_general_1.xml"
            And the response should contain "/sitemap_blogs_1.xml"
            And the response should contain "/sitemap_topics_1.xml"
            And the response should contain "/sitemap_users_1.xml"
                Then the response should contain "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

        Given I am on "/sitemap/?maptype=google"
            Then the response should contain "/sitemap_general_1.xml?maptype=google"
            And the response should contain "/sitemap_blogs_1.xml?maptype=google"
            And the response should contain "/sitemap_topics_1.xml?maptype=google"
            And the response should contain "/sitemap_users_1.xml?maptype=google"
                Then the response should contain "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

        Given I am on "/sitemap_users_1.xml"
            Then the response should contain "/profile/user-golfer/"
            And the response should contain "/my/user-golfer/comment/"
            And the response should contain "/my/user-golfer/"

        Given I am on "/my/user-golfer/"
            Then the response status code should be 200
        Given I am on "/my/user-golfer/comment/"
            Then the response status code should be 200
        Given I am on "/profile/user-golfer/"
            Then the response status code should be 200

        Given I am on "/sitemap_topics_1.xml"
            Then the response should contain "/blog/3.html"
            And the response should contain "/blog/gadgets/2.html"
            And the response should contain "/blog/gadgets/1.html"

        Given I am on "/sitemap_topics_1.xml?maptype=google"
            Then the response should contain "xmlns:news=\"http://www.google.com/schemas/sitemap-news/0.9\""
            And the response should contain "xmlns:image=\"http://www.google.com/schemas/sitemap-image/1.1\">"
            And the response should contain "<news:news>"
            And the response should contain "<news:title>"
            And the response should contain "<news:genres>"
            And the response should contain "<news:keywords>"
            And the response should contain "<news:news>"


        Given I am on "/blog/3.html"
            Then the response status code should be 200
        Given I am on "/blog/gadgets/2.html"
            Then the response status code should be 200
        Given I am on "/blog/gadgets/1.html"
            Then the response status code should be 200

        Given I am on "/sitemap_blogs_1.xml"
            Then the response should contain "/blog/gadgets/"

        Given I am on "/blog/gadgets/"
            Then the response status code should be 200

        Given I am on "/sitemap_general_1.xml"
            Then the response should contain "/comments/"

        Given I am on "/comments/"
            Then the response status code should be 200