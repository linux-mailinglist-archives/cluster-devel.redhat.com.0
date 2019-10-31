Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 427FBEAAFD
	for <lists+cluster-devel@lfdr.de>; Thu, 31 Oct 2019 08:37:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572507450;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q6gbKsbdqVarCXNzQJvdwtpXxpkbRppn3ghjRWsph3E=;
	b=UtqkFJmQFdeEojbzhWteQKYIwNgI/Wf2A8ok0DHzMtA79JaAQLKBn5SNWZ1NPabW6GNY6G
	wayfw3ruQvo+PmjPu3pZfLx/Z2oC0vXE7SVfnYR1bn3IvbM2vZqCezpHqCrk7RhZnoctoQ
	EwsSklUGTZs6b6F92UB6Wb2GiVWVyBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-k1hkvjhLO2aMPb_jW71tng-1; Thu, 31 Oct 2019 03:37:28 -0400
X-MC-Unique: k1hkvjhLO2aMPb_jW71tng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCB53800D49;
	Thu, 31 Oct 2019 07:37:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAC931001938;
	Thu, 31 Oct 2019 07:37:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 368DB4BB65;
	Thu, 31 Oct 2019 07:37:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9V7bGPU029000 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 03:37:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3CC875D6D6; Thu, 31 Oct 2019 07:37:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (juicyfruit.brq.redhat.com [10.34.129.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AA285D6A3;
	Thu, 31 Oct 2019 07:37:13 +0000 (UTC)
Date: Thu, 31 Oct 2019 08:37:10 +0100
From: Jan =?utf-8?Q?Pokorn=C3=BD?= <jpokorny@redhat.com>
To: developers@clusterlabs.org
Message-ID: <20191031073710.GC19093@redhat.com>
Mail-Followup-To: developers@clusterlabs.org, cluster-devel@redhat.com
MIME-Version: 1.0
In-Reply-To: <d4aa46b2-5139-4e5d-d607-ac4c25f84057@alteeve.ca>
	<f8efc895-19a0-c12e-7cfb-845d879a89d6@alteeve.ca>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Building clufter on EL8
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline

--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Digimer o/

On 30/10/19 16:24 -0400, Digimer wrote:
> While waiting to see what CentOS 8 will do with regard to HA,

you are not the only surprised here

> I decided to rebuild the rhel 8 packages for our own repo[1]. To
> this end, I've rebuilt all packages, except clufter.
>=20
>   The clufter package relies on jing, and jing is not provided in RHEL
> 8. Obviously, clufter was build for RHEL 8, so I'm curious how this was
> done...

Note that buildroot packages are a superset of packages available
through the main channels, for various non-technical reasons,
e.g. giving up on support for such.  Brand new for RHEL 8 are
"no support" channels like Code Ready Builder (CRB), and it might
be there, or not.

Frankly, I've put quite some effort to have jing (and sibling, trang)
up for straightforward grab, but it was basically killed in/by the
process without receiving any further support, leaving me detached
altogether on these political basis.  Can consider myself lucky to
at least have jing in said buildroot :-/

> I started the process of building jing myself, but very quickly fell
> into a very deep dependency well.
>=20

> Tips?

Your options are:

1. use jing (and a very few deps, perhaps) from said CBR (if
   available), Fedora or older CentOS

2. edit spec file so that it skips jing-involved steps altogher;
   note that such measure was added only to provide additional
   guarantee that even if clufter itself is not updated, at least,
   on every rebuild (such as in various mass ones in Fedora),
   the newest schema from pacemaker at the time will be automatically
   adopted (clufter requires single-file type of schemas, whereas
   pacemaker is shipped with decomposed file hierarchy of these,
   and to that end, there is no known way to aggregate the content
   like this, except for some unmaintained XSL stylesheet I found
   back then and did not exactly trust it), but for generic use
   case, it shall be OK to use even older bundled versions, and as
   mentioned earlier, there was no allocation for clufter to catch
   up on various aspects of the recent development, meaning that
   3.0+ schema support is on may-work basis


Btw. I am a long time prononent of engaging jing validator in
pacemaker itself, since libxml2 based RelaxNG schema validation
is not capable of precise diagnostics, and is prone to bad
performance (compared to jing, due to the nature of different
approaches, I believe) for more complex documents (and/or grammars).
I.e. what we have in pacemaker right now downright hurts the
user experience shall there be violations in the base XML.
Beside, libxml2 RelaxNG schema validation tends to be buggy
to this day (just a few months back, I fixed some of these
long lurking issues, but some aside regression tests effectively
require jing because of that).


P.S. I noticed you've sent the question also to cluster-devel
     beside developers@c.o ML without actually sending just
     a singleton, meaning I cannot reply-all conveniently,
     but I tried my best to cover that.

--=20
Jan (Poki)

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJduo8mAAoJEGG7sjqej43i9J4QALrzRlVJL9iGwGgilouFRHik
oo2zsKXR6XKR8u1huxuWyeDGOXAbP1l0uioouV1j4ogu6xIMhiRVEbyDX1mJm4VS
l9xyRJip1d/+vnOHGM2YlR6kwKeKt23H72MfJH30ShmzNvbGJEIEvdTWzNsLAHL6
KzmcZ6pS5MwdIDFlTGztgfWxCACsWgFlRn5cbzALAB58vkZl21LUyD2aDeOLKFvg
O7t88HX7OcDKWoQwkdl8Z3GpgM8wYWHVs7LdSKRuiuPftSAxjGqi9VsaCEdLC/6B
OOcN7qpmrmRkEh530wJ70sNT+2rxDVrLladgaMNV520V2q7rXsfKvB+pvXkQc3D7
c0iReVKrEMsbXGAH28BBafyghBWtU2Gn+UOPgtea1Vum6lICFUaibEyWyM+VsmUb
msBjVFSdXGWOVZWjhdXnunClYMGjlMaeVQ+HMbKWqzJ4N8vJ/LWSQrOcDGTEf5rw
uXHbn1Qq4yPcfBP8r5odRlODspc0f6q9Gji0pz6/Y1ONk7EwO+wkczJU2Xr4MAfI
aBHRVyjJCATuXC+yqb3FadQvzmIShoSX22Y+hp1M4wk4De5cpmBcbsbFWixLc4Sa
WjwcZIq5Bvg3okr9BcsHdGZs2T9XTq1hQNQ9sTtYjnbTYinN4XE4VIWPdE/u6Ho7
9Mv5vOBkC/fTAy0/wYTt
=AMes
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--

