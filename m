Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5E866168B76
	for <lists+cluster-devel@lfdr.de>; Sat, 22 Feb 2020 02:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582333820;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5ZmGs160uJZuT0TaVoB4/j9960rV3gHog0Ss/lpo5AE=;
	b=GFrdgTr5UBaB9Kxw24vloN4uC2LbQFGxH7QaJxyqrXXpYgGx7ENqKeuR5ADASwMWlY9L+e
	cHTbOoSGAqxqpbEaciCfoH1u4OAaj72M63XItkIJw66YcCSDpDnwbEsUnlAYEckgrWQGeB
	esN7VZyE200TCVlylL1Fxdjo2D9Ps/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-dbQ3wH2TNOeVKIOdTUN_Yw-1; Fri, 21 Feb 2020 20:10:18 -0500
X-MC-Unique: dbQ3wH2TNOeVKIOdTUN_Yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEA7A184B127;
	Sat, 22 Feb 2020 01:10:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA0A85D9E2;
	Sat, 22 Feb 2020 01:10:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33D631809567;
	Sat, 22 Feb 2020 01:10:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M1ABhM005047 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 20:10:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3B942166B2E; Sat, 22 Feb 2020 01:10:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F5502166B2B
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 01:10:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB2F7800295
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 01:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-382-FQmniryrPnmxt4yh6dp7nA-1; Fri, 21 Feb 2020 20:10:07 -0500
X-MC-Unique: FQmniryrPnmxt4yh6dp7nA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j5JIp-00024B-DB; Sat, 22 Feb 2020 01:09:55 +0000
Date: Fri, 21 Feb 2020 17:09:55 -0800
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200222010955.GG24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-23-willy@infradead.org>
	<20200222010353.GI9506@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200222010353.GI9506@magnolia>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M1ABhM005047
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 22/24] iomap: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Feb 21, 2020 at 05:03:53PM -0800, Darrick J. Wong wrote:
> On Wed, Feb 19, 2020 at 01:01:01PM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > Use the new readahead operation in iomap.  Convert XFS and ZoneFS to
> > use it.
> >=20
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>=20
> Ok... so from what I saw in the mm patches, this series changes
> readahead to shove the locked pages into the page cache before calling
> the filesystem's ->readahead function.  Therefore, this (and the
> previous patch) are more or less just getting rid of all the iomap
> machinery to put pages in the cache and instead pulling them out of the
> mapping prior to submitting a read bio?

Correct.

> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

Thanks!


