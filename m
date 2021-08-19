Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6860B3F228B
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 23:56:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-cVnkhWHIMRKBYbbXCzcwGQ-1; Thu, 19 Aug 2021 17:56:15 -0400
X-MC-Unique: cVnkhWHIMRKBYbbXCzcwGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AB3E1008060;
	Thu, 19 Aug 2021 21:56:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23C6460C04;
	Thu, 19 Aug 2021 21:56:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCEC94BB7B;
	Thu, 19 Aug 2021 21:56:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JLu8mR024755 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 17:56:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A2C9F117C2CD; Thu, 19 Aug 2021 21:56:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E47E117C2CA
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 21:56:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E216E800B28
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 21:56:04 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-595--zH2lDWGO8Gqv8STEQAKCQ-1; Thu, 19 Aug 2021 17:56:02 -0400
X-MC-Unique: -zH2lDWGO8Gqv8STEQAKCQ-1
Received: by mail-pg1-f174.google.com with SMTP id 17so7186786pgp.4
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 14:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oHbvW6UqiCTsRu5vWaf3qnfqFYd/iOMYaaPDkT+6n4k=;
	b=EUqozXWJDw8DGJ8jgOeKCXHa6vaxpBaLaBIpAWiWu/aWfl0xoVYyWrCtWNJrqT8J+6
	F8aZhYlNyARsKzxlH3zd2wR/+DGh2ttzuUj00nXeBSFTlaY+oblZLSvcwxPxwePCZ6ZH
	ijQZ/HrWDjPAF8o/tjYLqDZ4uNoZGSxI3UQhyPZSF9qshZV2h5lHRSkVelpFJBgUD8MT
	1m6dMrHP4XnbOD/Am0S/HgwMv6ccgJLVfKtcrVaFp+voq+59TG2byQ0kUCA+H3xEic4p
	aGl29Fa3qy14UGUk62Zcd80dOT1DqbNWkjykL9yZGomtdBLCrFlLFYmgiSR0ojpKio+Y
	ZJ6A==
X-Gm-Message-State: AOAM532ge1DqeHcUCyKdQwz+iPnK3VS3ag50O+gT03Kbtc4+i2crDIuY
	gfAPKmI5cMfBvbf0trYySDB3+shBD7QScW6rIRVPpQ==
X-Google-Smtp-Source: ABdhPJy/B2hm2/hWvC7e67tV3MfHtjJtBBELucqps5FMrdqxqVA8mCj+nC4eNLvFYInr3AywzqexVgaoo2GPMcxThDI=
X-Received: by 2002:a63:311:: with SMTP id 17mr15684252pgd.450.1629410161397; 
	Thu, 19 Aug 2021 14:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-24-hch@lst.de>
In-Reply-To: <20210809061244.1196573-24-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 19 Aug 2021 14:55:50 -0700
Message-ID: <CAPcyv4jOh8qaTBVM5tRn1S1+Bp2QCW4eoj5Qi0xRw_EwJ0q0ww@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, cluster-devel@redhat.com,
	"Darrick J. Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 23/30] fsdax: switch dax_iomap_rw to use
	iomap_iter
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 8, 2021 at 11:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Switch the dax_iomap_rw implementation to use iomap_iter.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/dax.c | 49 ++++++++++++++++++++++++-------------------------
>  1 file changed, 24 insertions(+), 25 deletions(-)

Looks straightforward,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

