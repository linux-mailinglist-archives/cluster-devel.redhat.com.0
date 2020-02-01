Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5330214F568
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Feb 2020 01:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580516774;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GmmkhfcHyORv7G7c3MhJkP2nwqdH47wGkaUXhJs/UTA=;
	b=E5qY8ne5dXA6DSrG0EdSxaECXH6exkO75K3aULo6UPUSWNGlyWS8fZaZrvJyHTB5s9St9B
	0Sloa7GJJYJZVrM+UG6eQw/ANf4rc5MlF0cyqScx4yx44T4wcDvBzedV4pyc7Hsh79l6rx
	I+TClxh+f4i805WOH3NN5XIdn80fB/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-RDkACiGhPKi1rAjCltRm3A-1; Fri, 31 Jan 2020 19:26:12 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A8F81800D41;
	Sat,  1 Feb 2020 00:26:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 158D95DD64;
	Sat,  1 Feb 2020 00:26:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F7221809565;
	Sat,  1 Feb 2020 00:26:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0110PxgY003915 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 19:25:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8700F103D20A; Sat,  1 Feb 2020 00:25:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8293F103D208
	for <cluster-devel@redhat.com>; Sat,  1 Feb 2020 00:25:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F3821800629
	for <cluster-devel@redhat.com>; Sat,  1 Feb 2020 00:25:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-388-HtX5HNVWO0OfSuvqhntwMw-1; Fri, 31 Jan 2020 19:25:54 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ixgbW-0005u5-47; Sat, 01 Feb 2020 00:25:42 +0000
Date: Fri, 31 Jan 2020 16:25:42 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200201002542.GA20648@bombadil.infradead.org>
References: <20200125013553.24899-1-willy@infradead.org>
	<20200125013553.24899-5-willy@infradead.org>
	<4e28eb80-d602-47e6-51ec-63bb39e1a296@infradead.org>
MIME-Version: 1.0
In-Reply-To: <4e28eb80-d602-47e6-51ec-63bb39e1a296@infradead.org>
X-MC-Unique: HtX5HNVWO0OfSuvqhntwMw-1
X-MC-Unique: RDkACiGhPKi1rAjCltRm3A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0110PxgY003915
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 04/12] mm: Add readahead address space
	operation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Jan 24, 2020 at 07:57:40PM -0800, Randy Dunlap wrote:
> > +``readahead``
> > +=09called by the VM to read pages associated with the address_space
> > +=09object.  The pages are consecutive in the page cache and are
> > +        locked.  The implementation should decrement the page refcount=
 after
> > +        attempting I/O on each page.  Usually the page will be unlocke=
d by
> > +        the I/O completion handler.  If the function does not attempt =
I/O on
> > +        some pages, return the number of pages which were not read so =
the
> > +        common code can unlock the pages for you.
> > +
>=20
> Please use consistent indentation (tabs).

This turned out to be not my fault.  The vim rst ... mode?  plugin?
Whatever it is, it's converting tabs to spaces!  To fix it, I had to
rename the file to .txt, make the edits, then rename it back.  This is
very poor behaviour.


