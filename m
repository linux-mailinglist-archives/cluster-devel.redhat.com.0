Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C167916B359
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 22:54:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582581297;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ATy1gD5LKQIrUnpVVrVZiYqX2/iMThaDmFIaonRzJzw=;
	b=RFSpE+tZeH+pFqRk2RtuUs7ilbxqxTV74enOdYwlH4fJv/E5+rkBfHd2n1ZosjmICK9raR
	ew4qfUdjvjnbwvJH32uORIBIfoEySs7ExrEaeJGZ78fSGAXRBV07Xy9IF4ge7d0zZZ6Og4
	binYpfB5GgkIaT9pLwGB2B3CRZHXopk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-RxR96Nd7OeyAyl7hd4u1SA-1; Mon, 24 Feb 2020 16:54:56 -0500
X-MC-Unique: RxR96Nd7OeyAyl7hd4u1SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6FA41088396;
	Mon, 24 Feb 2020 21:54:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74166909EF;
	Mon, 24 Feb 2020 21:54:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BE1918089C8;
	Mon, 24 Feb 2020 21:54:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLspLB020279 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:54:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3991DEC4AD; Mon, 24 Feb 2020 21:54:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34E59EC4C8
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:54:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9213800299
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:54:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-L6xBWpmXPxC5KD4NM1vlRA-1; Mon, 24 Feb 2020 16:54:46 -0500
X-MC-Unique: L6xBWpmXPxC5KD4NM1vlRA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6LgY-0004om-8r; Mon, 24 Feb 2020 21:54:42 +0000
Date: Mon, 24 Feb 2020 13:54:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224215442.GB16051@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-14-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-14-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OLspLB020279
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 13/24] fs: Convert mpage_readpages to
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 01:00:52PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Implement the new readahead aop and convert all callers (block_dev,
> exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.

Looks sensible:

Reviewed-by: Christoph Hellwig <hch@lst.de>


