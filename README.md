# cribl
Tools used in administration of Cribl LogStream


Cribl LogStream is extremely simple to administrate and manage with almost any Configuration Management tools. Here are a few simple examples.

To install, be aware of the following gotchas:

1. Decide user privileges for service account running Cribl. We recommend using the user 'cribl' in group 'cribl' with sudo access. Passwordless if that works for your systems.

The ansible script does not contain the stanzas to add sudo access for the cribl user, the Cribl administrator will have to own and complete that exercise on their own to prevent accidental use of this script without understanding administrative decisions around the cribl user.

All content is to be used and tested at user's own risk. 

# Released under MIT license 

Copyright (c) 2021 Louise Tang

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
