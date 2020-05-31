Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C2E861E9A82
	for <lists+cluster-devel@lfdr.de>; Sun, 31 May 2020 23:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590960204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Txi1aq/FbpssSHm13WFq8FHI+yAKUy+v78xX4plKyI4=;
	b=HApzau/NmyCVJigqmNeMnYckyE7SmBZJdkVzs0He7F+w/QgJv/hbjee1AaIjAOvnU29RUS
	NXWAjvwEsQk3YS1UomwE693DsrH+WNmKvbiXjqee1egir7h1sT/A0zvcsxNwT5r2OkxLdy
	X3DfSRGTli+30M7xseO04vxga+31XPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-U4Xx4EMdMO-3xbyBnE7USg-1; Sun, 31 May 2020 17:23:22 -0400
X-MC-Unique: U4Xx4EMdMO-3xbyBnE7USg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E405C460;
	Sun, 31 May 2020 21:23:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1B2D60C81;
	Sun, 31 May 2020 21:23:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DAF17F1EB;
	Sun, 31 May 2020 21:23:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04VLN9g9008111 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 31 May 2020 17:23:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 216662157F25; Sun, 31 May 2020 21:23:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBD562166B27
	for <cluster-devel@redhat.com>; Sun, 31 May 2020 21:23:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A7048007C8
	for <cluster-devel@redhat.com>; Sun, 31 May 2020 21:23:06 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-43-BZBu6FhPMueUBzpAnQzssQ-1; Sun, 31 May 2020 17:23:01 -0400
X-MC-Unique: BZBu6FhPMueUBzpAnQzssQ-1
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id F0CF31C0BD2; Sun, 31 May 2020 23:22:58 +0200 (CEST)
Date: Sun, 31 May 2020 23:22:58 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20200531212258.GA9004@amd>
References: <20200522145120.434921-1-sashal@kernel.org>
	<20200522145120.434921-10-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200522145120.434921-10-sashal@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH AUTOSEL 4.19 10/19] gfs2: don't call
 quota_unhold if quotas are not locked
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit c9cb9e381985bbbe8acd2695bbe6bd24bf06b81c ]
>=20
> Before this patch, function gfs2_quota_unlock checked if quotas are
> turned off, and if so, it branched to label out, which called
> gfs2_quota_unhold. With the new system of gfs2_qa_get and put, we
> no longer want to call gfs2_quota_unhold or we won't balance our
> gets and puts.

4.19 does not yet contain gfw2_qa_get; according to the changelog that
means that this patch is not suitable for 4.19 kernel.

Best regards,
=09=09=09=09=09=09=09=09Pavel
=09=09=09=09=09=09=09=09
> index dd0f9bc13164..ce47c8233612 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -1116,7 +1116,7 @@ void gfs2_quota_unlock(struct gfs2_inode *ip)
>  =09int found;
> =20
>  =09if (!test_and_clear_bit(GIF_QD_LOCKED, &ip->i_flags))
> -=09=09goto out;
> +=09=09return;
> =20
>  =09for (x =3D 0; x < ip->i_qadata->qa_qd_num; x++) {
>  =09=09struct gfs2_quota_data *qd;
> @@ -1153,7 +1153,6 @@ void gfs2_quota_unlock(struct gfs2_inode *ip)
>  =09=09=09qd_unlock(qda[x]);
>  =09}
> =20
> -out:
>  =09gfs2_quota_unhold(ip);
>  }
> =20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7UIDIACgkQMOfwapXb+vJu0wCgjsov0xQd93uDe72Sr3YqhVNv
EPgAniLulgMO2BTGivnJWdmZeVqcclxO
=TKQj
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

