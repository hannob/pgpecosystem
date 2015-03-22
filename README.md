Scripts to analyze the PGP key server data
==========================================

background
----------

 * [A look at the PGP ecosystem through the key server data (background paper)](http://eprint.iacr.org/2015/262)
 * [Slides from talk at BSidesHN](http://int21.de/slides/slides-pgp.pdf)

keyr
----

keyr will take concatenated PGP keys like the ones provided by key server
dumps as the input and will output mysql queries.

Usage:

`keyr [filename]`

The corresponding sql tables are in the file keyr.sql.

breakdsa
--------

Breaks DSA keys when two signatures with a duplicate k / r value are found.

Usage:

`breakdsa [filename]`

The script expects a 12-column input file (tab separated) with the following values:

 * col  1: Key ID of affected DSA key (only used for output info)
 * col  2: r value (same for both signatures)
 * col  3: s value of first signature
 * col  4: s value of second signature
 * col  5: hash value of first signature
 * col  6: hash value of second signature
 * col  7: p value of DSA key
 * col  8: q value of DSA key
 * col  9: g value of DSA key
 * col 10: y value of DSA key

All values are expected hex encoded.

The MySQL query to get the data pre-formatted to feed into this script is:

`SELECT a.keyid, a.dsa_r, a.dsa_s, b.dsa_s, a.hash, b.hash, c.dsa_p, c.dsa_q, c.dsa_g, c.dsa_y FROM sigs_dsa a JOIN sigs_dsa b JOIN keys_dsa c ON a.dsa_r = b.dsa_r AND a.dsa_s <> b.dsa_s AND a.keyid = c.keyid GROUP BY a.dsa_r INTO OUTFILE '/tmp/dsa-duplicate-r.txt';`

brutedsa
--------

Brute forces DSA keys for occurences of small k values.

Usage:

`brutedsa [filename]`

The script expects a 12-column input file (tab separated) with the following values:

 * col  1: Key ID of affected DSA key (only used for output info)
 * col  2: r value of signature
 * col  3: s value of signature
 * col  4: hash of signature
 * col  5: p value of key
 * col  6: q value of key
 * col  7: g value of key
 * col  8: y value of key

All values are expected hex encoded.

The MySQL query to get the data pre-formatted to feed into this script is:

`SELECT A.id,A.keyid,A.dsa_r,A.dsa_s,hash,dsa_p,dsa_q,dsa_g,dsa_y FROM sigs_dsa A LEFT JOIN keys_dsa B ON A.keyid = B.keyid INTO OUTFILE '/tmp/dsa-sigs-with-keys.txt';`

links
-----

* [Key server dumps](https://bitbucket.org/skskeyserver/sks-keyserver/wiki/KeydumpSources)
* [RFC 4880 (OpenPGP packet format)](https://tools.ietf.org/html/rfc4880)
* [PGP archive including source code](ftp://ftp.pgpi.org/pub/pgp)
* [Evil 32 - info about short PGP key ids](https://evil32.com/)
