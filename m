Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C3944164392
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 12:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582112534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2p6FSZA4xU2kcRbnuBO6xNqMkjljQXDAr6fwVYevPL4=;
	b=Oy/Qru1D6U8bS1zui13tZ8ruRYLMnKgE1XVT7AnzPQkm1S6EJLKqXeTLFW/IQNHgsGTGCK
	k5NwILJWHKBGpBoiaIPOXXTK9eriUOFmpmMvYC+8I+OfHoqIE6fGxkid36u+m+o0blJ7Y5
	CV50tE5XlzSC6SmddCTC9H/vH2N6FeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-DO4p0KPMOiW0nFZ2Eg8DVg-1; Wed, 19 Feb 2020 06:42:11 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECB7E801E66;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B2A90769;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7A2718089CE;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J3twIK008632 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 22:55:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E08D2026D67; Wed, 19 Feb 2020 03:55:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 587C52026D69
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:55:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B791803892
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:55:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-241-loqKgKaGPTqOdyLGvU87Bg-1;
	Tue, 18 Feb 2020 22:55:53 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DCCEB206DB;
	Wed, 19 Feb 2020 03:55:51 +0000 (UTC)
Date: Tue, 18 Feb 2020 19:55:50 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219035550.GE1075@sol.localdomain>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-18-willy@infradead.org>
	<20200219032826.GB1075@sol.localdomain>
	<20200219034741.GK24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219034741.GK24185@bombadil.infradead.org>
X-MC-Unique: loqKgKaGPTqOdyLGvU87Bg-1
X-MC-Unique: DO4p0KPMOiW0nFZ2Eg8DVg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J3twIK008632
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 19 Feb 2020 06:42:02 -0500
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 10/19] fs: Convert mpage_readpages to
	mpage_readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 07:47:41PM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 07:28:26PM -0800, Eric Biggers wrote:
> > On Mon, Feb 17, 2020 at 10:45:58AM -0800, Matthew Wilcox wrote:
> > > diff --git a/include/linux/mpage.h b/include/linux/mpage.h
> > > index 001f1fcf9836..f4f5e90a6844 100644
> > > --- a/include/linux/mpage.h
> > > +++ b/include/linux/mpage.h
> > > @@ -13,9 +13,9 @@
> > >  #ifdef CONFIG_BLOCK
> > > =20
> > >  struct writeback_control;
> > > +struct readahead_control;
> > > =20
> > > -int mpage_readpages(struct address_space *mapping, struct list_head =
*pages,
> > > -=09=09=09=09unsigned nr_pages, get_block_t get_block);
> > > +void mpage_readahead(struct readahead_control *, get_block_t get_blo=
ck);
> > >  int mpage_readpage(struct page *page, get_block_t get_block);
> > >  int mpage_writepages(struct address_space *mapping,
> > >  =09=09struct writeback_control *wbc, get_block_t get_block);
> >=20
> > Can you name the 'struct readahead_control *' parameter?
>=20
> What good would that do?  I'm sick of seeing 'struct page *page'.
> Well, no shit it's a page.  Unless there's some actual information to
> convey, leave the argument unnamed.  It should be a crime to not name
> an unsigned long, but not naming the struct address_space pointer is
> entirely reasonable.

It's the coding style the community has agreed on, so the tools check for.

I don't care that much myself; it just appeared like this was a mistake rat=
her
than intentional so I thought I'd point it out.

- Eric


