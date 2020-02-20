Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA95166194
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 16:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582214271;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0u2se3jmlxW+2LCsySq0t4ILCXsY7gxNV8qtvfcbYS8=;
	b=W4aLwGsXvDF+eUYw8PJuMVhUMGbSwNG8NgeeTbxO6/TyiIS5jyF+wHU/2iKs8dlyPUpvit
	qwCTyqCwsTFYAUWaW14RV4rAMNZORDnuVZ1+wUXcAi2E7Ml5pjOaf+dx/ApY6qGgvoRgzl
	QzaDM/Sj3SLOwAr4mkoGe7YSCnq+Cq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-GmQqIknaNeSaNYSOHSjxqQ-1; Thu, 20 Feb 2020 10:57:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26B3C107ACC5;
	Thu, 20 Feb 2020 15:57:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 132A991826;
	Thu, 20 Feb 2020 15:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E921E18034EA;
	Thu, 20 Feb 2020 15:57:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KFvZln027962 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 10:57:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C891120EDF; Thu, 20 Feb 2020 15:57:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2881611E1DC
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 15:57:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2442780020E
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 15:57:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-Qw8BVhF2OK6lX_cVV8RopA-1; Thu, 20 Feb 2020 10:57:31 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4oCd-0000Ht-HF; Thu, 20 Feb 2020 15:57:27 +0000
Date: Thu, 20 Feb 2020 07:57:27 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200220155727.GA32232@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-15-willy@infradead.org>
	<SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
	<20200220134849.GV24185@bombadil.infradead.org>
	<20200220154658.GA19577@infradead.org>
	<20200220155452.GX24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200220155452.GX24185@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: Qw8BVhF2OK6lX_cVV8RopA-1
X-MC-Unique: GmQqIknaNeSaNYSOHSjxqQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KFvZln027962
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v7 14/24] btrfs: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 07:54:52AM -0800, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 07:46:58AM -0800, Christoph Hellwig wrote:
> > On Thu, Feb 20, 2020 at 05:48:49AM -0800, Matthew Wilcox wrote:
> > > btrfs: Convert from readpages to readahead
> > >  =20
> > > Implement the new readahead method in btrfs.  Add a readahead_page_ba=
tch()
> > > to optimise fetching a batch of pages at once.
> >=20
> > Shouldn't this readahead_page_batch heper go into a separate patch so
> > that it clearly stands out?
>=20
> I'll move it into 'Put readahead pages in cache earlier' for v8 (the
> same patch where we add readahead_page())

One argument for keeping it in a patch of its own is that btrfs appears
to be the only user, and Goldwyn has a WIP conversion of btrfs to iomap,
so it might go away pretty soon and we could just revert the commit.

But this starts to get into really minor details, so I'll shut up now :)


