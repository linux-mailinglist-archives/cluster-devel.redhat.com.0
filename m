Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ADC8A16B3AC
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 23:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582582689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pO9dQDA4bHBfFCqKX6pkDtMCHs6L8sVJI0bt3N1UMWI=;
	b=BkKPS/BKwOg9TLgNj/Tq9ILrtbxK+9UUoKNv+VvlI340jtC4g+xhnHZvUSwv5Jkq7zrSdw
	AwYjW3cIHnBt7zZuVJKuj1QnRJEIcqk3wioS+CIV7Fhsa/7PZvZCu/CJVBUkvW5b/ZuEkY
	Q4t/6CYl6pXLdT0T/Ig7kVGTrXvTFJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-Lhz80R1uOC2qI-O_vsGNuQ-1; Mon, 24 Feb 2020 17:18:08 -0500
X-MC-Unique: Lhz80R1uOC2qI-O_vsGNuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BFE4800D50;
	Mon, 24 Feb 2020 22:18:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23FCB5C13F;
	Mon, 24 Feb 2020 22:18:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E674F18095FF;
	Mon, 24 Feb 2020 22:18:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OMHwlU022152 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 17:17:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 100AD1004C63; Mon, 24 Feb 2020 22:17:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B42510C7325
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 22:17:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FBCB8007B3
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 22:17:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-457-h_D_2v_AMS6qFBRKuYExtg-1; Mon, 24 Feb 2020 17:17:53 -0500
X-MC-Unique: h_D_2v_AMS6qFBRKuYExtg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6M2v-00087x-1f; Mon, 24 Feb 2020 22:17:49 +0000
Date: Mon, 24 Feb 2020 14:17:49 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224221749.GA22231@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-22-willy@infradead.org>
	<20200220154741.GB19577@infradead.org>
	<20200220162404.GY24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200220162404.GY24185@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OMHwlU022152
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 08:24:04AM -0800, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 07:47:41AM -0800, Christoph Hellwig wrote:
> > On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >=20
> > > By putting the 'have we reached the end of the page' condition at the=
 end
> > > of the loop instead of the beginning, we can remove the 'submit the l=
ast
> > > page' code from iomap_readpages().  Also check that iomap_readpage_ac=
tor()
> > > didn't return 0, which would lead to an endless loop.
> >=20
> > I'm obviously biassed a I wrote the original code, but I find the new
> > very much harder to understand (not that the previous one was easy, thi=
s
> > is tricky code..).
>=20
> Agreed, I found the original code hard to understand.  I think this is
> easier because now cur_page doesn't leak outside this loop, so it has
> an obvious lifecycle.

I really don't like this patch, and would prefer if the series goes
ahead without it, as the current sctructure works just fine even
with the readahead changes.


