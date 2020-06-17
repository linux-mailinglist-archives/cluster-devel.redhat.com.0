Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBC41FC316
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Jun 2020 02:57:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592355461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pEQnZOnPBJbDchwbmEUUZLW0wYE5G6XsMaI0bdt7ET4=;
	b=BiDmGmlWpn+sfSoWvKMYTjCFG0tKBqOCicA+jVaMXxLo62RSZr0s7gpf1v6ATwoJZ3lUOP
	qeQ4U9vJ+YtGwegvqMna7WDoLXohMMUEHaO7+uysch1pZjBIx6W5t+Mpc5PujCLIJogImH
	jZsLInYyoIFuvPhExUGB6O+LK2okpe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-nWX44qqoOge37zgrjiKceQ-1; Tue, 16 Jun 2020 20:57:40 -0400
X-MC-Unique: nWX44qqoOge37zgrjiKceQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35CA5846375;
	Wed, 17 Jun 2020 00:57:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E860B60C80;
	Wed, 17 Jun 2020 00:57:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89CCE833A4;
	Wed, 17 Jun 2020 00:57:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05H0vYWQ030292 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 20:57:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9345010D14F3; Wed, 17 Jun 2020 00:57:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E70F10D14F0
	for <cluster-devel@redhat.com>; Wed, 17 Jun 2020 00:57:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2946A8007B1
	for <cluster-devel@redhat.com>; Wed, 17 Jun 2020 00:57:31 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-OOK1cW5tP5-PD6C58Gxk1g-1; Tue, 16 Jun 2020 20:57:27 -0400
X-MC-Unique: OOK1cW5tP5-PD6C58Gxk1g-1
Received: by mail-io1-f67.google.com with SMTP id u13so735343iol.10;
	Tue, 16 Jun 2020 17:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pEQnZOnPBJbDchwbmEUUZLW0wYE5G6XsMaI0bdt7ET4=;
	b=m6+y/XWoLdvxNb6Sb6IqEbdnuoLSCODgBTux7r50mIpn57Hri1VZMVTZsjwPI6VtOd
	mEtz/AtCRFGqcN/87Oip3C3PI8/MU42FgeEoo825yniUT+oSpu05TuH+kH2FH6604PER
	nK9yQINz/9eNGIMD/GZFWEiLNtboGXrkyDhDnxgKcwQTDGNsP4nZVo+yiU2BeO6CapGS
	ogqUmLssJe98ATscz5fiicqGvU0MWpzxJH8XjjzEHgDhxN6azSvg9WSOIwSSHU4f1Rjq
	0Ddckl/7URG9vU4KWkxtGZJvxH7bXvB5Oxkn2Wt3m+aUAurW/Q9Z2KOJNhOqpClfEcUg
	TAPw==
X-Gm-Message-State: AOAM532nv1kKdvNHTH6BiXiaPeJRN81cORTJGuzmMEpxrs4aot+jz6DG
	KPIM38uKPXsVpnDl9WftU9QhHFIbwqrz/w+KGqo=
X-Google-Smtp-Source: ABdhPJyA0Elba10YCloQoueU20W+3sFrfsTj5mkkigBe/qlBKVyzKzAbesXkHefLeqBLcqq7m6UegL8dAN6/zvs9CGg=
X-Received: by 2002:a5d:9413:: with SMTP id v19mr5708100ion.105.1592355445894; 
	Tue, 16 Jun 2020 17:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-17-willy@infradead.org>
	<CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
	<20200617003216.GC8681@bombadil.infradead.org>
In-Reply-To: <20200617003216.GC8681@bombadil.infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 17 Jun 2020 02:57:14 +0200
Message-ID: <CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, Linux-MM <linux-mm@kvack.org>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v11 16/25] fs: Convert mpage_readpages
	to mpage_readahead
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 17. Juni 2020 um 02:33 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
>
> On Wed, Jun 17, 2020 at 12:36:13AM +0200, Andreas Gruenbacher wrote:
> > Am Mi., 15. Apr. 2020 um 23:39 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >
> > > Implement the new readahead aop and convert all callers (block_dev,
> > > exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> > > reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.
> >
> > This patch leads to an ABBA deadlock in xfstest generic/095 on gfs2.
> >
> > Our lock hierarchy is such that the inode cluster lock ("inode glock")
> > for an inode needs to be taken before any page locks in that inode's
> > address space.
>
> How does that work for ...
>
> writepage:              yes, unlocks (see below)
> readpage:               yes, unlocks
> invalidatepage:         yes
> releasepage:            yes
> freepage:               yes
> isolate_page:           yes
> migratepage:            yes (both)
> putback_page:           yes
> launder_page:           yes
> is_partially_uptodate:  yes
> error_remove_page:      yes
>
> Is there a reason that you don't take the glock in the higher level
> ops which are called before readhead gets called?  I'm looking at XFS,
> and it takes the xfs_ilock SHARED in xfs_file_buffered_aio_read()
> (called from xfs_file_read_iter).

Right, the approach from the following thread might fix this:

https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@redhat.com/T/#t

Andreas

