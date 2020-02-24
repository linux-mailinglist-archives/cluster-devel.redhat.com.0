Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B320716B34D
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 22:54:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582581270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yA1vdSJ/Fy/PWp5yHh/7e+MMzhxl8yU/eQOUXs+PfZ8=;
	b=icKyerQWY1JfkfYO0ayIOrwTQSvXxZNMuTOUeuna5lDdLMMUWXCLPFV4RykCYnIsvNrVs7
	3fnevG5IEsfbQT77M1i9TYPQYu/nYlXZS8NDGO04ahZA6eHLLLDwc9pKraH2k4JIrowoT+
	6P14Nl/qnZGuLCYWKF5HHGpmABeaMGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-vuxCA_n3Ndm0tF8Oz_wDjA-1; Mon, 24 Feb 2020 16:54:28 -0500
X-MC-Unique: vuxCA_n3Ndm0tF8Oz_wDjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 825531005516;
	Mon, 24 Feb 2020 21:54:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D5D51001B2C;
	Mon, 24 Feb 2020 21:54:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50FDC860EC;
	Mon, 24 Feb 2020 21:54:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLsO2B020241 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:54:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 98E422026FFE; Mon, 24 Feb 2020 21:54:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9445F2026D68
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:54:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DF32101A55A
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-jhsB32viO1eE3E0VVyCreQ-1; Mon, 24 Feb 2020 16:54:19 -0500
X-MC-Unique: jhsB32viO1eE3E0VVyCreQ-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6Lg6-0004ll-A1; Mon, 24 Feb 2020 21:54:14 +0000
Date: Mon, 24 Feb 2020 13:54:14 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200224215414.GR24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-15-willy@infradead.org>
	<SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
	<20200220134849.GV24185@bombadil.infradead.org>
	<20200220154658.GA19577@infradead.org>
	<20200220155452.GX24185@bombadil.infradead.org>
	<20200220155727.GA32232@infradead.org>
	<20200224214347.GH13895@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200224214347.GH13895@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OLsO2B020241
X-loop: cluster-devel@redhat.com
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 24, 2020 at 01:43:47PM -0800, Christoph Hellwig wrote:
> On Thu, Feb 20, 2020 at 07:57:27AM -0800, Christoph Hellwig wrote:
> > On Thu, Feb 20, 2020 at 07:54:52AM -0800, Matthew Wilcox wrote:
> > > On Thu, Feb 20, 2020 at 07:46:58AM -0800, Christoph Hellwig wrote:
> > > > On Thu, Feb 20, 2020 at 05:48:49AM -0800, Matthew Wilcox wrote:
> > > > > btrfs: Convert from readpages to readahead
> > > > >  =20
> > > > > Implement the new readahead method in btrfs.  Add a readahead_pag=
e_batch()
> > > > > to optimise fetching a batch of pages at once.
> > > >=20
> > > > Shouldn't this readahead_page_batch heper go into a separate patch =
so
> > > > that it clearly stands out?
> > >=20
> > > I'll move it into 'Put readahead pages in cache earlier' for v8 (the
> > > same patch where we add readahead_page())
> >=20
> > One argument for keeping it in a patch of its own is that btrfs appears
> > to be the only user, and Goldwyn has a WIP conversion of btrfs to iomap=
,
> > so it might go away pretty soon and we could just revert the commit.
> >=20
> > But this starts to get into really minor details, so I'll shut up now :=
)
>=20
> So looking at this again I have another comment and a question.
>=20
> First I think the implicit ARRAY_SIZE in readahead_page_batch is highly
> dangerous, as it will do the wrong thing when passing a pointer or
> function argument.

somebody already thought of that ;-)

#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(a=
rr))

> Second I wonder =D1=96f it would be worth to also switch to a batched
> operation in iomap if the xarray overhead is high enough.  That should
> be pretty trivial, but we don't really need to do it in this series.

I've also considered keeping a small array of pointers inside the
readahead_control so nobody needs to have a readahead_page_batch()
operation.  Even keeping 10 pointers in there will reduce the XArray
overhead by 90%.  But this fit the current btrfs model well, and it
lets us play with different approaches by abstracting everything away.
I'm sure this won't be the last patch that touches the readahead code ;-)


