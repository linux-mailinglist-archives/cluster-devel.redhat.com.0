Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 617861634C7
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 22:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582061036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yQl5rUL+uTR+z/2XeWlGLsX6AxHgNwb+iFKTKjALXaM=;
	b=gPUGfkHurMT+Ai+yQOwQZZUTvqze1mU9Z54GfMrddELTAZcpUHtGmQxNWjB5kGg54MeVzH
	gJgVPobXjoGlAK1VDluV3BfPo5RJkEDyFhDRUUGUUiEdVBBVQrF4OuKdf2Bj5woPQfHA5l
	HnBhLr+XE9SpbRWHKzBVqGFMINq/JW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-GeTaG0GUP5-w2SA2eyIChQ-1; Tue, 18 Feb 2020 16:23:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB7B11005512;
	Tue, 18 Feb 2020 21:23:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88A8E19756;
	Tue, 18 Feb 2020 21:23:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4EAE18089C8;
	Tue, 18 Feb 2020 21:23:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01ILLOwI019246 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 16:21:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1B6922166B28; Tue, 18 Feb 2020 21:21:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 171CF2166B27
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 21:21:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE66518AE967
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 21:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-TgzjntqEPOKbQNfcU2AYxA-1; Tue, 18 Feb 2020 16:21:19 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4AIt-0003y5-Bi; Tue, 18 Feb 2020 21:21:15 +0000
Date: Tue, 18 Feb 2020 13:21:15 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200218212115.GG24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-2-willy@infradead.org>
	<29d2d7ca-7f2b-7eb4-78bc-f2af36c4c426@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <29d2d7ca-7f2b-7eb4-78bc-f2af36c4c426@nvidia.com>
X-MC-Unique: TgzjntqEPOKbQNfcU2AYxA-1
X-MC-Unique: GeTaG0GUP5-w2SA2eyIChQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01ILLOwI019246
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 01/19] mm: Return void from various
	readahead functions
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 01:05:29PM -0800, John Hubbard wrote:
> This is an easy review and obviously correct, so:
>=20
>     Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks

> Thoughts for the future of the API:
>=20
> I will add that I could envision another patchset that went in the
> opposite direction, and attempted to preserve the information about
> how many pages were successfully read ahead. And that would be nice
> to have (at least IMHO), even all the way out to the syscall level,
> especially for the readahead syscall.

Right, and that was where I went initially.  It turns out to be a
non-trivial aount of work to do the book-keeping to find out how many
pages were _attempted_, and since we don't wait for the I/O to complete,
we don't know how many _succeeded_, and we also don't know how many
weren't attempted because they were already there, and how many weren't
attempted because somebody else has raced with us and is going to attempt
them themselves, and how many weren't attempted because we just ran out
of memory, and decided to give up.

Also, we don't know how many pages were successfully read, and then the
system decided to evict before the program found out how many were read,
let alone before it did any action based on that.

So, given all that complexity, and the fact that nobody actually does
anything with the limited and incorrect information we tried to provide
today, I think it's fair to say that anybody who wants to start to do
anything with that information can delve into all the complexity around
"what number should we return, and what does it really mean".  In the
meantime, let's just ditch the complexity and pretense that this number
means anything.


