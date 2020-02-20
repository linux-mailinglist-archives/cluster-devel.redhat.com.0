Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id ADAC216602A
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 15:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582210648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=vYMLXD1xYbo8R0CYhcLfozOoy5EyIfE18bypbZMSvAA=;
	b=jF6ZR9Lb3H4Y8g0K9uYl8ifZxRMeZd2URdhScDDVpX9UtJsqtgCgnKaN2I6l7oLVPc4xoY
	jtNxu6kwthdhD8JgwCEV1nM+qdjhdps6CGQUx1S4LBxcan6gKLdHlgIBD48ZtlAMu9NuHu
	VeZ5KQaSDTe1pVYArFqGVJMU4Zhg+hY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-boxaIo1ANJqACQYmMrv7Jw-1; Thu, 20 Feb 2020 09:57:24 -0500
X-MC-Unique: boxaIo1ANJqACQYmMrv7Jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A050F18C43C1;
	Thu, 20 Feb 2020 14:57:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C10863A5;
	Thu, 20 Feb 2020 14:57:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BCCE8B2CC;
	Thu, 20 Feb 2020 14:57:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KEfVeW022714 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 09:41:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B9482166B30; Thu, 20 Feb 2020 14:41:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 870AD2166B2E
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 14:41:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 184861011E00
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 14:41:29 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-418-BxQRLwrEP4OyLK_XVNTBqg-1; Thu, 20 Feb 2020 09:41:26 -0500
X-MC-Unique: BxQRLwrEP4OyLK_XVNTBqg-1
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4e99460000>; Thu, 20 Feb 2020 06:35:50 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 20 Feb 2020 06:36:23 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 06:36:23 -0800
Received: from [10.2.165.18] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 20 Feb 2020 14:36:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>
Date: Thu, 20 Feb 2020 09:36:19 -0500
Message-ID: <DD2E8059-DA56-468F-9185-6C0082266067@nvidia.com>
In-Reply-To: <20200219210103.32400-5-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-5-willy@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
	HQMAIL107.nvidia.com (172.20.187.13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 09:57:15 -0500
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 04/24] mm: Move readahead nr_pages
 check into read_pages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed;
	boundary="=_MailMate_4CC2553B-18F9-4690-BE6D-05CCB84498AD_=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=_MailMate_4CC2553B-18F9-4690-BE6D-05CCB84498AD_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 19 Feb 2020, at 16:00, Matthew Wilcox wrote:

> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> Simplify the callers by moving the check for nr_pages and the BUG_ON
> into read_pages().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 61b15b6b9e72..9fcd4e32b62d 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -119,6 +119,9 @@ static void read_pages(struct address_space *mapping,=
 struct file *filp,
>  =09struct blk_plug plug;
>  =09unsigned page_idx;
>
> +=09if (!nr_pages)
> +=09=09return;
> +
>  =09blk_start_plug(&plug);
>
>  =09if (mapping->a_ops->readpages) {
> @@ -138,6 +141,8 @@ static void read_pages(struct address_space *mapping,=
 struct file *filp,
>
>  out:
>  =09blk_finish_plug(&plug);
> +
> +=09BUG_ON(!list_empty(pages));
>  }
>
>  /*
> @@ -180,8 +185,7 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
>  =09=09=09 * contiguous pages before continuing with the next
>  =09=09=09 * batch.
>  =09=09=09 */
> -=09=09=09if (nr_pages)
> -=09=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
> +=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
>  =09=09=09=09=09=09gfp_mask);
>  =09=09=09nr_pages =3D 0;
>  =09=09=09continue;
> @@ -202,9 +206,7 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
>  =09 * uptodate then the caller will launch readpage again, and
>  =09 * will then handle the error.
>  =09 */
> -=09if (nr_pages)
> -=09=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
> -=09BUG_ON(!list_empty(&page_pool));
> +=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
>  }
>
>  /*
> --=20
> 2.25.0

Looks good to me. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--
Best Regards,
Yan Zi

--=_MailMate_4CC2553B-18F9-4690-BE6D-05CCB84498AD_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBAgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl5OmWMPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKYawQAJnDCzvIOBkSaYYorEht2VZXHuWxGxkTwhkM
TvpQUkB3Cff2onVNqU2DPF0usuD2Nr1qda6WHnPwGeTbxCokAwTsFkkn8JhJkqVf
2/xydKKHCGEdaL5n8d86v6J0kQx6Do1jBCqLOIx0rGVuCL0apnya4jKfrNO4OCAb
T4pwf6/Qm2E2bBj3ISvybn/TYKq9WPpAu/ryMLNPidYqMqJiX4iqJ/RnBZ7srPcH
TutPMCYvOJ4oUtbTzYq6AHiFfANTGKnBBeiH3v9QdJAla6/7FeiL9G6fEwMK0C3g
FnzbqkYnPf+nR7a6Yg5ZejT33u9g7CP18xykij7jYUxPe7G1P2gVFflDIzkDie0+
LgYPICjmeYOKQxi2nrax2NpS+PqKq2mcGoZANosRwWvdlS0N/pUfOVZiCk2E8q7V
UIi0c16u5lhuGpTCd2Y0rDxpItZ/eh912iqaxkjhKqlgxNdO1n78/2tiAXf/JqD9
xt1LEjKMkDUxiqvvCvJNXONKWSyATDPWlwXZSdjMi0jjsdusO+74WDheJm9Y0ylN
o8+lS74JyYFdmRRMlyfPDeNDdIjLJf5FL1Ke+8vR85rwt0yBRY7CGj37O6LlCHMM
eo4carZ4q5rC3EnAG0+Lf3uYaQXCbr0R1vvZkqnLJZfJuhFdMjI0l7fb/02PBG3L
f+4j17Gl
=Jsz+
-----END PGP SIGNATURE-----

--=_MailMate_4CC2553B-18F9-4690-BE6D-05CCB84498AD_=--

