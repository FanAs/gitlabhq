# Documentation styleguide

This styleguide recommends best practices to improve documentation and to keep
it organized and easy to find.

## Naming

- When creating a new document and it has more than one word in its name,
  make sure to use underscores instead of spaces or dashes (`-`). For example,
  a proper naming would be `import_projects_from_github.md`. The same rule
  applies to images.

## Text

- Split up long lines, this makes it much easier to review and edit. Only
  double line breaks are shown as a full line break in [GitLab markdown][gfm].
  80-100 characters is a good line length
- Make sure that the documentation is added in the correct directory and that
  there's a link to it somewhere useful
- Do not duplicate information
- Be brief and clear
- Unless there's a logical reason not to, add documents in alphabetical order
- Write in US English
- Use [single spaces][] instead of double spaces

## Formatting

- Use dashes (`-`) for unordered lists instead of asterisks (`*`)
- Use the number one (`1`) for ordered lists
- Use underscores (`_`) to mark a word or text in italics
- Use double asterisks (`**`) to mark a word or text in bold
- When using lists, prefer not to end each item with a period. You can use
  them if there are multiple sentences, just keep the last sentence without
  a period

## Headings

- Add only one H1 title in each document, by adding `#` at the beginning of
  it (when using markdown). For subheadings, use `##`, `###` and so on
- Avoid putting numbers in headings. Numbers shift, hence documentation anchor
  links shift too, which eventually leads to dead links. If you think it is
  compelling to add numbers in headings, make sure to at least discuss it with
  someone in the Merge Request
- When introducing a new document, be careful for the headings to be
  grammatically and syntactically correct. It is advised to mention one or all
  of the following GitLab members for a review: `@axil`, `@rspeicher`,
  `@dblessing`, `@ashleys`, `@nearlythere`. This is to ensure that no document
  with wrong heading is going live without an audit, thus preventing dead links
  and redirection issues when corrected
- Leave exactly one newline after a heading

## Links

- If a link makes the paragraph to span across multiple lines, do not use
  the regular Markdown approach: `[Text](https://example.com)`. Instead use
  `[Text][identifier]` and at the very bottom of the document add:
  `[identifier]: https://example.com`. This is another way to create Markdown
  links which keeps the document clear and concise. Bonus points if you also
  add an alternative text: `[identifier]: https://example.com "Alternative text"`
  that appears when hovering your mouse on a link

## Images

- Place images in a separate directory named `img/` in the same directory where
  the `.md` document that you're working on is located. Always prepend their
  names with the name of the document that they will be included in. For
  example, if there is a document called `twitter.md`, then a valid image name
  could be `twitter_login_screen.png`.
- Images should have a specific, non-generic name that will differentiate them.
- Keep all file names in lower case.
- Consider using PNG images instead of JPEG.

Inside the document:

- The Markdown way of using an image inside a document is:
  `![Proper description what the image is about](img/document_image_title.png)`
- Always use a proper description for what the image is about. That way, when a
  browser fails to show the image, this text will be used as an alternative
  description
- If there are consecutive images with little text between them, always add
  three dashes (`---`) between the image and the text to create a horizontal
  line for better clarity
- If a heading is placed right after an image, always add three dashes (`---`)
  between the image and the heading

## Notes

- Notes should be quoted with the word `Note:` being bold. Use this form:

    ```
    >**Note:**
    This is something to note.
    ```

    which renders to:

    >**Note:**
    This is something to note.

    If the note spans across multiple lines it's OK to split the line.

## New features

- Every piece of documentation that comes with a new feature should declare the
  GitLab version that feature got introduced. Right below the heading add a
  note: `>**Note:** This feature was introduced in GitLab 8.3`
- If possible every feature should have a link to the MR that introduced it.
  The above note would be then transformed to:
  `>**Note:** This feature was [introduced][ce-1242] in GitLab 8.3`, where
  the [link identifier](#links) is named after the repository (CE) and the MR
  number
- If the feature is only in GitLab EE, don't forget to mention it, like:
  `>**Note:** This feature was introduced in GitLab EE 8.3`. Otherwise, leave
  this mention out

## References

- **GitLab Restart:**
  There are many cases that a restart/reconfigure of GitLab is required. To
  avoid duplication, link to the special document that can be found in
  [`doc/administration/restart_gitlab.md`][doc-restart]. Usually the text will
  read like:

    ```
    Save the file and [reconfigure GitLab](../administration/restart_gitlab.md)
    for the changes to take effect.
    ```
  If the document you are editing resides in a place other than the GitLab CE/EE
  `doc/` directory, instead of the relative link, use the full path:
  `http://docs.gitlab.com/ce/administration/restart_gitlab.html`.
  Replace `reconfigure` with `restart` where appropriate.

## Installation guide

- **Ruby:**
  In [step 2 of the installation guide](../install/installation.md#2-ruby),
  we install Ruby from source. Whenever there is a new version that needs to
  be updated, remember to change it throughout the codeblock and also replace
  the sha256sum (it can be found in the [downloads page][ruby-dl] of the Ruby
  website).

[ruby-dl]: https://www.ruby-lang.org/en/downloads/ "Ruby download website"

## Changing document location

Changing a document's location is not to be taken lightly. Remember that the
documentation is available to all installations under `help/` and not only to
GitLab.com or http://docs.gitlab.com. Make sure this is discussed with the
Documentation team beforehand.

If you indeed need to change a document's location, do NOT remove the old
document, but rather put a text in it that points to the new location, like:

```
This document was moved to [path/to/new_doc.md](path/to/new_doc.md).
```

where `path/to/new_doc.md` is the relative path to the root directory `doc/`.

---

For example, if you were to move `doc/workflow/lfs/lfs_administration.md` to
`doc/administration/lfs.md`, then the steps would be:

1. Copy `doc/workflow/lfs/lfs_administration.md` to `doc/administration/lfs.md`
1. Replace the contents of `doc/workflow/lfs/lfs_administration.md` with:

    ```
    This document was moved to [administration/lfs.md](../../administration/lfs.md).
    ```

1. Find and replace any occurrences of the old location with the new one.
   A quick way to find them is to use `grep`:

    ```
    grep -nR "lfs_administration.md" doc/
    ```

    The above command will search in the `doc/` directory for
    `lfs_administration.md` recursively and will print the file and the line
    where this file is mentioned. Note that we used just the filename
    (`lfs_administration.md`) and not the whole the relative path
    (`workflow/lfs/lfs_administration.md`).


## API

Here is a list of must-have items. Use them in the exact order that appears
on this document. Further explanation is given below.

- Every method must have the REST API request. For example:

    ```
    GET /projects/:id/repository/branches
    ```

- Every method must have a detailed
  [description of the parameters](#method-description).
- Every method must have a cURL example.
- Every method must have a response body (in JSON format).

### Method description

Use the following table headers to describe the methods. Attributes should
always be in code blocks using backticks (`).

```
| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
```

Rendered example:

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `user`  | string | yes | The GitLab username |

### cURL commands

- Use `https://gitlab.example.com/api/v3/` as an endpoint.
- Wherever needed use this private token: `9koXpg98eAheJpvBs5tK`.
- Always put the request first. `GET` is the default so you don't have to
  include it.
- Use double quotes to the URL when it includes additional parameters.
- Prefer to use examples using the private token and don't pass data of
  username and password.

| Methods | Description |
| ------- | ----------- |
| `-H "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK"` | Use this method as is, whenever authentication needed |
| `-X POST`   | Use this method when creating new objects |
| `-X PUT`    | Use this method when updating existing objects |
| `-X DELETE` | Use this method when removing existing objects |

### cURL Examples

Below is a set of [cURL][] examples that you can use in the API documentation.

#### Simple cURL command

Get the details of a group:

```bash
curl -H "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" https://gitlab.example.com/api/v3/groups/gitlab-org
```

#### cURL example with parameters passed in the URL

Create a new project under the authenticated user's namespace:

```bash
curl -X POST -H "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" "https://gitlab.example.com/api/v3/projects?name=foo"
```

#### Post data using cURL's --data

Instead of using `-X POST` and appending the parameters to the URI, you can use
cURL's `--data` option. The example below will create a new project `foo` under
the authenticated user's namespace.

```bash
curl --data "name=foo" -H "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" "https://gitlab.example.com/api/v3/projects"
```

#### Post data using JSON content

> **Note:** In this example we create a new group. Watch carefully the single
and double quotes.

```bash
curl -X POST -H "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" -H "Content-Type: application/json" --data '{"path": "my-group", "name": "My group"}' https://gitlab.example.com/api/v3/groups
```

#### Post data using form-data

Instead of using JSON or urlencode you can use multipart/form-data which
properly handles data encoding:

```bash
curl -X POST -H "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" -F "title=ssh-key" -F "key=ssh-rsa AAAAB3NzaC1yc2EA..." https://gitlab.example.com/api/v3/users/25/keys
```

The above example is run by and administrator and will add an SSH public key
titled ssh-key to user's account which has an id of 25.

#### Escape special characters

Spaces or slashes (`/`) may sometimes result to errors, thus it is recommended
to escape them when possible. In the example below we create a new issue which
contains spaces in its title. Observe how spaces are escaped using the `%20`
ASCII code.

```bash
curl -X POST -H "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" "https://gitlab.example.com/api/v3/projects/42/issues?title=Hello%20Dude"
```

Use `%2F` for slashes (`/`).

#### Pass arrays to API calls

The GitLab API sometimes accepts arrays of strings or integers. For example, to
restrict the sign-up e-mail domains of a GitLab instance to `*.example.com` and
`example.net`, you would do something like this:

```bash
curl -X PUT -H "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" -d "restricted_signup_domains[]=*.example.com" -d "restricted_signup_domains[]=example.net" https://gitlab.example.com/api/v3/application/settings
```

[cURL]: http://curl.haxx.se/ "cURL website"
[single spaces]: http://www.slate.com/articles/technology/technology/2011/01/space_invaders.html
[gfm]: http://docs.gitlab.com/ce/markdown/markdown.html#newlines "GitLab flavored markdown documentation"
[doc-restart]: ../administration/restart_gitlab.md "GitLab restart documentation"
