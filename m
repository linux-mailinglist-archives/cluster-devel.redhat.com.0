Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 50483158629
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 00:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581377407;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bzZYX8H2sqonqf8X8A1bVxZW7oAAPz6q5oJxgJuaSWE=;
	b=g1FWccZBCfU5XcoavPXwGaBHsMue4pL3HKf7Eaj2D57FqCWoFMmIcSzgmA+Y8HWy0vw44r
	1CG0lsn70c9kQkIGsfNDoqoUseCHQVHTHmFQXu/szKWq3J8LVBGTzLM9+ot+7AhunfJ209
	gVD8cryCRiLD38WWWpq8/PfUAH5dias=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-sa4kgXKfNKOksS_RXLfR6A-1; Mon, 10 Feb 2020 18:30:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C59D51005516;
	Mon, 10 Feb 2020 23:30:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 310AF60BF1;
	Mon, 10 Feb 2020 23:30:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E73F1866D1;
	Mon, 10 Feb 2020 23:29:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01ANTpl5015960 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 18:29:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 71E5210A50FA; Mon, 10 Feb 2020 23:29:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D5EF10F8E15
	for <cluster-devel@redhat.com>; Mon, 10 Feb 2020 23:29:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FF34185AB8A
	for <cluster-devel@redhat.com>; Mon, 10 Feb 2020 23:29:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-280-E_1nlVYaM8OjpuM2rsoPkQ-1;
	Mon, 10 Feb 2020 18:29:44 -0500
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C811720715;
	Mon, 10 Feb 2020 23:29:42 +0000 (UTC)
Date: Mon, 10 Feb 2020 15:29:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Message-Id: <20200210152942.2ec4d0b71851feccb7387266@linux-foundation.org>
In-Reply-To: <20200114161225.309792-2-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-2-hch@lst.de>
Mime-Version: 1.0
X-MC-Unique: E_1nlVYaM8OjpuM2rsoPkQ-1
X-MC-Unique: sa4kgXKfNKOksS_RXLfR6A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01ANTpl5015960
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, cluster-devel@redhat.com, Thomas,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>
Subject: Re: [Cluster-devel] [PATCH 01/12] mm: fix a comment in sys_swapon
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Jan 2020 17:12:14 +0100 Christoph Hellwig <hch@lst.de> wrote:

> claim_swapfile now always takes i_rwsem.
>=20
> ...
>
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3157,7 +3157,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specia=
lfile, int, swap_flags)
>  =09mapping =3D swap_file->f_mapping;
>  =09inode =3D mapping->host;
> =20
> -=09/* If S_ISREG(inode->i_mode) will do inode_lock(inode); */
> +=09/* will take i_rwsem; */
>  =09error =3D claim_swapfile(p, inode);
>  =09if (unlikely(error))
>  =09=09goto bad_swap;

http://lkml.kernel.org/r/20200206090132.154869-1-naohiro.aota@wdc.com
removes this comment altogether.  Please check that this is OK?


