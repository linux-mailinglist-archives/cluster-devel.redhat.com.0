Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 93696168997
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Feb 2020 22:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582321760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s3g96ll++b9HvCijdjnovmbzPQTuKEUImB5NW4BkksY=;
	b=BP4JaeJyMh+CvsYOBIZxHFDECLWBg7rybet4NCXnIVWC03hALrmCVCV87yq+UebAC1JCIw
	YVto43HseirwUNHbpM5f1akzxacjf76OTqD91ZU2vJst4Iy7wsoprV5PscXMUB6lPKwwHC
	3tb7rieIxAZX5kVuY9+wIlxbYcp5/rY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-_AkyGv8eNyerZKCEdDk-wA-1; Fri, 21 Feb 2020 16:49:18 -0500
X-MC-Unique: _AkyGv8eNyerZKCEdDk-wA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA13A1005510;
	Fri, 21 Feb 2020 21:49:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D6115D9E2;
	Fri, 21 Feb 2020 21:49:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3890B860C5;
	Fri, 21 Feb 2020 21:49:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01LLn5CX027805 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 16:49:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1DE6616543F; Fri, 21 Feb 2020 21:49:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1891F165435
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 21:49:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1C1785A304
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 21:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-365-YwMHBN-cPeC3cyfc_nWYew-1; Fri, 21 Feb 2020 16:49:00 -0500
X-MC-Unique: YwMHBN-cPeC3cyfc_nWYew-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j5GAH-0001lk-Uz; Fri, 21 Feb 2020 21:48:53 +0000
Date: Fri, 21 Feb 2020 13:48:53 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200221214853.GF24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-2-willy@infradead.org>
	<e065679e-222f-7323-9782-0c4471bb9233@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <e065679e-222f-7323-9782-0c4471bb9233@nvidia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01LLn5CX027805
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 01/24] mm: Move readahead prototypes
	from mm.h
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 06:43:31PM -0800, John Hubbard wrote:
> Yes. But I think these files also need a similar change:
>=20
>     fs/btrfs/disk-io.c

That gets pagemap.h through ctree.h, so I think it's fine.  It's
already using mapping_set_gfp_mask(), so it already depends on pagemap.h.

>     fs/nfs/super.c

That gets it through linux/nfs_fs.h.

I was reluctant to not add it to blk-core.c because it doesn't seem
necessarily intuitive that the block device core would include pagemap.h.

That said, blkdev.h does include pagemap.h, so maybe I don't need to
include it here.

> ...because they also use VM_READAHEAD_PAGES, and do not directly include
> pagemap.h yet.

> > +#define VM_READAHEAD_PAGES=09(SZ_128K / PAGE_SIZE)
> > +
> > +void page_cache_sync_readahead(struct address_space *, struct file_ra_=
state *,
> > +=09=09struct file *, pgoff_t index, unsigned long req_count);
>=20
> Yes, "struct address_space *mapping" is weird, but I don't know if it's
> "misleading", given that it's actually one of the things you have to lear=
n
> right from the beginning, with linux-mm, right? Or is that about to chang=
e?
>=20
> I'm not asking to restore this to "struct address_space *mapping", but I =
thought
> it's worth mentioning out loud, especially if you or others are planning =
on
> changing those names or something. Just curious.

No plans (on my part) to change the name, although I have heard people
grumbling that there's very little need for it to be a separate struct
from inode, except for the benefit of coda, which is not exactly a
filesystem with a lot of users ...

Anyway, no plans to change it.  If there were something _special_ about
it like a theoretical:

void mapping_dedup(struct address_space *canonical,
=09=09struct address_space *victim);

then that's useful information and shouldn't be deleted.  But I don't
think the word 'mapping' there conveys anything useful (other than the
convention is to call a 'struct address_space' a mapping, which you'll
see soon enough once you look at any of the .c files).


