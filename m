Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id CD63D18D7EA
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 19:52:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584730355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Nhlg7hcpFcI14+CKewmgEfIv2PBKQGcgmXR9KiGX58=;
	b=i8HI6joAji/tARzuPFkQL3zg3WJWK1iImZUU8FEjWzmVVBOLbISTvU9CihBeshBpJOsFSa
	jK1Xy/P+OUnDYfMn1LdyL52S4tYBYDe8IHSRbKpXA+4ZlbfyUA2MCR+hNKc6aYks0gLkpV
	u9BoAoGXyiphNYQaFellqCeSSXQ+XvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-b8xBjKOuNvSOUXHK1eybiA-1; Fri, 20 Mar 2020 14:51:50 -0400
X-MC-Unique: b8xBjKOuNvSOUXHK1eybiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23E1E189D6C4;
	Fri, 20 Mar 2020 18:51:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FEE0912AE;
	Fri, 20 Mar 2020 18:51:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C446C18089CD;
	Fri, 20 Mar 2020 18:51:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KIpiHE031944 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 14:51:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27C061040261; Fri, 20 Mar 2020 18:51:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 240911006B06
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:51:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74FDB8CC928
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:51:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-439-NBuOv7VONwiYFhMbKKvHZQ-1;
	Fri, 20 Mar 2020 14:51:36 -0400
X-MC-Unique: NBuOv7VONwiYFhMbKKvHZQ-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 73FEA20775;
	Fri, 20 Mar 2020 18:51:35 +0000 (UTC)
Date: Fri, 20 Mar 2020 11:51:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320185134.GI851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-23-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200320142231.2402-23-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KIpiHE031944
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v9 22/25] f2fs: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 07:22:28AM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Use the new readahead operation in f2fs
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  fs/f2fs/data.c              | 47 +++++++++++++++----------------------
>  include/trace/events/f2fs.h |  6 ++---
>  2 files changed, 22 insertions(+), 31 deletions(-)
>=20

Reviewed-by: Eric Biggers <ebiggers@google.com>

> @@ -2210,7 +2204,7 @@ static int f2fs_mpage_readpages(struct address_spac=
e *mapping,
>  =09=09=09=09ret =3D f2fs_read_multi_pages(&cc, &bio,
>  =09=09=09=09=09=09=09max_nr_pages,
>  =09=09=09=09=09=09=09&last_block_in_bio,
> -=09=09=09=09=09=09=09is_readahead);
> +=09=09=09=09=09=09=09rac);

IMO it would be clearer to write 'rac !=3D NULL' here (and below) since the
argument is actually a bool, but this works too.

- Eric


