Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 022831634E6
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 22:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582061230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Iwlzb9LfX5FSerT3SwTjRDrPyxCWD5MN2vHzl/ftCvI=;
	b=HP8W48zXeS5lyBwSq+F2OqkpkCDhakyn8hajbslgaVfEYqjHBZ9n5/LpET/4cddJDdmSmO
	qF8AFawka6pMy2xQ2JKRVkVj/qx6+I6/1lHki3OXfYAY/Vg4iCbprTlKWD++vtSxeo3ldt
	J/n3bKBOwYW2a3+C5rbCPlHP+yb5a4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-t1UpeNijNIOO_b4zTMOrtQ-1; Tue, 18 Feb 2020 16:27:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3639D107ACC5;
	Tue, 18 Feb 2020 21:27:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2024619756;
	Tue, 18 Feb 2020 21:27:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB53835AF5;
	Tue, 18 Feb 2020 21:27:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01ILR24G019561 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 16:27:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6B9192063206; Tue, 18 Feb 2020 21:27:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6642B2026D67
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 21:26:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBBDD867B03
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 21:26:59 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-71-2WpHlN5vOxyqCOsd7UT9vQ-1; Tue, 18 Feb 2020 16:26:57 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 0B3B97EA1A6;
	Wed, 19 Feb 2020 08:26:54 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4AOK-0003K5-Rm; Wed, 19 Feb 2020 08:26:52 +1100
Date: Wed, 19 Feb 2020 08:26:52 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218212652.GR10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200218045633.GH10776@dread.disaster.area>
	<20200218134230.GN7778@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200218134230.GN7778@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=l697ptgUJYAA:10
	a=7-415B0cAAAA:8 a=13k90lvrXjaGpILklQQA:9 a=QEXdDO2ut3YA:10
	a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: 2WpHlN5vOxyqCOsd7UT9vQ-1
X-MC-Unique: t1UpeNijNIOO_b4zTMOrtQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01ILR24G019561
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 00/19] Change readahead API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 05:42:30AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 03:56:33PM +1100, Dave Chinner wrote:
> > Latest version in your git tree:
> >=20
> > $ =E2=96=B6 glo -n 5 willy/readahead
> > 4be497096c04 mm: Use memalloc_nofs_save in readahead path
> > ff63497fcb98 iomap: Convert from readpages to readahead
> > 26aee60e89b5 iomap: Restructure iomap_readpages_actor
> > 8115bcca7312 fuse: Convert from readpages to readahead
> > 3db3d10d9ea1 f2fs: Convert from readpages to readahead
> > $
> >=20
> > merged into a 5.6-rc2 tree fails at boot on my test vm:
> >=20
> > [    2.423116] ------------[ cut here ]------------
> > [    2.424957] list_add double add: new=3Dffffea000efff4c8, prev=3Dffff=
8883bfffee60, next=3Dffffea000efff4c8.
> > [    2.428259] WARNING: CPU: 4 PID: 1 at lib/list_debug.c:29 __list_add=
_valid+0x67/0x70
> > [    2.457484] Call Trace:
> > [    2.458171]  __pagevec_lru_add_fn+0x15f/0x2c0
> > [    2.459376]  pagevec_lru_move_fn+0x87/0xd0
> > [    2.460500]  ? pagevec_move_tail_fn+0x2d0/0x2d0
> > [    2.461712]  lru_add_drain_cpu+0x8d/0x160
> > [    2.462787]  lru_add_drain+0x18/0x20
>=20
> Are you sure that was 4be497096c04 ?  I ask because there was a

Yes, because it's the only version I've actually merged into my
working tree, compiled and tried to run. :P

> version pushed to that git tree that did contain a list double-add
> (due to a mismerge when shuffling patches).  I noticed it and fixed
> it, and 4be497096c04 doesn't have that problem.  I also test with
> CONFIG_DEBUG_LIST turned on, but this problem you hit is going to be
> probabilistic because it'll depend on the timing between whatever other
> list is being used and the page actually being added to the LRU.

I'll see if I can reproduce it.

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


