Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C04C516B307
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 22:44:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582580645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xb3Kv+ZkehLkg+Up6esy6epBBN75VYyw1EvUQsj37O4=;
	b=fZ+VLSsZAV/k7Vzhc+lGPxza2WTlYlzKZrVenN2lDjHA9I5jUzZUMg+f9u5mTVRWz32yQw
	fmCHVu7W1fjyHRls2Ag20a8BGhAp8zz2u/DPDnJWC5U46L3A0cqNIOMVRR7szsB+VdwdQk
	3npHFdw8k/x3DhM8WsYN0P8rNA/xq9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-CgpgTJkZOcif4DCpXtUyTg-1; Mon, 24 Feb 2020 16:44:03 -0500
X-MC-Unique: CgpgTJkZOcif4DCpXtUyTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30D86800D53;
	Mon, 24 Feb 2020 21:44:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B92F85C1D6;
	Mon, 24 Feb 2020 21:44:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E7AE860EC;
	Mon, 24 Feb 2020 21:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLhvKA019553 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:43:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 19B552166B28; Mon, 24 Feb 2020 21:43:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 159862166B27
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:43:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE6BA185A78E
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-370-5pes1ZmPMmemJ1kA-4w-ZA-1; Mon, 24 Feb 2020 16:43:52 -0500
X-MC-Unique: 5pes1ZmPMmemJ1kA-4w-ZA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6LVz-0007sB-AO; Mon, 24 Feb 2020 21:43:47 +0000
Date: Mon, 24 Feb 2020 13:43:47 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224214347.GH13895@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-15-willy@infradead.org>
	<SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
	<20200220134849.GV24185@bombadil.infradead.org>
	<20200220154658.GA19577@infradead.org>
	<20200220155452.GX24185@bombadil.infradead.org>
	<20200220155727.GA32232@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200220155727.GA32232@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OLhvKA019553
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 07:57:27AM -0800, Christoph Hellwig wrote:
> On Thu, Feb 20, 2020 at 07:54:52AM -0800, Matthew Wilcox wrote:
> > On Thu, Feb 20, 2020 at 07:46:58AM -0800, Christoph Hellwig wrote:
> > > On Thu, Feb 20, 2020 at 05:48:49AM -0800, Matthew Wilcox wrote:
> > > > btrfs: Convert from readpages to readahead
> > > >  =20
> > > > Implement the new readahead method in btrfs.  Add a readahead_page_=
batch()
> > > > to optimise fetching a batch of pages at once.
> > >=20
> > > Shouldn't this readahead_page_batch heper go into a separate patch so
> > > that it clearly stands out?
> >=20
> > I'll move it into 'Put readahead pages in cache earlier' for v8 (the
> > same patch where we add readahead_page())
>=20
> One argument for keeping it in a patch of its own is that btrfs appears
> to be the only user, and Goldwyn has a WIP conversion of btrfs to iomap,
> so it might go away pretty soon and we could just revert the commit.
>=20
> But this starts to get into really minor details, so I'll shut up now :)

So looking at this again I have another comment and a question.

First I think the implicit ARRAY_SIZE in readahead_page_batch is highly
dangerous, as it will do the wrong thing when passing a pointer or
function argument.

Second I wonder =D1=96f it would be worth to also switch to a batched
operation in iomap if the xarray overhead is high enough.  That should
be pretty trivial, but we don't really need to do it in this series.


