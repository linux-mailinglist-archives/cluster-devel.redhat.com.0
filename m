Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 012BB163B86
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 04:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582083819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QgHpGr4/9f/Bh853Nyqj46KVubBOgmLJN02IPlZWtDg=;
	b=JZTvveLJhLhO0ygFFHo3OUfiqjB1AwIsBqhbU/DSg8SMq3G/frx4ps2i9iZVYT0F9OKKuf
	1xNW1WXWnQXcbFJrBXM2FBOVpejdMece28EYX4+DH2G4Lbftwq1PaOZ/IqFUsy4b5HbTCJ
	/6yNz1GEHhV9p16OWP0rAeV0BUn2L9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-32cAdeaeP2StMt47vHEeBQ-1; Tue, 18 Feb 2020 22:43:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 357BD800D48;
	Wed, 19 Feb 2020 03:43:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21BAC10021B2;
	Wed, 19 Feb 2020 03:43:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BF5718089C8;
	Wed, 19 Feb 2020 03:43:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J3hVsw008004 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 22:43:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 87BD0D93C4; Wed, 19 Feb 2020 03:43:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83456DBF30
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:43:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0137801E9B
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:43:29 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-342-eNaJwvAKNf-UAyMoLt0fXw-1; Tue, 18 Feb 2020 22:43:27 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 880BB3A1C09;
	Wed, 19 Feb 2020 14:43:25 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4GGi-0005Z3-WB; Wed, 19 Feb 2020 14:43:25 +1100
Date: Wed, 19 Feb 2020 14:43:24 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219034324.GG10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-33-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-33-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8 a=7-415B0cAAAA:8
	a=EUu7BJ-CshYY2WUz2RUA:9 a=Ins956pMss7IOATM:21 a=TqZTP-Om_uFHSJHF:21
	a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=WzC6qhA0u3u7Ye7llzcV:22
	a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: eNaJwvAKNf-UAyMoLt0fXw-1
X-MC-Unique: 32cAdeaeP2StMt47vHEeBQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J3hVsw008004
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org,
	Cong Wang <xiyou.wangcong@gmail.com>, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 19/19] mm: Use memalloc_nofs_save in
	readahead path
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

On Mon, Feb 17, 2020 at 10:46:13AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Ensure that memory allocations in the readahead path do not attempt to
> reclaim file-backed pages, which could lead to a deadlock.  It is
> possible, though unlikely this is the root cause of a problem observed
> by Cong Wang.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
> Suggested-by: Michal Hocko <mhocko@suse.com>
> ---
>  mm/readahead.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 94d499cfb657..8f9c0dba24e7 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -22,6 +22,7 @@
>  #include <linux/mm_inline.h>
>  #include <linux/blk-cgroup.h>
>  #include <linux/fadvise.h>
> +#include <linux/sched/mm.h>
> =20
>  #include "internal.h"
> =20
> @@ -174,6 +175,18 @@ void page_cache_readahead_limit(struct address_space=
 *mapping,
>  =09=09._nr_pages =3D 0,
>  =09};
> =20
> +=09/*
> +=09 * Partway through the readahead operation, we will have added
> +=09 * locked pages to the page cache, but will not yet have submitted
> +=09 * them for I/O.  Adding another page may need to allocate memory,
> +=09 * which can trigger memory reclaim.  Telling the VM we're in
> +=09 * the middle of a filesystem operation will cause it to not
> +=09 * touch file-backed pages, preventing a deadlock.  Most (all?)
> +=09 * filesystems already specify __GFP_NOFS in their mapping's
> +=09 * gfp_mask, but let's be explicit here.
> +=09 */
> +=09unsigned int nofs =3D memalloc_nofs_save();
> +

So doesn't this largely remove the need for all the gfp flag futzing
in the readahead path? i.e. almost all readahead allocations are now
going to be GFP_NOFS | GFP_NORETRY | GFP_NOWARN ?

If so, shouldn't we just strip all the gfp flags and masking out of
the readahead path altogether?

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


