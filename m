Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1126B17058D
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Feb 2020 18:07:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582736866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IWPlWvXAzETXSOID1Hi5y0U6qqDrH+yCNT8HqqpYBjo=;
	b=PMJLTDxlhgjkkllUgXEQEMXZr58fWEZFd4XUbIsoMdS7ptlQqjelwowrGBaRXoVxrIEHCq
	3dlhFCDAeWPN8PqZ6zkXm5gY1GKNfLP/T5TVh9FjqMquL0aYNt221jVPmSuvps43UcD3hM
	bUqnziBRrABLQVpzkb03pvo+tm1bROg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-1eeDixl4PDy9Phjwb-OYDw-1; Wed, 26 Feb 2020 12:07:42 -0500
X-MC-Unique: 1eeDixl4PDy9Phjwb-OYDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D6B51005513;
	Wed, 26 Feb 2020 17:07:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 163AD60BE2;
	Wed, 26 Feb 2020 17:07:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC0508446D;
	Wed, 26 Feb 2020 17:07:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01QH7bL2021376 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 12:07:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E2A632026D69; Wed, 26 Feb 2020 17:07:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8EB2022EA7
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 17:07:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF96A85A328
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 17:07:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-40-Ik3-kXRoNxmt6Qarf3lpHA-1; Wed, 26 Feb 2020 12:07:32 -0500
X-MC-Unique: Ik3-kXRoNxmt6Qarf3lpHA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j709g-0008JU-1v; Wed, 26 Feb 2020 17:07:28 +0000
Date: Wed, 26 Feb 2020 09:07:28 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200226170728.GD22837@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
	<20200225214838.30017-26-willy@infradead.org>
	<20200226170425.GD8045@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200226170425.GD8045@magnolia>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01QH7bL2021376
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v8 25/25] iomap: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 26, 2020 at 09:04:25AM -0800, Darrick J. Wong wrote:
> > @@ -456,15 +435,8 @@ iomap_readpages(struct address_space *mapping, str=
uct list_head *pages,
> >  =09=09=09unlock_page(ctx.cur_page);
> >  =09=09put_page(ctx.cur_page);
> >  =09}
> > -
> > -=09/*
> > -=09 * Check that we didn't lose a page due to the arcance calling
> > -=09 * conventions..
> > -=09 */
> > -=09WARN_ON_ONCE(!ret && !list_empty(ctx.pages));
> > -=09return ret;
>=20
> After all the discussion about "if we still have ctx.cur_page we should
> just stop" in v7, I'm surprised that this patch now doesn't say much of
> anything, not even a WARN_ON()?

The code quoted above puts the cur_page reference.  By dropping the
odd refactoring patch there is no need to check for cur_page being
left as a special condition as that still is the normal loop exit
state and properly handled, just as in the original iomap code.


