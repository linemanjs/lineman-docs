# lineman-docs

Official documentation for lineman.js

## Getting Started

The primary documentation sections (categories) are defined at the top of `app/templates/wrapper.us`. This array contains the title form of the category name. The category slugs are generated from the title using `underscore.string.slugify()`. The categories appear on the site in the same order in which they appear in this array.

For each category, there is a directory under `app/pages/`. The directory names aren't required to match the category title, but do so by convention. Each sub-section (topic/page) is its own markdown file within said directory. To include a page in a category, the page must include the `category` attribute in its metadata, which must be the slug form of the category name to which the page belongs.

The pages are ordered within each category according to the `ordinal` attribute in the page's metadata block. The page heading is taken from the `title` attribute of the metadata block, or if omitted, derived from the filename.

The navigation is auto-generated based on the category titles and slugs, as well as the page titles and slugs; both of which support deep-linking.

## HTML linting and validation

There are two tasks included for validating the generated HTML: `grunt-html-validation` and `grunt-htmlhint`. Both tasks are configured to check html pages under `generated/`. Neither task is added to the lineman build processes, so they need to be run manually: `lineman grunt validation` and `lineman grunt htmlhint`.
