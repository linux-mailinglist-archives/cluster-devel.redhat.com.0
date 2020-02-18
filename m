Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9955616274E
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 14:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582033378;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UyqxWx3MZsiYCSMqctE9kDwcwOkGxBo9tPIwHiy3LF8=;
	b=H2ulWcvDhnpRDW5Gk8iML93b81/9V4y3kTfu0dVPZL2KTTM3/D5Ra+StdwSH7zYmMtojHs
	Pl0qKyH6xYx62FNKTxVtC3a+HEMJqVfpN3OF1m2PxIA4nk0zwNhYHAw0vjBbXDOM6lD9Cs
	xuqYQpif1ZKOujqvdGKUkh2nJvCp5MU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-v0DjUC8jPjiG83P9_iGfYg-1; Tue, 18 Feb 2020 08:42:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7ED5DB61;
	Tue, 18 Feb 2020 13:42:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAF5188859;
	Tue, 18 Feb 2020 13:42:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D6D335AE2;
	Tue, 18 Feb 2020 13:42:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IDglPE023181 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 08:42:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0659120230A9; Tue, 18 Feb 2020 13:42:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01FA02026D69
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 13:42:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7A1C8001F2
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 13:42:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-28-PwE6D21OPaO5efK6TEKigA-1; Tue, 18 Feb 2020 08:42:40 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j438w-0002EE-C5; Tue, 18 Feb 2020 13:42:30 +0000
Date: Tue, 18 Feb 2020 05:42:30 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218134230.GN7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200218045633.GH10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200218045633.GH10776@dread.disaster.area>
X-MC-Unique: PwE6D21OPaO5efK6TEKigA-1
X-MC-Unique: v0DjUC8jPjiG83P9_iGfYg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IDglPE023181
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 03:56:33PM +1100, Dave Chinner wrote:
> Latest version in your git tree:
>=20
> $ =E2=96=B6 glo -n 5 willy/readahead
> 4be497096c04 mm: Use memalloc_nofs_save in readahead path
> ff63497fcb98 iomap: Convert from readpages to readahead
> 26aee60e89b5 iomap: Restructure iomap_readpages_actor
> 8115bcca7312 fuse: Convert from readpages to readahead
> 3db3d10d9ea1 f2fs: Convert from readpages to readahead
> $
>=20
> merged into a 5.6-rc2 tree fails at boot on my test vm:
>=20
> [    2.423116] ------------[ cut here ]------------
> [    2.424957] list_add double add: new=3Dffffea000efff4c8, prev=3Dffff88=
83bfffee60, next=3Dffffea000efff4c8.
> [    2.428259] WARNING: CPU: 4 PID: 1 at lib/list_debug.c:29 __list_add_v=
alid+0x67/0x70
> [    2.457484] Call Trace:
> [    2.458171]  __pagevec_lru_add_fn+0x15f/0x2c0
> [    2.459376]  pagevec_lru_move_fn+0x87/0xd0
> [    2.460500]  ? pagevec_move_tail_fn+0x2d0/0x2d0
> [    2.461712]  lru_add_drain_cpu+0x8d/0x160
> [    2.462787]  lru_add_drain+0x18/0x20

Are you sure that was 4be497096c04 ?  I ask because there was a
version pushed to that git tree that did contain a list double-add
(due to a mismerge when shuffling patches).  I noticed it and fixed
it, and 4be497096c04 doesn't have that problem.  I also test with
CONFIG_DEBUG_LIST turned on, but this problem you hit is going to be
probabilistic because it'll depend on the timing between whatever other
list is being used and the page actually being added to the LRU.


