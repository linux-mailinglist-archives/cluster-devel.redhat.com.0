Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B3B9C15FBF2
	for <lists+cluster-devel@lfdr.de>; Sat, 15 Feb 2020 02:18:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581729525;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+QYbjU/JqwWD2JY8HaV7Q/SDR89yMz6PhtQzdKmmMHM=;
	b=UpXAJ4LJl7CWAc4yvm6xc4dLBM9M8+C1O4KMMi7SqhKb34ai70+gwZ2BGwZxB0ESHjts5o
	q3iNKHl2urF8R6PDvGvsEID9F1Kd2U2WZ2a/NZyqz/rjipSxv/ubepr5sDSR9oGMapxDLH
	E5Pb5/1p4eInyFw95gvFgUHFG32BAlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-F8AQqEf3N0Sd7Kba8C7sGg-1; Fri, 14 Feb 2020 20:18:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B716A8017DF;
	Sat, 15 Feb 2020 01:18:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F9765DA7D;
	Sat, 15 Feb 2020 01:18:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5468F18089CD;
	Sat, 15 Feb 2020 01:18:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01F1G5jU026519 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 Feb 2020 20:16:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0151813AF51; Sat, 15 Feb 2020 01:16:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F156913AF59
	for <cluster-devel@redhat.com>; Sat, 15 Feb 2020 01:16:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACAD1802E5C
	for <cluster-devel@redhat.com>; Sat, 15 Feb 2020 01:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-226-8tt6-CD7M66GSOnE3mM2Sw-1; Fri, 14 Feb 2020 20:15:58 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j2m3k-00083J-V5; Sat, 15 Feb 2020 01:15:52 +0000
Date: Fri, 14 Feb 2020 17:15:52 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200215011552.GE7778@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-4-willy@infradead.org>
	<b0cdd7b4-e103-a884-d8f7-2378905f7b3b@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <b0cdd7b4-e103-a884-d8f7-2378905f7b3b@nvidia.com>
X-MC-Unique: 8tt6-CD7M66GSOnE3mM2Sw-1
X-MC-Unique: F8AQqEf3N0Sd7Kba8C7sGg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01F1G5jU026519
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 03/13] mm: Put readahead pages in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 13, 2020 at 07:36:38PM -0800, John Hubbard wrote:
> I see two distinct things happening in this patch, and I think they want =
to each be
> in their own patch:
>=20
> 1) A significant refactoring of the page loop, and
>=20
> 2) Changing the place where the page is added to the page cache. (Only th=
is one is=20
>    mentioned in the commit description.)
>=20
> We'll be more likely to spot any errors if these are teased apart.

Thanks.  I ended up splitting this patch into three, each hopefully
easier to understand.


