Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EB52F163B7B
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 04:41:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582083667;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1BGSiksbzmgOGzPfMn/BTZdI1w/j1CcwCqR2Jbz03v4=;
	b=ZTJWO/gk/tuNvMMPKNtX+eo0sl6B4X4mbiUgygPvQnUwHftgxo9zgTDVR72QqYC9MTjcc0
	yexLO17ShyonzEl2rwIzKDaARgWt+8Ay99t0ynBQrFzesipIXd+C+OHyR6TESR5yURz3My
	6bwppRFt3UcEtNzqUWe0B/Vmq453LWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-aQ13AwlvM-6AiYJIs-3TpA-1; Tue, 18 Feb 2020 22:41:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 275A7100550E;
	Wed, 19 Feb 2020 03:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5D2690761;
	Wed, 19 Feb 2020 03:41:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7BAE18095FF;
	Wed, 19 Feb 2020 03:41:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J3eudh007616 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 22:40:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9994DBF30; Wed, 19 Feb 2020 03:40:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B55E9DBF22
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:40:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0DA980020E
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:40:54 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-10-Nmxr6EvYPs2MigChPQVk6A-1; Tue, 18 Feb 2020 22:40:51 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 6AF067EAE08;
	Wed, 19 Feb 2020 14:40:49 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4GEC-0005Ys-55; Wed, 19 Feb 2020 14:40:48 +1100
Date: Wed, 19 Feb 2020 14:40:48 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219034048.GF10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-32-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-32-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LYdCFQXi c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=Q8fKmb9Ql5ESDqtk72oA:9
	a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: Nmxr6EvYPs2MigChPQVk6A-1
X-MC-Unique: aQ13AwlvM-6AiYJIs-3TpA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J3eudh007616
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 18/19] iomap: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 10:46:12AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Use the new readahead operation in iomap.  Convert XFS and ZoneFS to
> use it.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/iomap/buffered-io.c | 91 +++++++++++++++---------------------------
>  fs/iomap/trace.h       |  2 +-
>  fs/xfs/xfs_aops.c      | 13 +++---
>  fs/zonefs/super.c      |  7 ++--
>  include/linux/iomap.h  |  3 +-
>  5 files changed, 42 insertions(+), 74 deletions(-)

All pretty straight forward...

> @@ -416,6 +384,7 @@ iomap_readpages_actor(struct inode *inode, loff_t pos=
, loff_t length,
>  =09=09=09break;
>  =09=09done +=3D ret;
>  =09=09if (offset_in_page(pos + done) =3D=3D 0) {
> +=09=09=09readahead_next(ctx->rac);
>  =09=09=09if (!ctx->cur_page_in_bio)
>  =09=09=09=09unlock_page(ctx->cur_page);
>  =09=09=09put_page(ctx->cur_page);

Though now I look at the addition here, this might be better
restructured to mention how we handle partial page submission such as:

=09=09done +=3D ret;

=09=09/*
=09=09 * Keep working on a partially complete page, otherwise ready
=09=09 * the ctx for the next page to be acted on.
=09=09 */
=09=09if (offset_in_page(pos + done))
=09=09=09continue;

=09=09if (!ctx->cur_page_in_bio)
=09=09=09unlock_page(ctx->cur_page);
=09=09put_page(ctx->cur_page);
=09=09ctx->cur_page =3D NULL;
=09=09readahead_next(ctx->rac);
=09}

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


