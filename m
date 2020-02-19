Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 11DE1164844
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 16:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582125422;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iUVovO/VZseYShO5a6jnrz2TT58yrqz0PA5aTHc1tI4=;
	b=R7nr2kUKDd50IqgkGzX6n2u2bNNPTtlAqwNcaYrNqTcddnW/+sIXm/9ZI4bNQf6DmKME5L
	MQooyK/J1y3Bhn3cHEdekqiq1d65IT8Tv7e2Ohusqv0qkHRZoldula6CFTXE2wNS/7lpcF
	DwB5CXqK12HDT4sDCFuxTmjzP8roIgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-UyOuNPLANmSfhTIsIV4jjg-1; Wed, 19 Feb 2020 10:17:00 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D2A78010CA;
	Wed, 19 Feb 2020 15:16:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B98E484779;
	Wed, 19 Feb 2020 15:16:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A8381809567;
	Wed, 19 Feb 2020 15:16:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JFGro7013092 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 10:16:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6FD9F2063207; Wed, 19 Feb 2020 15:16:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B2392026D69
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 15:16:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408BD8001EF
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 15:16:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-110-_zqlhtTZNACMVtMSKLNjvw-1; Wed, 19 Feb 2020 10:16:47 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4QiU-0007wz-2Y; Wed, 19 Feb 2020 14:52:46 +0000
Date: Wed, 19 Feb 2020 06:52:46 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219145246.GA29869@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-12-willy@infradead.org>
	<e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
	<20200219144117.GP24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219144117.GP24185@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: _zqlhtTZNACMVtMSKLNjvw-1
X-MC-Unique: UyOuNPLANmSfhTIsIV4jjg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JFGro7013092
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 07/19] mm: Put readahead pages in
	cache earlier
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

On Wed, Feb 19, 2020 at 06:41:17AM -0800, Matthew Wilcox wrote:
> #define readahead_for_each(rac, page)                                   \
>         while ((page =3D readahead_page(rac)))
>=20
> No more readahead_next() to forget to add to filesystems which don't use
> the readahead_for_each() iterator.  Ahem.

And then kill readahead_for_each and open code the above to make it
even more obvious?


