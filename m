Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8D875119241
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Dec 2019 21:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576010398;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bsqk4VJkWtF4RP8nPi1lbsDlBgE+mpnymQwD2RqlmNg=;
	b=ZQOfRr6+66hlHKHwaz84GYj2yNFJd2cQHkVkyeo7z3on12xVu8YH/VwxjuzwMf+YJU819e
	DaSo390cyJLwnGo41l/wliFh2zZa0HEDqjHYbsMP8PbbudY3jRDNF9V5azNBfVLSvXXvCN
	SgwvmX9wqcAD7X5MpHlp+NwKgfsJ2zA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-wXI606gCPTuQtnenlcO-9A-1; Tue, 10 Dec 2019 15:39:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BE3107ACCD;
	Tue, 10 Dec 2019 20:39:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8E8600D3;
	Tue, 10 Dec 2019 20:39:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD06618095FF;
	Tue, 10 Dec 2019 20:39:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBAKdnrY024138 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 15:39:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9F8B0F8A07; Tue, 10 Dec 2019 20:39:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AF87F8A0F
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 20:39:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C965800975
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 20:39:47 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-72-Syvj2qHFN_-YVVLvpxuvmQ-1; Tue, 10 Dec 2019 15:39:43 -0500
Received: by mail-io1-f67.google.com with SMTP id i11so20215896ioi.12;
	Tue, 10 Dec 2019 12:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bsqk4VJkWtF4RP8nPi1lbsDlBgE+mpnymQwD2RqlmNg=;
	b=J067ziEEE6Cq9hzfGBMNJiMcNNhvWJg8RwZQDLJEpMyntChPkp+bAsiJUkASuUfZA6
	Wg/T59EgMjypThDkteZ6jgU8BF1keih0tB/ShMjAltDBbj5+SGphqFlfvla7Xbvz1jml
	/wza3JguHRalsPxVdQfA13ba3pMTUm+8++DzAh2fn0a9NtI/jHA0HsMz8bcUe3hFvga/
	/KoGBO9FGssPdpQC4phFBAwu5/npGnWsp0cOpYv+F/JW4cgpEh+Nbx4r+SDDK+PgF/Ly
	SxmwXIPWvSihdBMb9hV2bFuH6Vi19YX0miUBu1FqrhDw6wwqzObJjdmLO2/hBONGFaMK
	0lsQ==
X-Gm-Message-State: APjAAAVqpn8sakTcmDfglmBsbatLtnVTSe7dKXHiE+i0Tmud9jZh5j4Z
	9KRQE+3AYiWvyQOAeB1xs3INVWIev0coSJQkg5c=
X-Google-Smtp-Source: APXvYqyP0umcK6/NGlARwhAvGSO8AShQiGPMBbXCr9EH0GjTecu2zkLYdTh2RN9j3nmbWNpI/jb3aYR7yoLzCRpaAMM=
X-Received: by 2002:a5e:c314:: with SMTP id a20mr27452642iok.300.1576010382879;
	Tue, 10 Dec 2019 12:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20191210102916.842-1-agruenba@redhat.com>
	<20191210203252.GA99875@magnolia>
In-Reply-To: <20191210203252.GA99875@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 10 Dec 2019 21:39:31 +0100
Message-ID: <CAHpGcMJMgttnXu48wHnP-WqdPkuXBaFd+COKV9XiRP6VrtRUVg@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>,
	Christoph Hellwig <hch@infradead.org>
X-MC-Unique: Syvj2qHFN_-YVVLvpxuvmQ-1
X-MC-Unique: wXI606gCPTuQtnenlcO-9A-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBAKdnrY024138
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] iomap: Export iomap_page_create and
	iomap_set_range_uptodate
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Di., 10. Dez. 2019 um 21:33 Uhr schrieb Darrick J. Wong
<darrick.wong@oracle.com>:
> On Tue, Dec 10, 2019 at 11:29:16AM +0100, Andreas Gruenbacher wrote:
> > These two functions are needed by filesystems for converting inline
> > ("stuffed") inodes into non-inline inodes.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
>
> Looks fine to me... this is a 5.6 change, correct?

Yes, so there's still plenty of time to get things in place until
then. I'd like to hear from Christoph if he has any objections. In any
case, this patch isn't going to break anything.

Thanks,
Andreas


