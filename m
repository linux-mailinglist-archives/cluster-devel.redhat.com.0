Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CD19216200F
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 06:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582002522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0IHyMO+i/Cv5oO1nVANmwUh3006KsILljH1kK13GlLI=;
	b=AG0RwUgn75AxFlueDyS6h5KeyVWNjRKN3wSpBcB9XGCBDF+cjnFsCO3GIl2farlAqxi8Rl
	j+P5E7jRoH18Xs9849bNsaBUthFbpTWqxIY5FuIZgPV7aenB4B8cxI+GDNd7ky56jiqMoN
	dpAdsWoYmHZ7HE1X2SAJNrvgvNxZdkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-3hwOqghZPTCI5X1wCLLlXA-1; Tue, 18 Feb 2020 00:08:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EAFC107ACC4;
	Tue, 18 Feb 2020 05:08:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 283E710027A3;
	Tue, 18 Feb 2020 05:08:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79BE11809567;
	Tue, 18 Feb 2020 05:08:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I58Ybe025676 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 00:08:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4A65D9602; Tue, 18 Feb 2020 05:08:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3EED960D
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 05:08:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 579B61800F1A
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 05:08:32 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-275-Qp1O47-vOiiHUT8jvOW0XA-1; Tue, 18 Feb 2020 00:08:29 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 415077E9CE8;
	Tue, 18 Feb 2020 16:08:26 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j3v7Q-0005sF-Jw; Tue, 18 Feb 2020 16:08:24 +1100
Date: Tue, 18 Feb 2020 16:08:24 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218050824.GJ10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-5-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-5-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=xb1gzgCgqvQNCHvA9YAA:9
	a=NFtlFkhSHy5C-G_b:21 a=QFM0elaIi_6nPVwS:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: Qp1O47-vOiiHUT8jvOW0XA-1
X-MC-Unique: 3hwOqghZPTCI5X1wCLLlXA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I58Ybe025676
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 04/19] mm: Rearrange readahead loop
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 10:45:45AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Move the declaration of 'page' to inside the loop and move the 'kick
> off a fresh batch' code to the end of the function for easier use in
> subsequent patches.

Stale? the "kick off" code is moved to the tail of the loop, not the
end of the function.

> @@ -183,14 +183,14 @@ void __do_page_cache_readahead(struct address_space=
 *mapping,
>  =09=09page =3D xa_load(&mapping->i_pages, page_offset);
>  =09=09if (page && !xa_is_value(page)) {
>  =09=09=09/*
> -=09=09=09 * Page already present?  Kick off the current batch of
> -=09=09=09 * contiguous pages before continuing with the next
> -=09=09=09 * batch.
> +=09=09=09 * Page already present?  Kick off the current batch
> +=09=09=09 * of contiguous pages before continuing with the
> +=09=09=09 * next batch.  This page may be the one we would
> +=09=09=09 * have intended to mark as Readahead, but we don't
> +=09=09=09 * have a stable reference to this page, and it's
> +=09=09=09 * not worth getting one just for that.
>  =09=09=09 */
> -=09=09=09if (readahead_count(&rac))
> -=09=09=09=09read_pages(&rac, &page_pool, gfp_mask);
> -=09=09=09rac._nr_pages =3D 0;
> -=09=09=09continue;
> +=09=09=09goto read;
>  =09=09}
> =20
>  =09=09page =3D __page_cache_alloc(gfp_mask);
> @@ -201,6 +201,11 @@ void __do_page_cache_readahead(struct address_space =
*mapping,
>  =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
>  =09=09=09SetPageReadahead(page);
>  =09=09rac._nr_pages++;
> +=09=09continue;
> +read:
> +=09=09if (readahead_count(&rac))
> +=09=09=09read_pages(&rac, &page_pool, gfp_mask);
> +=09=09rac._nr_pages =3D 0;
>  =09}

Also, why? This adds a goto from branched code that continues, then
adds a continue so the unbranched code doesn't execute the code the
goto jumps to. In absence of any explanation, this isn't an
improvement and doesn't make any sense...

--=20
Dave Chinner
david@fromorbit.com


