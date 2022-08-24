Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6D25A0339
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Aug 2022 23:19:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661375941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0BGLeIeywCEJ3dCddcIl7kkPKUm3a3EcT3lVsS2hi5Q=;
	b=Z9VgIpmVlNZq/ZHYpmoDoBZE8QemXVWAURMsL9Y00AheePNbmhe2V6ppMJEfVAb4v2x9s1
	ZY6aYk54kVuTJJSWkngaK08gmKNJyOw6HOxWZHHZHXALzOiproQiUgdYH+E9hsWBXeZT7A
	HthjEXLyRmxN8cD4x39u9ENJZ6I6H+E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-__W15j0NOCiPD2oHneODxw-1; Wed, 24 Aug 2022 17:19:00 -0400
X-MC-Unique: __W15j0NOCiPD2oHneODxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F5223C0F376;
	Wed, 24 Aug 2022 21:18:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D41F40CF8EF;
	Wed, 24 Aug 2022 21:18:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2FAF61946A5E;
	Wed, 24 Aug 2022 21:18:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 088A61946A43 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 20:08:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 924B4C15BBA; Wed, 24 Aug 2022 20:08:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ECB7C15BB3
 for <cluster-devel@redhat.com>; Wed, 24 Aug 2022 20:08:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C1D31C004F1
 for <cluster-devel@redhat.com>; Wed, 24 Aug 2022 20:08:43 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-386-sDSnGPsnMkiyA4ODsFD0AQ-1; Wed,
 24 Aug 2022 16:08:41 -0400
X-MC-Unique: sDSnGPsnMkiyA4ODsFD0AQ-1
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=cGo8IqrG/KMEITictY7c3nGCM3fN
 8IhhTVEah6GE6VI=; b=Q+De1sStZ3EMtn0rk0NMKRhepZ0v1mmx+EIFS1Dan3Zo
 fHV8fjTU5Gmbana/BPunGB4IUkyu3HKhb2PRimrsnFXDeOXa9T/uavq/uDl3IKDQ
 HOS8biVFgncyIhY1PF6oRqTMd/Of3AnAQzoOuA7F6WhP6M0IwRDp7zlWzgzVwBo=
Received: (qmail 2367966 invoked from network); 24 Aug 2022 22:08:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 24 Aug 2022 22:08:39 +0200
X-UD-Smtp-Session: l3s3148p1@f20gPwLnwIcgAwDtxwoDABxA2q3xYuRb
Date: Wed, 24 Aug 2022 22:08:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andrew Price <anprice@redhat.com>
Message-ID: <YwaFRvWw5hi/uWYs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andrew Price <anprice@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>
References: <20220818210144.7915-1-wsa+renesas@sang-engineering.com>
 <bd7275c6-4ebe-de99-75c2-400cfa2e5026@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4Tos7O8I/5EpltQ3"
Content-Disposition: inline
In-Reply-To: <bd7275c6-4ebe-de99-75c2-400cfa2e5026@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH] gfs2: move from strlcpy with unused
 retval to strscpy
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1


--4Tos7O8I/5EpltQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy.

> > -	strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> > -	strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
> > +	strscpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> > +	strscpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
>=20
> Perhaps the size should be changed to GFS2_LOCKNAME_LEN to match the size=
 of
> the destination, too.
>=20
> With that addition, this patch fixes this syzkaller report:
>=20
> https://listman.redhat.com/archives/cluster-devel/2022-August/022755.html

Linus wrote another summary about strlcpy vs. strscpy use[1]. So, the
size argument should be the size of the smaller buffer if the buffers
are of different size. GFS2_LOCKNAME_LEN is smaller, so that looks
suitable. Shall I resend the patch with the suggested change?

All the best,

   Wolfram

[1] https://lore.kernel.org/lkml/CAHk-=3Dwi+xbVq++uqW9YgWpHjyBHNB8a-xad+Xp2=
3-B+eodLCEA@mail.gmail.com/


--4Tos7O8I/5EpltQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMGhUYACgkQFA3kzBSg
KbZFCw//Uv87sZJFYRzCSSRxchAgtLlyCFwPcJBZHh6W85/umoJN6WDBWqcUS8IN
+vCugF8lo2gUkBvQxfltmEP39oVI9aDdNSz+d5OPt1vCBfkRu5JMAa/jUQxHEGzm
vmmILcol1Zr+GYbbcDu3qxV44EPoHdvMjLzJ2FEZP5ODIy/zDNIsLxtdSupjR1ut
YsWH6LT5i9jZrrC+PpHecxGC3wU9dIsGcxgwhpR9Mz3/M0YwxU3DQb4hMAIEh3Yg
yedUz71kLZqjC9nuXbVZnfhwEOolDXgt6j6wdkM0F5/TL6et6a4pPUaO6U560FgM
SeORpAYWbLAizkdS+2/LrebOG3ZSGhyi1O1ty735J40RuE9XzP+fmmyN9D5MdmOe
PYundwj3LbDy5CK7jRPd/AV36Wu0Z8c/zThZoTmTSL0e0S3ZWp2oxNpwwBVJGZWd
LJ/teDfKB0fj1IoG3MdiurtU5S5Dk8Z83ahNcthWINeL183JSTeA7qw3FiawTXiP
u2xQ5hq9nenUBy7F0S5MU1nyQrnGpraLzpY/UVEAeW1McZ6K/IAYB6O5hV30O7Cg
aup1oQEmIYM65/jHU0fgj1yBi39luLF/RQ0JKL5nV3YnAXZPyYVZWPaSyVb8C+xt
69QAaFnB/+rITWKMTlUURgPfSZ3xyp928Pg5lKOo0ogtFNA25FE=
=LSxC
-----END PGP SIGNATURE-----

--4Tos7O8I/5EpltQ3--

