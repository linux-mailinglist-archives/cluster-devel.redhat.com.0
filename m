Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 74B7B16B762
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Feb 2020 02:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582595414;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LhjxeSoU9kLNe9R2E50UltSx/i+s2KTKfUbRbKev0Qo=;
	b=VVq9iuIIQBQFBr8meqXnQDW+GPH0Z097tK2xJEMCT0J4cksQ12bb5Ny6wpp59Tsi9XZUPF
	kI+haSLrJJ7z6TOhl2dniCQOEJdCdGLYzELveWq47CHESOaJ0w+/xsAYsPFbxj1gM2UYR9
	XxL6pdtq95oa7XXluiVfljjSu140hdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-77epehLeOg-jw72EzBLu7w-1; Mon, 24 Feb 2020 20:50:12 -0500
X-MC-Unique: 77epehLeOg-jw72EzBLu7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 518081084431;
	Tue, 25 Feb 2020 01:50:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2872C60BF7;
	Tue, 25 Feb 2020 01:50:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 669B338A1;
	Tue, 25 Feb 2020 01:50:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01P1o0gl002045 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 20:50:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 131101004C77; Tue, 25 Feb 2020 01:50:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1E110EE79A
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 01:49:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 624FA101A55F
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 01:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-20-zmUIylXyOJSaVxgdTPSHjw-1; Mon, 24 Feb 2020 20:49:55 -0500
X-MC-Unique: zmUIylXyOJSaVxgdTPSHjw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6PM5-0005vC-A1; Tue, 25 Feb 2020 01:49:49 +0000
Date: Mon, 24 Feb 2020 17:49:49 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200225014949.GS24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-22-willy@infradead.org>
	<20200220154741.GB19577@infradead.org>
	<20200220162404.GY24185@bombadil.infradead.org>
	<20200224221749.GA22231@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200224221749.GA22231@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01P1o0gl002045
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 21/24] iomap: Restructure
	iomap_readpages_actor
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 24, 2020 at 02:17:49PM -0800, Christoph Hellwig wrote:
> On Thu, Feb 20, 2020 at 08:24:04AM -0800, Matthew Wilcox wrote:
> > On Thu, Feb 20, 2020 at 07:47:41AM -0800, Christoph Hellwig wrote:
> > > On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > >=20
> > > > By putting the 'have we reached the end of the page' condition at t=
he end
> > > > of the loop instead of the beginning, we can remove the 'submit the=
 last
> > > > page' code from iomap_readpages().  Also check that iomap_readpage_=
actor()
> > > > didn't return 0, which would lead to an endless loop.
> > >=20
> > > I'm obviously biassed a I wrote the original code, but I find the new
> > > very much harder to understand (not that the previous one was easy, t=
his
> > > is tricky code..).
> >=20
> > Agreed, I found the original code hard to understand.  I think this is
> > easier because now cur_page doesn't leak outside this loop, so it has
> > an obvious lifecycle.
>=20
> I really don't like this patch, and would prefer if the series goes
> ahead without it, as the current sctructure works just fine even
> with the readahead changes.

Dave Chinner specifically asked me to do it this way, so please fight
amongst yourselves.


