Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 27E28163B98
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 04:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582084078;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GT/HJggbYQwW/AitpsdX1ulQUWTjwvcKL6jO8HAX71Y=;
	b=EvvzvvC+KwC1XI2IqEiz/comqJSjoGyNhaHWittxx6QyZCd4fzDnzli+YR1pMyKPOU4B5f
	qXxW4gU7rLr1rhAqUkQSKyqtxlEiZWLyI13ube9FSmN/2hhhsXY9RmCRApsIbTbw//OvEB
	yG69wZ+DBg1gwn3JaZuo+oQF8dxN8LU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-tz_zqVoEPHSTcXE9z8T6Hw-1; Tue, 18 Feb 2020 22:47:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D044100550E;
	Wed, 19 Feb 2020 03:47:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8D3562660;
	Wed, 19 Feb 2020 03:47:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1553735B11;
	Wed, 19 Feb 2020 03:47:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J3loPD008184 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 22:47:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 29A7F2026D69; Wed, 19 Feb 2020 03:47:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2485A2063206
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:47:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F15E0803874
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-353-o5Z-r3nBPzWgML3e7DQhTQ-1; Tue, 18 Feb 2020 22:47:45 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4GKs-0001V5-0u; Wed, 19 Feb 2020 03:47:42 +0000
Date: Tue, 18 Feb 2020 19:47:41 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200219034741.GK24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-18-willy@infradead.org>
	<20200219032826.GB1075@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200219032826.GB1075@sol.localdomain>
X-MC-Unique: o5Z-r3nBPzWgML3e7DQhTQ-1
X-MC-Unique: tz_zqVoEPHSTcXE9z8T6Hw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J3loPD008184
X-loop: cluster-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 07:28:26PM -0800, Eric Biggers wrote:
> On Mon, Feb 17, 2020 at 10:45:58AM -0800, Matthew Wilcox wrote:
> > diff --git a/include/linux/mpage.h b/include/linux/mpage.h
> > index 001f1fcf9836..f4f5e90a6844 100644
> > --- a/include/linux/mpage.h
> > +++ b/include/linux/mpage.h
> > @@ -13,9 +13,9 @@
> >  #ifdef CONFIG_BLOCK
> > =20
> >  struct writeback_control;
> > +struct readahead_control;
> > =20
> > -int mpage_readpages(struct address_space *mapping, struct list_head *p=
ages,
> > -=09=09=09=09unsigned nr_pages, get_block_t get_block);
> > +void mpage_readahead(struct readahead_control *, get_block_t get_block=
);
> >  int mpage_readpage(struct page *page, get_block_t get_block);
> >  int mpage_writepages(struct address_space *mapping,
> >  =09=09struct writeback_control *wbc, get_block_t get_block);
>=20
> Can you name the 'struct readahead_control *' parameter?

What good would that do?  I'm sick of seeing 'struct page *page'.
Well, no shit it's a page.  Unless there's some actual information to
convey, leave the argument unnamed.  It should be a crime to not name
an unsigned long, but not naming the struct address_space pointer is
entirely reasonable.


