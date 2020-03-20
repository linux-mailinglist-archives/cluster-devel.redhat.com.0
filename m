Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id B180E18D5F0
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 18:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584725873;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LyZDSU20jKIIlyUPZb1YCPNtMa1ZasTL+nQqVmB6GBg=;
	b=PH1+xm8JQhHtXu0TwJZaDbT/eXEYTHPPaklP7k3CURxP3teqWB9ljtnz/HbJkccRBV8Oaw
	afy+TrKCPemwpI0hitxnP7PJI5wwHJCORvF+e2b6ueLlgPaEeSX0BwJHcX6wVyWjN+oTf1
	bC28DEztEezQB6uNvDW4OX9JVUnFTco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-vFukQyzJMua8FA30GJXbJQ-1; Fri, 20 Mar 2020 13:37:49 -0400
X-MC-Unique: vFukQyzJMua8FA30GJXbJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A2218FF676;
	Fri, 20 Mar 2020 17:37:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D7F05DA85;
	Fri, 20 Mar 2020 17:37:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA72818089CD;
	Fri, 20 Mar 2020 17:37:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KHbhUP029770 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 13:37:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C5C12166AE8; Fri, 20 Mar 2020 17:37:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07CE62166AE4
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 17:37:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD7368F68F8
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 17:37:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-263-47JswQesOry12rNOgVmtRQ-1;
	Fri, 20 Mar 2020 13:37:37 -0400
X-MC-Unique: 47JswQesOry12rNOgVmtRQ-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4B72C20722;
	Fri, 20 Mar 2020 17:37:36 +0000 (UTC)
Date: Fri, 20 Mar 2020 10:37:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320173734.GD851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-21-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200320142231.2402-21-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KHbhUP029770
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v9 20/25] ext4: Convert from readpages
	to readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 07:22:26AM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Use the new readahead operation in ext4
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  fs/ext4/ext4.h     |  3 +--
>  fs/ext4/inode.c    | 21 +++++++++------------
>  fs/ext4/readpage.c | 22 ++++++++--------------
>  3 files changed, 18 insertions(+), 28 deletions(-)
>=20

Reviewed-by: Eric Biggers <ebiggers@google.com>

> +=09=09if (rac) {
> +=09=09=09page =3D readahead_page(rac);
>  =09=09=09prefetchw(&page->flags);
> -=09=09=09list_del(&page->lru);
> -=09=09=09if (add_to_page_cache_lru(page, mapping, page->index,
> -=09=09=09=09  readahead_gfp_mask(mapping)))
> -=09=09=09=09goto next_page;
>  =09=09}

Maybe the prefetchw(&page->flags) should be included in readahead_page()?
Most of the callers do it.

- Eric


